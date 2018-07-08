package com.luowenit.test;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;

import java.util.*;

public class Test3PageProcessor implements PageProcessor {

    private Site site = Site.me().setRetryTimes(3);

    @Override
    public void process(Page page) {
        System.out.println(page.getHtml());
    }


    @Override
    public Site getSite() {
        return site;
    }
}
