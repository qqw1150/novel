package com.luowenit.utils;

import org.springframework.stereotype.Component;

import java.util.Calendar;

@Component
public class DatetimeUtil {
    public static int getDayOfMonth(){
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        c.set(year, month+1, 0); //输入类型为int类型
        return c.get(Calendar.DAY_OF_MONTH);
    }

    public static int getDayOfWeek(){
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        c.set(year, month+1, 0); //输入类型为int类型
        return c.get(Calendar.DAY_OF_WEEK);
    }

    public static int getDayOfYear(){
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        c.set(year, 0, 0); //输入类型为int类型
        return c.get(Calendar.DAY_OF_YEAR);
    }
}
