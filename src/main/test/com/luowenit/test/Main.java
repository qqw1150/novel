package com.luowenit.test;

import com.luowenit.utils.data.FicitonListPageProcessor;
import org.junit.Test;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.pipeline.JsonFilePipeline;

import java.io.IOException;

public class Main{

    public static void main(String[] args) throws IOException {
        String url = "https://www.qisuu.la/du/34/34428/6691039.html";
        Spider.create(new Test3PageProcessor())
                .addUrl(url).thread(1)
                .run();

       /* String url = "http://www.fututa.com/ceming?xmv=%E5%A5%95&xmt=1&t=zidian";
        Spider.create(new TestPageProcessor())
                .addUrl(url).thread(1)
                .addPipeline(new JsonFilePipeline("C:\\Users\\14521\\Documents\\Downloads\\json"))
                .run();*/
    }
/*
    @Test
    public void test(){
        String url = "http://mall.cnki.net/reference/ref_readerItem.aspx?bid=R200812078&recid=R2008120780000010";
        Spider.create(new Test2PageProcessor())
                .addUrl(url).thread(1)
                .run();
    }*/


}
