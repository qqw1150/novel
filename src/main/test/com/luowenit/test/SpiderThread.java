package com.luowenit.test;

import com.luowenit.utils.data.FicitonListPageProcessor;
import us.codecraft.webmagic.Spider;

import java.io.IOException;

public class SpiderThread extends Thread {
    private String url;

    public SpiderThread(String url) {
        this.url = url;
    }

    @Override
    public void run() {
        try {
            Spider.create(new FicitonListPageProcessor())
                    .addUrl(url).thread(1)
                    .run();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
