package com.luowenit.domain.assist;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum FictionType {
    XUANHUAN("玄幻奇幻", 1), WUXIA("武侠仙侠", 2), NVPING("女频言情", 3),DUSHI("现代都市", 4),
    LISHI("历史军事", 5), YOUXI("游戏竞技", 6), KEHUAN("科幻灵异", 7),MEIWEN("美文同人",8);

    private String name;
    private Integer index;

    public String getName() {
        return name;
    }

    public Integer getIndex() {
        return index;
    }

    FictionType(String name, Integer index) {
        this.name = name;
        this.index = index;
    }

    /**
     * 获取所有FictionType的index
     *
     * @return
     */
    public static List<FictionType> getAllType() {
        return new ArrayList<>(Arrays.asList(
                FictionType.XUANHUAN,
                FictionType.WUXIA,
                FictionType.NVPING,
                FictionType.DUSHI,
                FictionType.LISHI,
                FictionType.YOUXI,
                FictionType.KEHUAN,
                FictionType.MEIWEN
        ));
    }

    /**
     * 根据index获取FictionType
     *
     * @param index
     * @return
     */
    public static FictionType fromIndex(Integer index) {
        if (index.equals(FictionType.XUANHUAN.getIndex())) {
            return XUANHUAN;
        } else if (index.equals(FictionType.WUXIA.getIndex())) {
            return WUXIA;
        } else if (index.equals(FictionType.NVPING.getIndex())) {
            return NVPING;
        } else if (index.equals(FictionType.DUSHI.getIndex())) {
            return DUSHI;
        } else if (index.equals(FictionType.LISHI.getIndex())) {
            return LISHI;
        } else if (index.equals(FictionType.YOUXI.getIndex())) {
            return YOUXI;
        } else if (index.equals(FictionType.KEHUAN.getIndex())) {
            return KEHUAN;
        } else if (index.equals(FictionType.MEIWEN.getIndex())) {
            return MEIWEN;
        }else {
            return null;
        }
    }

    public static boolean contains(FictionType type){
        if(type == null){
            return false;
        }
        return getAllType().contains(type);
    }

    public static boolean contains(int type){
        return getAllType().contains(FictionType.fromIndex(type));
    }

}
