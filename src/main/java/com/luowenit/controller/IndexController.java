package com.luowenit.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.luowenit.domain.Chapter;
import com.luowenit.domain.Fiction;
import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.FictionType;
import com.luowenit.domain.assist.Pager;
import com.luowenit.domain.db.RedisKey;
import com.luowenit.service.ChapterService;
import com.luowenit.service.FictionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

import static com.luowenit.utils.HttpUtil.isMobile;


@Controller
public class IndexController {

    @Autowired
    FictionService fictionService;
    @Autowired
    ChapterService chapterService;
    @Autowired
    StringRedisTemplate redisTemplate;
    @Resource(name = "redisTemplate")
    private ValueOperations<String, String> valueOperations;
    @Autowired
    private Environment env;
    @Autowired
    private RedisKey redisKey;

    @RequestMapping(value = "/index.do")
    public String index(Model model, HttpServletRequest request) {
        List<Fiction> hots = null;
        String hotsKey = redisKey.getKey("hots");
        String hotsJson = valueOperations.get(hotsKey);
        if(Objects.isNull(hotsJson)){
            hots = fictionService.getHots(50);
            valueOperations.set(hotsKey,JSON.toJSONString(hots));
        }else{
            hots = JSON.parseObject(hotsJson,new TypeReference<List<Fiction>>(){});
        }

        if (!isMobile(request)) {
            List<ArrayList<Fiction>> hotsItems = new ArrayList<>();
            ArrayList<Fiction> tmp = new ArrayList<>();
            for (int i = 0; i < 12; i++) {
                if ((i + 1) % 4 != 0) {
                    tmp.add(hots.get(i));
                } else {
                    tmp.add(hots.get(i));
                    hotsItems.add(tmp);
                    tmp = new ArrayList<>();
                }
            }
            model.addAttribute("hotsItems", hotsItems);
        } else {
            model.addAttribute("hotsItems", hots.subList(0, 10));
        }

        List<Map<Integer, List<Fiction>>> typeHotsItems = null;
        String typeHotsKey = redisKey.getKey("typehots");
        hotsJson = valueOperations.get(typeHotsKey);
        if(Objects.isNull(hotsJson)){
            typeHotsItems = fictionService.getTypeHotsItems();
            valueOperations.set(typeHotsKey,JSON.toJSONString(typeHotsItems));
        }else{
            typeHotsItems = JSON.parseObject(hotsJson,new TypeReference<List<Map<Integer, List<Fiction>>>>(){});
        }
        model.addAttribute("list", typeHotsItems);

        if (!isMobile(request)) {
            List<Fiction> sortedByWeek = hots.subList(20, 30);
            List<Fiction> sortedByMonth = hots.subList(30, 40);
            List<Fiction> sortedByYear = hots.subList(10, 20);
            List<Fiction> sortedAll = hots.subList(40, hots.size());
            model.addAttribute("sortedByWeek", sortedByWeek);
            model.addAttribute("sortedByMonth", sortedByMonth);
            model.addAttribute("sortedByYear", sortedByYear);
            model.addAttribute("sortedAll", sortedAll);
        } else {
            List<List<Fiction>> sorts = new ArrayList<>();
            sorts.add(hots.subList(20, 30));
            sorts.add(hots.subList(30, 40));
            sorts.add(hots.subList(10, 20));
            sorts.add(hots.subList(40, hots.size()));
            model.addAttribute("sorts", sorts);
        }

        List<Fiction> latests = null;
        String latestsKey = "";
        int count=0;
        if (!isMobile(request)) {
            count = 20;
            latestsKey = redisKey.getKey("latests");
            hotsJson = valueOperations.get(latestsKey);

        }else{
            count = 10;
            latestsKey = redisKey.getKey("latests_mobile");
            hotsJson = valueOperations.get(latestsKey);
        }

        if(Objects.isNull(hotsJson)){
            latests = fictionService.getLatests(count);
            valueOperations.set(latestsKey,JSON.toJSONString(latests));
        }else{
            latests = JSON.parseObject(hotsJson,new TypeReference<List<Fiction>>(){});
        }
        model.addAttribute("latests", latests);

        if (!isMobile(request)) {
            return "pc/index";
        } else {
            return "mobile/index";
        }
    }

    @RequestMapping(value = "/{type}/{status}/{page}/type.do")
    public String type(@PathVariable int type, @PathVariable int status, @PathVariable int page, Model model, HttpServletRequest request, HttpSession session) {
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/" + type + "/" + status + "/#page#/type.html");
        }
        pager.setPageIndex(page);

        HashOperations<String, String, String> hash = redisTemplate.opsForHash();
        String rKey = redisKey.getKey(type+"_"+status);
        List<Fiction> list=null;
        String json = "";
        if(page <= 5){
            setTotalWithType(type,status,pager);
            json = hash.get(rKey,String.valueOf(page));
            if(Objects.isNull(json)){
                list = getTypeData(type, status, pager);
                hash.put(rKey,String.valueOf(page),JSON.toJSONString(list));
            }else{
                list = JSON.parseObject(json,new TypeReference<List<Fiction>>(){});
            }
        }else{
            list = getTypeData(type, status, pager);
        }

        model.addAttribute("list", list);
        model.addAttribute("selectType", type);
        model.addAttribute("selectStatus", status);
        model.addAttribute("pager", pager);

        if (!isMobile(request)) {
            return "pc/type";
        } else {
            return "mobile/type";
        }

    }

    @RequestMapping(value = "/{type}/{status}/{page}/js_type.do", produces = "application/json;charset=utf-8")
    public @ResponseBody
    String m_type(@PathVariable int type, @PathVariable int status, @PathVariable int page, HttpSession session) {
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/" + type + "/" + status + "/#page#/type.html");
        }
        pager.setPageIndex(page);

        HashOperations<String, String, String> hash = redisTemplate.opsForHash();
        String rKey = redisKey.getKey(type+"_"+status);
        List<Fiction> list=null;
        String json = "";
        int total = 0;

        if(page <= 5){
            setTotalWithType(type,status,pager);
            json = hash.get(rKey,String.valueOf(page));
            if(Objects.isNull(json)){
                list = getTypeData(type, status, pager);
                hash.put(rKey,String.valueOf(page),JSON.toJSONString(list));
            }else{
                list = JSON.parseObject(json,new TypeReference<List<Fiction>>(){});
            }
        }else{
            list = getTypeData(type, status, pager);
        }

        String result = "";

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);

        Map<String, String> types = new HashMap<>();
        for (FictionType fictionType : FictionType.getAllType()) {
            types.put(fictionType.getIndex()+"", fictionType.getName());
        }
        map.put("types", types);

        Map<String, String> statuses = new HashMap<>();
        for (FictionStatus fictionStatus : FictionStatus.getAllStatus()) {
            statuses.put(fictionStatus.getIndex()+"", fictionStatus.getName());
        }
        map.put("statuses", statuses);

        result = JSON.toJSONString(map);
        return result;
    }

    private void setTotalWithType(int type, int status, Pager pager){
        int total = 0;
        if (type != 0 && status != 0) {
            FictionType oType = FictionType.fromIndex(type);
            FictionStatus oStatus = FictionStatus.fromIndex(status);
            total = fictionService.getTotalByTypeStatus(oType, oStatus, pager);
        } else if (type != 0) {
            FictionType oType = FictionType.fromIndex(type);
            total = fictionService.getTotalByType(oType, pager);
        } else if (status != 0) {
            FictionStatus oStatus = FictionStatus.fromIndex(status);
            total = fictionService.getTotalByStatus(oStatus, pager);
        } else {
            total = fictionService.getTotalByTypeStatus(null, null, pager);
        }
        pager.setTotal(total);
    }

    private List<Fiction> getTypeData(int type, int status, Pager pager) {
        List<Fiction> list = null;
        if (type != 0 && status != 0) {
            FictionType oType = FictionType.fromIndex(type);
            FictionStatus oStatus = FictionStatus.fromIndex(status);
            list = fictionService.getTypeStatusByCondition(oType, oStatus, pager);
        } else if (type != 0) {
            FictionType oType = FictionType.fromIndex(type);
            list = fictionService.getTypeByCondition(oType, pager);
        } else if (status != 0) {
            FictionStatus oStatus = FictionStatus.fromIndex(status);
            list = fictionService.getStatusByCondition(oStatus, pager);
        } else {
            list = fictionService.getTypeStatusByCondition(null, null, pager);
        }

        return list;
    }

    @RequestMapping(value = "/typelist.do")
    public String typelist(Model model) {
        model.addAttribute("typesTotal", fictionService.getTotalByType());
        return "mobile/typelist";
    }

    @RequestMapping(value = "/{id}/{page}/{orderBy}/fiction.do")
    public String fiction(@PathVariable int id, @PathVariable int page, @PathVariable int orderBy, Model model, HttpServletRequest request, HttpSession session) {
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/" + id + "/#page#/" + orderBy + "/fiction.html");
        }
        pager.setPageIndex(page);
        pager.setOrderBy(orderBy);
        pager.setSize(99);
        Fiction fiction = fictionService.getOne(id, pager, orderBy);
        model.addAttribute("fiction", fiction);
        model.addAttribute("pager", pager);

        if (!isMobile(request)) {
            return "pc/fiction";
        } else {
            model.addAttribute("referer", request.getHeader("Referer"));
            return "mobile/fiction";
        }

    }

    @RequestMapping(value = "/{id}/{page}/{orderBy}/m_fiction.do", produces = "application/json;charset=utf-8")
    public @ResponseBody
    String m_fiction(@PathVariable int id, @PathVariable int page, @PathVariable int orderBy, HttpSession session) {
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/" + id + "/#page#/fiction.html");
        }
        pager.setPageIndex(page);
        pager.setOrderBy(orderBy);
        pager.setSize(99);
        Fiction fiction = fictionService.getOne(id, pager, orderBy);

        Map<String, Object> data = new HashMap<>();
        data.put("fiction", fiction);
        data.put("pager", pager);


        return JSON.toJSONString(data);
    }


    @RequestMapping(value = "/{fiction_id}/{number}/chapter.do")
    public String chapter(@PathVariable int fiction_id, @PathVariable int number, Model model, HttpServletRequest request) {
        Map<String, Object> one = chapterService.getOne(number, fiction_id);
        Chapter chapter = (Chapter) one.get("chapter");

        int total = (int) one.get("total");
        model.addAttribute("chapter", chapter);
        String prev = "";
        String next = "";
        if (number == 1) {
            prev = "/" + fiction_id + "/" + 1 + "/chapter.html";
            next = "/" + fiction_id + "/" + (number + 1) + "/chapter.html";
        } else if (number == total) {
            prev = "/" + fiction_id + "/" + (number - 1) + "/chapter.html";
            next = "/" + fiction_id + "/" + total + "/chapter.html";
        } else {
            prev = "/" + fiction_id + "/" + (number - 1) + "/chapter.html";
            next = "/" + fiction_id + "/" + (number + 1) + "/chapter.html";
        }
        model.addAttribute("chapter", chapter);
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);

        if (!isMobile(request)) {
            return "pc/chapter";
        } else {
            return "mobile/chapter";
        }

    }

    @RequestMapping(value = "/{fiction_id}/{number}/chapter.do", produces = "application/json;charset=utf-8")
    public @ResponseBody
    String m_chapter(@PathVariable int fiction_id, @PathVariable int number) {
        Map<String, Object> one = chapterService.getOneLazy(number, fiction_id);
        Chapter chapter = (Chapter) one.get("chapter");
        return JSON.toJSONString(chapter);
    }

    @RequestMapping(value = "/{page}/search.do", method = RequestMethod.GET)
    public String search(@RequestParam String title, @PathVariable int page, Model model, HttpSession session,HttpServletRequest request) {
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/#page#/search.html?title=" + title);
        }
        pager.setPageIndex(page);

        if (!isMobile(request)) {
            List<Fiction> hots = fictionService.getHots(6);
            model.addAttribute("hots", hots);
        }

        List<Fiction> list = fictionService.getMoreByTitle(title, pager);
        model.addAttribute("list", list);
        model.addAttribute("pager", pager);
        model.addAttribute("condition", title);

        if (!isMobile(request)) {
            return "pc/search";
        } else {
            return "mobile/search";
        }
    }

    @RequestMapping(value = "/to_search.do")
    public String to_search(HttpSession session, HttpServletRequest request) {
        return "mobile/search";
    }

    @RequestMapping(value = "/{page}/js_search.do", produces = "application/json;charset=utf-8")
    public @ResponseBody String js_search(@RequestParam String title, @PathVariable int page, Model model, HttpSession session){
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/#page#/search.html?title=" + title);
        }
        pager.setPageIndex(page);

        Map<String, Object> data = new HashMap<>();

        List<Fiction> list = fictionService.getMoreByTitle(title, pager);

        Map<String, String> types = new HashMap<>();
        for (FictionType fictionType : FictionType.getAllType()) {
            types.put(fictionType.getIndex()+"", fictionType.getName());
        }
        data.put("types", types);

        Map<String, String> statuses = new HashMap<>();
        for (FictionStatus fictionStatus : FictionStatus.getAllStatus()) {
            statuses.put(fictionStatus.getIndex()+"", fictionStatus.getName());
        }
        data.put("statuses", statuses);

        data.put("list", list);
        data.put("pager", pager);
        data.put("condition", title);
        return JSON.toJSONString(data);
    }

}
