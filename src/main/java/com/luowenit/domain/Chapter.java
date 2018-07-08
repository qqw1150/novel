package com.luowenit.domain;


import java.io.Serializable;

public class Chapter implements Serializable {
    private int id;
    private String name;
    private int number;
    private String content;
    private Fiction fiction;
    private int fiction_id;

    public int getFiction_id() {
        return fiction_id;
    }

    public void setFiction_id(int fiction_id) {
        this.fiction_id = fiction_id;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Fiction getFiction() {
        return fiction;
    }

    public void setFiction(Fiction fiction) {
        this.fiction = fiction;
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", number=" + number +
                ", content='" + content + '\'' +
                ", fiction=" + fiction +
                '}';
    }
}
