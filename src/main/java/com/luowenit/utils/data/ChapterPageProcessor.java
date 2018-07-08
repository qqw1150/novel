package com.luowenit.utils.data;

import com.luowenit.domain.Chapter;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

public class ChapterPageProcessor implements PageProcessor {

    private Site site = Site.me().setRetryTimes(3);
    private Chapter chapter;

    public ChapterPageProcessor(Chapter chapter) {
        this.chapter = chapter;
    }

    @Override
    public void process(Page page) {
        String content = page.getHtml().xpath("//div[@id='content1']").toString();
        chapter.setContent(content);
    }

    @Override
    public Site getSite() {
        return site;
    }
}
