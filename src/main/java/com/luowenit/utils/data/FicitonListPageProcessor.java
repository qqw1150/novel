package com.luowenit.utils.data;

import com.luowenit.domain.Chapter;
import com.luowenit.domain.Fiction;
import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.FictionType;
import com.luowenit.domain.assist.Size;
import com.luowenit.domain.mapper.ChapterMapper;
import com.luowenit.domain.mapper.FictionMapper;
import com.sun.jmx.remote.internal.ArrayQueue;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Selectable;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class FicitonListPageProcessor implements PageProcessor {

    public static final String URL_FICTION = "https://www\\.qisuu\\.la/Shtml\\d+\\.html";
    public static final String URL_LIST = "https://www\\.qisuu\\.la/soft/sort\\d+/index_\\d+\\.html";
    public static final String DOMAIN_URL = "https://www.qisuu.la";
    private SqlSessionFactory factory;

    private Site site = Site.me().setRetryTimes(3);
    private int i;
    private ArrayDeque<Fiction> tmps = new ArrayDeque<>();

    public FicitonListPageProcessor() throws IOException {
        factory = SqlFactoryUtil.getInstance();
    }

    @Override
    public void process(Page page) {
        if (page.getUrl().regex(URL_LIST).match()) {
            List<String> urls = page.getHtml().xpath("//div[@class='listBox']/ul").links().regex("/Shtml\\d+\\.html").all();
            for (int i = 0; i < urls.size(); i++) {
                String url = DOMAIN_URL + urls.get(i);
                urls.set(i,url);
            }
            page.addTargetRequests(urls);
            List<Selectable> as = page.getHtml().xpath("//div[@class='listBox']/div[@class='tspage']/a").nodes();
            for (Selectable a : as) {
                String text = a.regex("<a href=\".*?\">(.*?)</a>",1).toString();
                if("下一页".equals(text.trim())){
                    String href = a.regex("<a href=\"(.*?)\">.*?</a>",1).toString();
                    page.addTargetRequest(DOMAIN_URL+href);
                }
            }
        }else if(page.getUrl().regex(URL_FICTION).match()){
            Fiction fiction = new Fiction();
            String title = page.getHtml().xpath("//div[@class='show']/div[1]/div[@class='detail']/div[@class='detail_info']/div[@class='detail_right']/h1/text()").regex("《(.*)》",1).toString();
            System.out.println(title);
            fiction.setTitle(title);
            String cover = DOMAIN_URL+page.getHtml().xpath("//div[@class='show']/div[1]/div[@class='detail']/div[@class='detail_pic']/img/@src").toString();
            fiction.setCover(cover);
            String clicks = page.getHtml().xpath("//div[@class='show']/div[1]/div[@class='detail']/div[@class='detail_info']/div[@class='detail_right']/ul/li[1]/text()").regex("点击次数：(.*)",1).toString();
            fiction.setClicks(Integer.parseInt(clicks));
            String size = page.getHtml().xpath("//div[@class='show']/div[1]/div[@class='detail']/div[@class='detail_info']/div[@class='detail_right']/ul/li[2]/text()").regex("文件大小：(.*)", 1).toString();
            fiction.setSize(Size.fromString(size));
            String uptime = page.getHtml().xpath("//div[@class='show']/div[1]/div[@class='detail']/div[@class='detail_info']/div[@class='detail_right']/ul/li[4]/text()").regex("更新日期：(.*)", 1).toString();
            try {
                Date date = (new SimpleDateFormat("yyyy-MM-DD HH:mm:ss")).parse(uptime);
                fiction.setUptime(date);
            } catch (ParseException e) {
                fiction.setUptime(new Date());
            }
            String status = page.getHtml().xpath("//div[@class='show']/div[1]/div[@class='detail']/div[@class='detail_info']/div[@class='detail_right']/ul/li[5]/text()").regex("连载状态：(.*)", 1).toString();
            fiction.setStatus(FictionStatus.fromString(status));
            String author = page.getHtml().xpath("//div[@class='show']/div[1]/div[@class='detail']/div[@class='detail_info']/div[@class='detail_right']/ul/li[6]/text()").regex("书籍作者：(.*)", 1).toString();
            fiction.setAuthor(author);
            String intro = page.getHtml().xpath("//div[@class='show']/div[2]/div[@class='showInfo']/p/text()").toString();
            fiction.setIntro(intro);
            String downUrl = page.getHtml().xpath("//div[@class='show']/div[3]/div[@class='showDown']/ul/li[3]/script").regex("\\'(https.*?\\.txt)\\'", 1).toString();
            fiction.setDownUrl(downUrl);
            String type = page.getHtml().xpath("//div[@class='position']/span/").regex("/soft/sort(\\d+)", 1).toString();
            fiction.setType(FictionType.fromIndex(Integer.parseInt(type)));
            addFictionOne(fiction);
            tmps.offer(fiction);
            System.out.println("queue size before:"+tmps.size());

            String url = DOMAIN_URL+page.getHtml().xpath("//div[@class='show']/div[3]/div[@class='showDown']/ul/li[1]/a/@href").toString();
            System.out.println(url);
            page.addTargetRequest(url);

            System.out.println(++i);
        }else{
            Fiction fiction = tmps.poll();
            System.out.println("queue size after:"+tmps.size());
            List<Chapter> chapters = new ArrayList<>();
            List<Selectable> nodes = page.getHtml().xpath("//div[@id='bodyabd']/div[@id='info']").nodes();
            Selectable selectable = nodes.get(nodes.size() - 1);
            List<String> contents = selectable.xpath("//div[@class='pc_list']/ul").links().all();
            List<String> names = selectable.xpath("//div[@class='pc_list']/ul/li/a/text()").all();
            for (int j = 0; j <contents.size(); j++) {
                Chapter chapter = new Chapter();
                chapter.setContent(contents.get(j));
                chapter.setName(names.get(j));
                chapter.setNumber(j+1);
                chapter.setFiction(fiction);
                chapters.add(chapter);
            }
            if(chapters.size()>0){
                addChapterMore(chapters);
            }

        }
    }

    @Override
    public Site getSite() {
        return site;
    }

    public int addFictionOne(Fiction fiction){
        SqlSession session = factory.openSession();
        FictionMapper mapper = session.getMapper(FictionMapper.class);
        int count = mapper.addOne(fiction);
        session.commit();
        session.close();
        return count;
    }

    public int addChapterMore(List<Chapter> list){
        SqlSession session = factory.openSession();
        ChapterMapper mapper = session.getMapper(ChapterMapper.class);
        int count = mapper.addMore(list);
        session.commit();
        session.close();
        return count;
    }
}
