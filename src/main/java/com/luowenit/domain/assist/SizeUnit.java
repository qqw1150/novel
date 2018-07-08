package com.luowenit.domain.assist;

public enum SizeUnit {
    GB('G', Math.pow(1024, 3)), MB('M', Math.pow(1024, 2)), KB('K', Math.pow(1024, 1)), B('B', Math.pow(1024, 0));

    private final char unit;
    private final double power;


    SizeUnit(char unit, double power) {
        this.unit = unit;
        this.power = power;
    }

    public char getUnit() {
        return unit;
    }

    public double getPower() {
        return power;
    }


    /**
     * 根据字符串单位获取SizeUnit
     *
     * @param code
     * @return
     */
    public static SizeUnit fromCode(String code) {
        if (code == null)
            return null;

        code = code.trim().toUpperCase();

        if (code.equals("G") || code.equals("GB")) {
            return GB;
        } else if (code.equals("M") || code.equals("MB")) {
            return MB;
        } else if (code.equals("K") || code.equals("KB")) {
            return KB;
        } else if (code.equals("BIT") || code.equals("B")) {
            return B;
        } else {
            return null;
        }
    }
}
