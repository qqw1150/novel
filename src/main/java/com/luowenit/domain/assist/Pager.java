package com.luowenit.domain.assist;

public class Pager {
    private int index;
    private int pageIndex = 1;
    private int size = 10;
    private int total;
    private String baseUrl;
    private String prevUrl;
    private String nextUrl;
    private String startUrl;
    private String endUrl;
    private int pageCount;
    private int orderBy;

    public int getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(int orderBy) {
        this.orderBy = orderBy;
    }

    public String getPrevUrl() {
        return prevUrl;
    }

    public String getNextUrl() {
        return nextUrl;
    }

    public String getStartUrl() {
        return startUrl;
    }

    public String getEndUrl() {
        return endUrl;
    }

    public int getPageCount() {
        return pageCount;
    }

    public Pager() {

    }

    public Pager(int pageIndex, int size) {
        this.pageIndex = pageIndex;
        this.size = size;
        this.index = (pageIndex - 1) * size;
    }

    public Pager(int pageIndex, int size, String baseUrl) {
        this.pageIndex = pageIndex;
        this.size = size;
        this.baseUrl = baseUrl;
        this.index = (pageIndex - 1) * size;
    }

    public String getBaseUrl() {
        return baseUrl;
    }

   /* public void setBaseUrl(String baseUrl) {
        this.baseUrl = baseUrl;
        this.startUrl = baseUrl.replaceAll("#page#", String.valueOf(1));
        if (pageIndex == 1) {
            prevUrl = baseUrl.replaceAll("#page#", String.valueOf(1));
        } else {
            prevUrl = baseUrl.replaceAll("#page#", String.valueOf(pageIndex - 1));
        }
    }*/

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
        if (total % size == 0) {
            this.pageCount = total / size;
        } else {
            this.pageCount = total / size + 1;
        }
        this.endUrl = baseUrl.replaceAll("#page#", String.valueOf(pageCount));
        if (pageIndex == pageCount) {
            nextUrl = baseUrl.replaceAll("#page#", String.valueOf(pageCount));
        }else{
            nextUrl = baseUrl.replaceAll("#page#", String.valueOf(pageIndex + 1));
        }
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
        this.index = (pageIndex - 1) * size;
        this.startUrl = baseUrl.replaceAll("#page#", String.valueOf(1));
        if (pageIndex == 1) {
            prevUrl = baseUrl.replaceAll("#page#", String.valueOf(1));
        } else {
            prevUrl = baseUrl.replaceAll("#page#", String.valueOf(pageIndex - 1));
        }
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
        this.index = (pageIndex - 1) * size;
    }

    public int getIndex() {
        return index;
    }

    public String build() {
        if(baseUrl == null || baseUrl.isEmpty()){
            throw new RuntimeException("必须设置baseUrl");
        }

        int start, end;
        String html = "";
        html +="<style>.page-box .pagination li{margin-right:5px;}</style>";
        html += "<div class=\"page-box cf\">";
        html += "<div class=\"pagination\" id=\"page-container\" data-total=\"43988\" data-size=\"10\" data-page=\"1\" data-url=\"/all?pageNum=1&amp;pageSize=10&amp;gender=2&amp;catId=30020&amp;isFinish=-1&amp;isVip=-1&amp;size=-1&amp;updT=-1&amp;orderBy=0\">";
        html += "<div class=\"lbf-pagination\">";
        html += "<ul class=\"lbf-pagination-item-list\">";
        html += "<li class=\"lbf-pagination-item\"><a href=\""+startUrl+"\" class=\"lbf-pagination-prev\">首页</a></li>";
        html += "<li class=\"lbf-pagination-item\"><a href=\""+prevUrl+"\" class=\"lbf-pagination-prev\">&lt;</a></li>";
        if(pageCount<5){
            start = 1;
            end = pageCount;
        }else{
            if (pageIndex - 2 <= 0) {
                start = 1;
                end = 5;
            } else if (pageIndex + 2 > pageCount) {
                start = pageIndex - 4;
                end = pageCount;
            } else {
                start = pageIndex - 2;
                end = pageIndex + 2;
            }
        }

        for (int i = start; i <= end; i++) {
            String url = baseUrl.replaceAll("#page#", String.valueOf(i));
            if (pageIndex == i) {
                html += "<li class=\"lbf-pagination-item\"><a data-page=\"2\" href=\""+url+"\" class=\"lbf-pagination-page  lbf-pagination-current\" >" + i + "</a></li>";
            } else {
                html += "<li class=\"lbf-pagination-item\"><a data-page=\"2\" href=\""+url+"\" class=\"lbf-pagination-page  \">" + i + "</a></li>";
            }
        }
        html += "<li class=\"lbf-pagination-item\"><a href=\""+nextUrl+"\" class=\"lbf-pagination-next \">&gt;</a></li>";
        html += "<li class=\"lbf-pagination-item\"><a href=\""+endUrl+"\" class=\"lbf-pagination-next \">尾页</a></li>";
        html += "</ul>";
        html += "<li class=\"lbf-pagination-item\"><a data-page=\"4399\" href=\"javascript:;\" class=\"lbf-pagination-page  \">" + total + "</a></li>";
        html += "<div class=\"lbf-pagination-jump\"><input id=\"pageIndex\" type=\"text\" class=\"lbf-pagination-input\" value=\""+pageIndex+"\"><a onclick=\"goForm('"+baseUrl+"',"+pageCount+")\" href=\"javascript:;\" class=\"lbf-pagination-go\"/>GO</a></div>";
        html += "</div>";
        html += "</div>";
        html += "</div>";
        html +="<script>function goForm(baseUrl,count){ var pageIndex = document.getElementById(\"pageIndex\").value;if(pageIndex > count){pageIndex = count;} if(pageIndex<1){pageIndex = 1;} var url = baseUrl.replace(/#page#/,pageIndex);window.location.href=url;}</script>";
        return html;
    }
}
