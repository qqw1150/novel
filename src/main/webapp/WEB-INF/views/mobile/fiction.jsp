<%--
  Created by IntelliJ IDEA.
  User: 14521
  Date: 2018/7/2
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.luowenit.domain.assist.FictionType" %>
<%@ page import="com.luowenit.domain.assist.FictionStatus" %>
<html style="height: 640px;">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="icon" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="shortcut icon" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="Bookmark" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="stylesheet" href="/css/m_fiction.css" type="text/css"/>
    <title>Title</title>
    <style>.none{display: none;}</style>
</head>
<body>
<div class="page page-book-detail">
    <div class="content">


        <!-- 公用头部 S -->
        <jsp:include page="header.jsp">
            <jsp:param value="/${fiction.type.index}/0/1/type.html" name="goBack"/>
            <jsp:param value="${fiction.title}" name="typename"/>
        </jsp:include>

        <!-- 书大致介绍 -->
        <div id="bookDetailWrapper" class="module module-merge book-detail-x" data-book-id="5369131804594101" data-chan-id="30013" data-author-id="5293292604760401" data-user-level="" data-book-type="" data-login-status="true">
            <img src="${fiction.cover}" class="book-cover-blur" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';">
            <div class="book-detail-info">
                <div class="book-layout">
                    <img src="${fiction.cover}" class="book-cover" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';">
                    <div class="book-cell">
                        <h2 class="book-title">${fiction.title}</h2>
                        <div class="book-rand-a"><a href="javascript:;">${fiction.author}</a></div>
                        <p class="book-meta">${fiction.type.name}</p>
                        <p class="book-meta">${fiction.status.name}</p>
                    </div>
                </div>
                <div class="book-detail-btn" data-read-status="" data-bookshelf-status="">
                    <ul class="btn-group">
                        <li class="btn-group-cell"><a href="/${fiction.id}/1/chapter.html" class="btn-normal red" id="btnReadBook">在线阅读</a></li>
                        <li class="btn-group-cell"><a href="${fiction.downUrl}" id="myCart" class="btn-normal white">TXT下载</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="module module-merge">
            <!-- 书籍摘要 -->
            <section id="bookSummary" class="book-summary enabled">
                <content>${fiction.intro}</content>
            </section>
        </div>


        <div id="catalogWrapper" data-book-id="5369131804594101">

            <div id="chapterNav" class="btn-group-tab">
                <nav class="btn-group">
                    <h3 class="btn-group-cell"><a href="javascript:" class="btn-blank active" data-rel="catelogX">目录</a></h3>
                </nav>
            </div>
            <div class="module module-merge">
                <!-- 目录页内容 -->
                <div id="catelogX" class="chapter-tab-x active">
                    <div class="module-header">
                        <div class="module-header-l">
                            <h4 class="chapter-sub-title">共<output>${pager.total}</output>章</h4>
                        </div>
                        <div class="module-header-r">
                            <core:choose>
                                <core:when test="${pager.orderBy eq 1}">
                                    <a href="javascript:void(0)" onclick="reverse(this)" alt="0" class="module-header-btn dark">倒序</a>
                                </core:when>
                                <core:otherwise>
                                    <a href="javascript:void(0)" onclick="reverse(this)" alt="1" class="module-header-btn dark">正序</a>
                                </core:otherwise>
                            </core:choose>
                        </div>
                    </div>
                    <ol id="volumes" class="chapter-ol chapter-ol-catalog">

                        <li class="chapter-bar">正文卷</li>
                        <core:forEach var="chapter" items="${fiction.chapters}">
                            <li class="chapter-li jsChapter">
                                <a href="/${fiction.id}/${chapter.number}/chapter.html" class="chapter-li-a" data-chapter-id="14412654021390836">
                                    <span class="chapter-index ">${chapter.name}</span>
                                    <!-- <span class="chapter-title">第1章 抵押</span> -->
                                    <svg class="icon icon-lock">
                                        <use xlink:href="#icon-lock"><svg id="icon-lock" viewBox="0 0 13 16" width="100%" height="100%"><g><path d="M1 14.503c0 .275.221.497.491.497H11.51c.273 0 .491-.22.491-.497V7.497A.495.495 0 0 0 11.509 7H1.49A.491.491 0 0 0 1 7.497v7.006zM1.491 6H11.51C12.332 6 13 6.672 13 7.497v7.006A1.49 1.49 0 0 1 11.509 16H1.49A1.495 1.495 0 0 1 0 14.503V7.497A1.49 1.49 0 0 1 1.491 6z"></path><path d="M2 6h9l-1 1V4.5a3.5 3.5 0 0 0-7 0V7L2 6zm0 1V4.5a4.5 4.5 0 0 1 9 0V7H2z"></path><rect x="6" y="9" width="1" height="4" rx=".5"></rect></g></svg></use>
                                    </svg>

                                </a>
                            </li>
                        </core:forEach>
                    </ol>

                    <div id="tip" class="pull-loading none" style="color: #ff7e00;text-align: center">正在努力加载中...</div>

                    <a href="#header" class="footer-backtop-circle jsBackToTop" title="返回顶部" style="opacity: 1; visibility: visible;"><svg class="icon icon-backtop"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-backtop"><svg id="icon-backtop" viewBox="0 0 12 9" width="100%" height="100%"><g><path d="M11.5 1a.5.5 0 1 0 0-1H.5a.5.5 0 0 0 0 1h11zM6.354 3.354h-.708l5.5 5.5a.5.5 0 0 0 .708-.708l-5.5-5.5a.5.5 0 0 0-.708 0l-5.5 5.5a.5.5 0 0 0 .708.708l5.5-5.5z"></path></g></svg></use></svg></a>
                </div>

                <!-- 书签页内容 -->
                <div id="bookmarkX" class="chapter-tab-x"></div>
            </div>

        </div>




        <!-- 广告模板 E -->

        <!-- 广告 -->
        <div class="mybook-game-ad">

        </div>
    </div>
</div>

<script type="text/javascript" src="/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
    function reverse(obj) {
        var alt = parseInt($(obj).attr("alt"));
        if(alt == 0){
            window.location.target="self";
            window.location.href="/${fiction.id}/1/0/fiction.html";
            $(obj).text("正序");
            $(obj).attr("alt",1);
        }else{
            window.location.target="self";
            window.location.href="/${fiction.id}/1/1/fiction.html";
            $(obj).text("倒序");
            $(obj).attr("alt",0);
        }
        return false;
    }


    /*var flag=true;
    function loadMore() {
        if(flag){
            if(pageIndex > pageCount){
                return false;
            }
            $("#load_more").text("正在拼命加载中...")
            flag=false;
            $.ajax({
                url: "/${fiction.id}/"+pageIndex+"/${pager.orderBy}/m_fiction.html",
                type: "get",
                dataType: 'json',
                success: function (data) {
                    pageIndex++;
                    //console.log(data);
                    var html = "";
                    for(var i=0;i<data.fiction.chapters.length;i++){
                        var chapter = data.fiction.chapters[i];
                        html += "<li class=\"chapter-li jsChapter\">";
                        html += "<a href=\"/"+data.fiction.id+"/"+chapter.number+"/chapter.html\" class=\"chapter-li-a\" data-chapter-id=\"14412654021390836\">";
                        html += "<span class=\"chapter-index \">"+chapter.name+"</span>";
                        html += "<svg class=\"icon icon-lock\"><use xlink:href=\"#icon-lock\"><svg id=\"icon-lock\" viewBox=\"0 0 13 16\" width=\"100%\" height=\"100%\"><g><path d=\"M1 14.503c0 .275.221.497.491.497H11.51c.273 0 .491-.22.491-.497V7.497A.495.495 0 0 0 11.509 7H1.49A.491.491 0 0 0 1 7.497v7.006zM1.491 6H11.51C12.332 6 13 6.672 13 7.497v7.006A1.49 1.49 0 0 1 11.509 16H1.49A1.495 1.495 0 0 1 0 14.503V7.497A1.49 1.49 0 0 1 1.491 6z\"></path><path d=\"M2 6h9l-1 1V4.5a3.5 3.5 0 0 0-7 0V7L2 6zm0 1V4.5a4.5 4.5 0 0 1 9 0V7H2z\"></path><rect x=\"6\" y=\"9\" width=\"1\" height=\"4\" rx=\".5\"></rect></g></svg></use></svg>";
                        html += "</a></li>";
                    }
                    $("#volumes").append(html);
                    flag=true;
                    $("#load_more").text("点击加载更多");
                    if(pageIndex > pageCount){
                        $("#load_more").remove();
                    }
                },
                error: function () {
                    console.log("出错了");
                }
            });
        }
        return false;
    }*/

    var pageIndex = parseInt("${pager.pageIndex+1}");
    var pageCount = parseInt("${pager.pageCount}");
    var flag = true;
    $(window).scroll(function () {
        var height=$(window).height();
        var theight=$(document).scrollTop();
        var rheight=$(document.body).height();
        var bheight=parseInt(rheight-theight-height);

        if (bheight < 100 && bheight > 0) {
            if (pageIndex > pageCount) {
                //console.log("end。。。")
                return false;
            }
            if (flag) {
                flag = false;
                $("#tip").removeClass("none");
                $.ajax({
                    url: "/${fiction.id}/" + pageIndex + "/${pager.orderBy}/m_fiction.html",
                    type: "get",
                    dataType: 'json',
                    success: function (data) {
                        pageIndex++;
                        //console.log(data);
                        var html = "";
                        for (var i = 0; i < data.fiction.chapters.length; i++) {
                            var chapter = data.fiction.chapters[i];
                            html += "<li class=\"chapter-li jsChapter\">";
                            html += "<a href=\"/" + data.fiction.id + "/" + chapter.number + "/chapter.html\" class=\"chapter-li-a\" data-chapter-id=\"14412654021390836\">";
                            html += "<span class=\"chapter-index \">" + chapter.name + "</span>";
                            html += "<svg class=\"icon icon-lock\"><use xlink:href=\"#icon-lock\"><svg id=\"icon-lock\" viewBox=\"0 0 13 16\" width=\"100%\" height=\"100%\"><g><path d=\"M1 14.503c0 .275.221.497.491.497H11.51c.273 0 .491-.22.491-.497V7.497A.495.495 0 0 0 11.509 7H1.49A.491.491 0 0 0 1 7.497v7.006zM1.491 6H11.51C12.332 6 13 6.672 13 7.497v7.006A1.49 1.49 0 0 1 11.509 16H1.49A1.495 1.495 0 0 1 0 14.503V7.497A1.49 1.49 0 0 1 1.491 6z\"></path><path d=\"M2 6h9l-1 1V4.5a3.5 3.5 0 0 0-7 0V7L2 6zm0 1V4.5a4.5 4.5 0 0 1 9 0V7H2z\"></path><rect x=\"6\" y=\"9\" width=\"1\" height=\"4\" rx=\".5\"></rect></g></svg></use></svg>";
                            html += "</a></li>";
                        }
                        $("#volumes").append(html);
                        flag = true;
                        $("#tip").addClass("none");
                    },
                    error: function () {
                        console.log("出错了");
                    }
                });
            }
        }
    });
</script>
</body>
</html>
