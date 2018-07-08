package com.luowenit.domain;

import com.luowenit.domain.assist.ReadStatus;

import java.io.Serializable;

/**
 * 用户小说关系类
 */
public class UserFiction implements Serializable {
    private int id;
    private User user;
    private Fiction fiction;
    private Chapter lastest; //读到哪一章了
    private boolean isShelf; //是否加入了书架
    private ReadStatus status; //阅读状态
    private int position; //用户最新章节的位置

    public int getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Fiction getFiction() {
        return fiction;
    }

    public void setFiction(Fiction fiction) {
        this.fiction = fiction;
    }

    public Chapter getLastest() {
        return lastest;
    }

    public void setLastest(Chapter lastest) {
        this.lastest = lastest;
    }

    public boolean isShelf() {
        return isShelf;
    }

    public void setShelf(boolean shelf) {
        isShelf = shelf;
    }

    public ReadStatus getStatus() {
        return status;
    }

    public void setStatus(ReadStatus status) {
        this.status = status;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
}
