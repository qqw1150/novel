package com.luowenit.service;

import com.luowenit.dao.ChapterDao;
import com.luowenit.domain.Chapter;
import com.luowenit.utils.http.HttpClientService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@Service
public class ChapterService {
    @Autowired
    ChapterDao chapterDao;
    @Autowired
    HttpClientService httpClientService;

    public Map<String,Object> getOne(int number, int fiction_id){
        Map<String, Object> map = new HashMap<>();
        map.put("total",chapterDao.getTotalByFiction(fiction_id));
        Chapter chapter = chapterDao.getOne(number, fiction_id);
        String content = null;
        try {
            String html = httpClientService.doGet(chapter.getContent());
            Document document = Jsoup.parse(html);
            content = document.select("div#content1").html();
        } catch (Exception e) {
            e.printStackTrace();
        }
        chapter.setContent(content);
        map.put("chapter",chapter);
        return map;
    }

    public Map<String,Object> getOneLazy(int number, int fiction_id){
        Map<String, Object> map = new HashMap<>();
        map.put("total",chapterDao.getTotalByFiction(fiction_id));
        Chapter chapter = chapterDao.getOneLazy(number, fiction_id);
        String content = null;
        try {
            String html = httpClientService.doGet(chapter.getContent());
            Document document = Jsoup.parse(html);
            content = document.select("div#content1").html();
        } catch (Exception e) {
            e.printStackTrace();
        }
        chapter.setContent(content);
        map.put("chapter",chapter);
        return map;
    }
}
