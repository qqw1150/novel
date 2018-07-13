package com.luowenit.domain.db;


import java.util.HashMap;
import java.util.Map;

public class RedisKey {
    private Map<String,String> keys = new HashMap<>();

    public Map<String, String> getKeys() {
        return keys;
    }

    public void setKeys(Map<String, String> keys) {
        this.keys = keys;
    }

    public String getKey(String name){
        return keys.get(name);
    }

    public void setKey(String name,String value){
        keys.put(name,value);
    }

}
