package com.luowenit.domain.assist;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Size implements Serializable{
    private double size;

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public Size(double size) {
        this.size = size;
    }

    public Size() {
    }

    public String formatSize(SizeUnit unit){
        return String.format("%.2lf"+unit.getUnit(), size / unit.getPower());
    }

    public static Size fromString(String text){
        Matcher matcher = Pattern.compile("(.*?)([a-zA-Z]+)").matcher(text);
        if(matcher.find()){
            SizeUnit unit = SizeUnit.fromCode(matcher.group(2));
            double num = Double.parseDouble(matcher.group(1)) * unit.getPower();
            return new Size(num);
        }else{
            return  null;
        }
    }
}
