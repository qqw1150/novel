package com.luowenit.domain.assist;

/**
 * 阅读状态类
 */
public enum ReadStatus {
    NotStart("尚未阅读", 1), End("完成阅读", 3), Doing("阅读中", 2);

    private String name;
    private Integer index;

    ReadStatus(String name, Integer index) {
        this.name = name;
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public Integer getIndex() {
        return index;
    }


    public static ReadStatus fromIndex(Integer index) {
        if (index.equals(1)) {
            return NotStart;
        } else if (index.equals(2)) {
            return Doing;
        } else if (index.equals(3)) {
            return End;
        } else {
            return null;
        }
    }
}
