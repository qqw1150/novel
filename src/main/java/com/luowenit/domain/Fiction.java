package com.luowenit.domain;

import com.luowenit.domain.assist.FictionStatus;
import com.luowenit.domain.assist.FictionType;
import com.luowenit.domain.assist.Size;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Fiction implements Serializable{
    private int id;
    private String author; //作者
    private Size size; //大小
    private String intro; //简介
    private String cover; //封面
    private int level; //等级
    private Date uptime; //更新时间
    private Date ctime; //创建时间
    private int clicks; //点击数
    private String downUrl; //下载url
    private FictionType type; //类型
    private FictionStatus status; //状态
    private String title; //标题
    private List<Chapter> chapters = new ArrayList<>(); //章节
    private Chapter latest;

    public int getId() {
        return id;
    }

    public Chapter getLatest() {
        return latest;
    }

    public void setLatest(Chapter latest) {
        this.latest = latest;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Date getUptime() {
        return uptime;
    }

    public void setUptime(Date uptime) {
        this.uptime = uptime;
    }

    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public int getClicks() {
        return clicks;
    }

    public void setClicks(int clicks) {
        this.clicks = clicks;
    }

    public String getDownUrl() {
        return downUrl;
    }

    public void setDownUrl(String downUrl) {
        this.downUrl = downUrl;
    }

    public FictionType getType() {
        return type;
    }

    public void setType(FictionType type) {
        this.type = type;
    }

    public FictionStatus getStatus() {
        return status;
    }

    public void setStatus(FictionStatus status) {
        this.status = status;
    }

    public List<Chapter> getChapters() {
        return chapters;
    }

    public void setChapters(List<Chapter> chapters) {
        this.chapters = chapters;
    }

    @Override
    public String toString() {
        return "Fiction{" +
                "id=" + id +
                ", author='" + author + '\'' +
                ", size=" + size +
                ", intro='" + intro + '\'' +
                ", cover='" + cover + '\'' +
                ", level=" + level +
                ", uptime=" + uptime +
                ", ctime=" + ctime +
                ", clicks=" + clicks +
                ", downUrl='" + downUrl + '\'' +
                ", type=" + type +
                ", status=" + status +
                ", chapterList=" + chapters +
                '}';
    }
}
