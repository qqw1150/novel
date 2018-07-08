package com.luowenit.domain.assist;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum FictionStatus {
    CONTINUE("连载",1), DONE("完本",2);

    private String name;
    private Integer index;

    FictionStatus(String name, Integer index) {
        this.name = name;
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public Integer getIndex() {
        return index;
    }

    public static FictionStatus fromString(String code) {
        if (code == null)
            return null;

        if ("连载".equals(code) || "连载中".equals(code)) {
            return CONTINUE;
        } else if ("全集".equals(code) || "完本".equals(code) || "完成".equals(code)) {
            return DONE;
        } else {
            return null;
        }
    }

    public static FictionStatus fromIndex(Integer index){
        if(index.equals(1)){
            return CONTINUE;
        }else if(index.equals(2)){
            return DONE;
        }else{
            return null;
        }
    }

    public static List<FictionStatus> getAllStatus(){
        return new ArrayList<>(Arrays.asList(CONTINUE, DONE));
    }

    public static boolean contains(FictionStatus status){
        if(status == null){
            return false;
        }
        return getAllStatus().contains(status);
    }

    public static boolean contains(int status){
        return getAllStatus().contains(FictionStatus.fromIndex(status));
    }
}
