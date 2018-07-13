<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/7/1
  Time: 12:53
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
    <link rel="stylesheet" href="/css/sprite-598edc8675.css" type="text/css"/>
    <title>Title</title>
    <style>
        .pull-loading {
            text-align: center;
            height: 40px;
            line-height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .none{
            display: none;
        }
    </style>
</head>
<body>
<div class="page page-category-detail">
    <div class="content">
        <jsp:include page="header.jsp">
            <jsp:param value="/typelist.html" name="goBack"/>
            <jsp:param value="${FictionType.fromIndex(selectType).name}" name="typename"/>
        </jsp:include>
        <!-- 更多内容的导航 S -->
        <div id="categoryDetailWrapper" data-gender="" data-cat-id="30020" class="module" data-order-type="0"></div>
        <!-- 筛选 -->
        <div class="module module-merge">
            <div class="search-filter">
                <div id="orders" class="module-filter-header sort-order-switcher category-detail-orders" style="">
                    <core:choose>
                        <core:when test="${selectStatus == null || selectStatus == 0}">
                            <a href="/${selectType}/0/${pager.pageIndex}/type.html" class="btn-tag active jsTag" data-value="0" role="tab" aria-selected="true">全部</a>
                        </core:when>
                        <core:otherwise>
                            <a href="/${selectType}/0/${pager.pageIndex}/type.html" class="btn-tag jsTag" data-value="9" role="tab">全部</a>
                        </core:otherwise>
                    </core:choose>
                    <core:forEach items="${FictionStatus.getAllStatus()}" var="status">
                        <core:choose>
                            <core:when test="${status.index.equals(selectStatus)}">
                                <a href="/${selectType}/${status.index}/${pager.pageIndex}/type.html" class="btn-tag active jsTag" data-value="0" role="tab" aria-selected="true">${status.name}</a>
                            </core:when>
                            <core:otherwise>
                                <a href="/${selectType}/${status.index}/${pager.pageIndex}/type.html" class="btn-tag jsTag" data-value="9" role="tab">${status.name}</a>
                            </core:otherwise>
                        </core:choose>
                    </core:forEach>
                </div>
            </div>

            <ol id="books-0" class="book-ol book-ol-normal jsBooks" data-cached="true" id="wrapper">
                <core:forEach items="${list}" var="fiction">
                    <li class="book-li">
                        <a href="/${fiction.id}/1/1/fiction.html" class="book-layout">
                            <img src="${fiction.cover}" class="book-cover" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/>
                            <div class="book-cell">
                                <div class="book-title-x">
                                    <div class="book-title-r"></div>
                                    <h4 class="book-title">${fiction.title}</h4>
                                </div>
                                <core:choose>
                                    <core:when test="${fiction.intro.length()>40}">
                                        <p class="book-desc">${fiction.intro.substring(0,40)}...</p>
                                    </core:when>
                                    <core:otherwise>
                                        <p class="book-desc">${fiction.intro}</p>
                                    </core:otherwise>
                                </core:choose>
                                <div class="book-meta">
                                    <div class="book-meta-l">
                                    <span class="book-author">
                                        <svg class="icon icon-human"><title>作者</title></svg>${fiction.author}
                                    </span>
                                    </div>
                                    <div class="book-meta-r">
                                    <span class="tag-small-group origin-right">
                                        <em class="tag-small yellow">${fiction.type.name}</em><em class="tag-small red">${fiction.status.name}</em>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                </core:forEach>
            </ol>
            <a href="#header" class="footer-backtop-circle jsBackToTop" title="返回顶部" style="opacity: 1; visibility: visible;"><svg class="icon icon-backtop"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-backtop"><svg id="icon-backtop" viewBox="0 0 12 9" width="100%" height="100%"><g><path d="M11.5 1a.5.5 0 1 0 0-1H.5a.5.5 0 0 0 0 1h11zM6.354 3.354h-.708l5.5 5.5a.5.5 0 0 0 .708-.708l-5.5-5.5a.5.5 0 0 0-.708 0l-5.5 5.5a.5.5 0 0 0 .708.708l5.5-5.5z"></path></g></svg></use></svg></a>
            <div id="tip" class="pull-loading none" style="color: #ff7e00;text-align: center">正在努力加载中...</div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
    /*var pageCount = parseInt("${pager.pageCount}");
    var pageIndex = parseInt("${pager.pageIndex+1}");
    var flag=true;

    function loading() {
        if(pageIndex > pageCount){
            return false;
        }
        $("#pull-loading").text("正在拼命加载中...");
        var url = "/${selectType}/${selectStatus}/"+pageIndex+"/js_type.html";
        if(flag){
            flag=false;
            $.ajax({
                url: url,
                type: "get",
                dataType: 'json',
                success: function (data) {
                    pageIndex++;
                    var html="";
                    for(var i=0;i<data.list.length;i++){
                        var fiction=data.list[i];
                        html+="";
                        html+="<li class=\"book-li\"><a href=\"/"+fiction.id+"/1/1/fiction.html\" class=\"book-layout\">";
                        html+="<img src=\""+fiction.cover+"\" class=\"book-cover\" alt=\""+fiction.title+"\" onerror=\"javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';\"/>";
                        html+="<div class=\"book-cell\"><div class=\"book-title-x\"><div class=\"book-title-r\"></div><h4 class=\"book-title\">"+fiction.title+"</h4></div>";
                        if(fiction.intro.length>40){
                            html+="<p class=\"book-desc\">"+fiction.intro.substring(0,40)+"...</p>"
                        }else{
                            html += "<p class=\"book-desc\">"+fiction.intro+"</p>";
                        }
                        html+="<div class=\"book-meta\"><div class=\"book-meta-l\"><span class=\"book-author\"><svg class=\"icon icon-human\"><title>作者</title></svg>"+fiction.author+"</span></div>";
                        html+="<div class=\"book-meta-r\"><span class=\"tag-small-group origin-right\">";
                        html+="<em class=\"tag-small yellow\">"+data['types'][fiction.type]+"</em><em class=\"tag-small red\">"+data['statuses'][fiction.status]+"</em>";
                        html+="</span></div></div></div></a></li>";
                    }
                    $("#books-0").append(html);
                    flag=true;
                    $("#pull-loading").text("点击加载更多");
                    if(pageIndex > pageCount){
                        $("#pull-loading").remove();
                    }
                },
                error: function () {
                    console.log("出错了");
                }
            });
        }
    }*/

    var pageCount = parseInt("${pager.pageCount}");
    var pageIndex = parseInt("${pager.pageIndex+1}");
    var flag=true;
    $(window).scroll( function() {
        var height=$(window).height();
        var theight=$(document).scrollTop();
        var rheight=$(document.body).height();
        var bheight=parseInt(rheight-theight-height);
        if(bheight < 100 && bheight > 0){
            if(pageIndex > pageCount){
                return false;
            }

            var url = "/${selectType}/${selectStatus}/"+pageIndex+"/js_type.html";
            if(flag){
                flag=false;
                $("#tip").removeClass("none");
                $.ajax({
                    url: url,
                    type: "get",
                    dataType: 'json',
                    success: function (data) {
                        pageIndex++;
                        var html="";
                        for(var i=0;i<data.list.length;i++){
                            var fiction=data.list[i];
                            html+="";
                            html+="<li class=\"book-li\"><a href=\"/"+fiction.id+"/1/1/fiction.html\" class=\"book-layout\">";
                            html+="<img src=\""+fiction.cover+"\" class=\"book-cover\" alt=\""+fiction.title+"\" onerror=\"javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';\"/>";
                            html+="<div class=\"book-cell\"><div class=\"book-title-x\"><div class=\"book-title-r\"></div><h4 class=\"book-title\">"+fiction.title+"</h4></div>";
                            if(fiction.intro.length>40){
                                html+="<p class=\"book-desc\">"+fiction.intro.substring(0,40)+"...</p>"
                            }else{
                                html += "<p class=\"book-desc\">"+fiction.intro+"</p>";
                            }
                            html+="<div class=\"book-meta\"><div class=\"book-meta-l\"><span class=\"book-author\"><svg class=\"icon icon-human\"><title>作者</title></svg>"+fiction.author+"</span></div>";
                            html+="<div class=\"book-meta-r\"><span class=\"tag-small-group origin-right\">";
                            html+="<em class=\"tag-small yellow\">"+data['types'][fiction.type]+"</em><em class=\"tag-small red\">"+data['statuses'][fiction.status]+"</em>";
                            html+="</span></div></div></div></a></li>";
                        }
                        $("#books-0").append(html);
                        flag=true;
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
