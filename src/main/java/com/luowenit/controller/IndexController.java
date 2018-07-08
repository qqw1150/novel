package com.luowenit.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.luowenit.domain.Chapter;
import com.luowenit.domain.Fiction;
import com.luowenit.domain.User;
import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.FictionType;
import com.luowenit.domain.assist.Pager;
import com.luowenit.service.ChapterService;
import com.luowenit.service.FictionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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

    @RequestMapping(value = "/index.do")
    public String index(Model model, HttpServletRequest request) throws IOException {
        model.addAttribute("user",new User());
        List<Fiction> hots = null;
        ObjectMapper mapper = new ObjectMapper();
        String hotsKey = env.getProperty("website.novel.fiction.hots");
        String hotsJson = valueOperations.get(hotsKey);
        try {
            if ("".equals(hotsJson) || Objects.isNull(hotsJson)) {
                hots = fictionService.getHots(50);
                valueOperations.set(hotsKey,mapper.writeValueAsString(hots));
            } else {
                CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, Fiction.class);
                hots = mapper.readValue(hotsJson, collectionType);
            }
        } catch (JsonProcessingException e) {
        } catch (IOException e) {
            hots = fictionService.getHots(50);
            try {
                valueOperations.set(hotsKey,mapper.writeValueAsString(hots));
            } catch (JsonProcessingException e1) {
            }
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
        String typeHotsKey = env.getProperty("website.novel.fiction.typehots");
        hotsJson = valueOperations.get(typeHotsKey);
        try {
            if ("".equals(hotsJson) || Objects.isNull(hotsJson)) {
                typeHotsItems = fictionService.getTypeHotsItems();
                valueOperations.set(typeHotsKey,mapper.writeValueAsString(typeHotsItems));
            }else{
                CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, Map.class);
                typeHotsItems = mapper.readValue(hotsJson, collectionType);
            }
        }catch (JsonProcessingException e) {
        } catch (IOException e) {
            typeHotsItems = fictionService.getTypeHotsItems();
            try {
                valueOperations.set(typeHotsKey,mapper.writeValueAsString(typeHotsItems));
            } catch (JsonProcessingException e1) { }
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
        String latestsKey = env.getProperty("website.novel.fiction.latests");
        String latestsMobileKey = env.getProperty("website.novel.fiction.latests.mobile");
        if (!isMobile(request)) {
            hotsJson = valueOperations.get(latestsKey);
        }else{
            hotsJson = valueOperations.get(latestsMobileKey);
        }

        try {
            if ("".equals(hotsJson) || Objects.isNull(hotsJson)) {
                if (!isMobile(request)) {
                    latests = fictionService.getLatests(20);
                    String s = mapper.writeValueAsString(latests);
                    valueOperations.set(latestsKey,s);
                } else {
                    latests = fictionService.getLatests(10);
                    valueOperations.set(latestsMobileKey,mapper.writeValueAsString(latests));
                }
            }else{
                CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, Fiction.class);
                latests = mapper.readValue(hotsJson, collectionType);
            }
        }catch (JsonProcessingException e) {
        } catch (IOException e) {
            if (!isMobile(request)) {
                latests = fictionService.getLatests(20);
                try {
                    valueOperations.set(latestsKey,mapper.writeValueAsString(latests));
                } catch (JsonProcessingException e1) {
                    e1.printStackTrace();
                }
            } else {
                latests = fictionService.getLatests(10);
                try {
                    valueOperations.set(latestsMobileKey,mapper.writeValueAsString(latests));
                } catch (JsonProcessingException e1) {
                    e1.printStackTrace();
                }
            }
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
        List<Fiction> list = getTypeData(type, status, pager);
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
        List<Fiction> list = getTypeData(type, status, pager);
        ObjectMapper mapper = new ObjectMapper();
        String result = "";

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);

        Map<FictionType, String> types = new HashMap<>();
        for (FictionType fictionType : FictionType.getAllType()) {
            types.put(fictionType, fictionType.getName());
        }
        map.put("types", types);

        Map<FictionStatus, String> statuses = new HashMap<>();
        for (FictionStatus fictionStatus : FictionStatus.getAllStatus()) {
            statuses.put(fictionStatus, fictionStatus.getName());
        }
        map.put("statuses", statuses);

        try {
            result = mapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return result;
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
        Map<FictionType, String> imgs = new HashMap<>();
        imgs.put(FictionType.XUANHUAN, "//qidian.qpic.cn/qdbimg/349573/c_25396310000735801/90");
        imgs.put(FictionType.WUXIA, "//qidian.qpic.cn/qdbimg/349573/c_22278759000152102/90");
        imgs.put(FictionType.DUSHI, "//qidian.qpic.cn/qdbimg/349573/c_7920237703552803/90");
        imgs.put(FictionType.LISHI, "//qidian.qpic.cn/qdbimg/349573/c_22627120000545902/90");
        imgs.put(FictionType.YOUXI, "//qidian.qpic.cn/qdbimg/349573/c_25421978000077401/90");
        imgs.put(FictionType.KEHUAN, "//qidian.qpic.cn/qdbimg/349573/c_5873763503937503/90");
        imgs.put(FictionType.MEIWEN, "//qidian.qpic.cn/qdbimg/349573/c_6120394504094103/90");
        imgs.put(FictionType.NVPING, "//qidian.qpic.cn/qdbimg/349573/c_9500446903583303/90");
        model.addAttribute("imgs", imgs);
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

        ObjectMapper mapper = new ObjectMapper();
        String result = "";
        try {
            result = mapper.writeValueAsString(data);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return result;
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
        ObjectMapper mapper = new ObjectMapper();
        String result = "";
        try {
            result = mapper.writeValueAsString(chapter);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping(value = "/{page}/search.do", method = RequestMethod.GET)
    public String search(@RequestParam String title, @PathVariable int page, Model model, HttpSession session) {
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/#page#/search.html?title=" + title);
        }
        pager.setPageIndex(page);
        List<Fiction> hots = fictionService.getHots(6);
        model.addAttribute("hots", hots);
        List<Fiction> list = fictionService.getMoreByTitle(title, pager);
        model.addAttribute("list", list);
        model.addAttribute("pager", pager);
        return "pc/search";
    }

}
