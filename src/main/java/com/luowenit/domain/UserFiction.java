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
    private ReadStatus status; //阅读状态

    public UserFiction() {
    }

    public UserFiction(int user_id, int fiction_id, int chapter_num,int chapter_id) {
        User user = new User();
        user.setId(user_id);
        this.setUser(user);
        Fiction fiction = new Fiction();
        fiction.setId(fiction_id);
        this.fiction=fiction;
        Chapter chapter = new Chapter();
        chapter.setNumber(chapter_num);
        chapter.setId(chapter_id);
        this.lastest = chapter;
        this.status = ReadStatus.NotStart;
    }

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

    public ReadStatus getStatus() {
        return status;
    }

    public void setStatus(ReadStatus status) {
        this.status = status;
    }

}
