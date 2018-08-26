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
    private Chapter chapter; //读到哪一章了
    private int top;

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
        this.chapter = chapter;
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

    public Chapter getChapter() {
        return chapter;
    }

    public void setChapter(Chapter chapter) {
        this.chapter = chapter;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTop() {
        return top;
    }

    public void setTop(int top) {
        this.top = top;
    }

    @Override
    public String toString() {
        return "UserFiction{" +
                "id=" + id +
                ", user=" + user +
                ", fiction=" + fiction +
                ", chapter=" + chapter +
                ", top=" + top +
                '}';
    }
}
