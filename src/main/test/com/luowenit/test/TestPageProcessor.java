package com.luowenit.test;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;

import java.util.*;

public class TestPageProcessor implements PageProcessor {

    private Site site = Site.me().setRetryTimes(3);
    List<Map<String, Object>> list = new ArrayList<>();
    List<String> urls = new ArrayList<>();

    @Override
    public void process(Page page) {
        Map<String,Object> map = new HashMap<>();

        List<Selectable> selectable = page.getHtml().xpath("//div[@class='zi_div']/div[@class='ziRight']/ul/li").nodes();

        String s1 = selectable.get(0).xpath("//li/text()").toString();
        List<String> s1s = Arrays.asList(s1.split("　"));
        map.put("py",s1s.get(0));
        map.put("jt_bihua",s1s.get(1));
        map.put("shoubu",s1s.get(2));

        s1 = selectable.get(1).xpath("//li/text()").toString();
        s1s = Arrays.asList(s1.split("　"));
        map.put("fanti",s1s.get(0));
        map.put("ft_bihua",s1s.get(1));
        map.put("kxzd_bihua",s1s.get(2));

        List<String> all = selectable.get(2).xpath("//b/text()").all();
        map.put("wuxing",all.get(1));
        map.put("tuijian",all.get(2));

        String str= selectable.get(3).xpath("//span/@class").regex("(\\d+)",1).toString();
        map.put("lxd",str);

        str= selectable.get(4).xpath("//span/@class").regex("(\\d+)",1).toString();
        map.put("zmd",str);

        selectable = page.getHtml().xpath("//div[@class='zi_div']/div[@class='ziInfo']/p").nodes();
        str = selectable.get(0).regex("<p><b>(.*?)</b>(.*?)</p>",2).toString();
        map.put("ziyi",str);

        all = selectable.get(1).xpath("//b/text()").regex("(\\d+)",1).all();
        map.put("zi_use",all);

        list.add(map);
        page.putField("data",list);
    }


    @Override
    public Site getSite() {
        return site;
    }
}
