<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/7/29
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<html style="height: 640px;">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="stylesheet" href="/css/sprite-598edc8675.css" type="text/css"/>
    <title>Title</title>
    <style>
        .none{
            display: none;
        }
    </style>
</head>
<body>
<div class="page page-search">
    <!-- 搜索框 S -->
    <header class="header">
        <form id="searchForm" action="/1/search.html" method="get" class="search-form">
            <div class="search-area">
                <svg class="icon icon-search"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-search"><svg id="icon-search" viewBox="0 0 18 18" width="100%" height="100%"><path d="M12.215 12.215a6.57 6.57 0 1 1-9.29-9.29 6.57 6.57 0 0 1 9.29 9.29zm.707.707h-.707l.342.342a7.64 7.64 0 0 0 .365-.342zm.342-.365a7.57 7.57 0 1 0-.707.707l4.59 4.59c.47.471 1.178-.236.707-.708l-4.59-4.59z"></path></svg></use></svg>
                <input id="keyword" type="search" name="title" class="search-input" value="" autocomplete="off" placeholder="">
                <button id="clearSearchKeyword" type="button" class="search-reset" hidden=""><i class="icon icon-clear"><svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-clear"></use></svg></i></button>
            </div>
            <a id="closeSearchPopup" href="javascript:;" onClick="javascript :history.back(-1);" class="search-cancel">取消</a>
        </form>
    </header>
    <!-- 搜索框 E -->

    <div class="search-content">
        <div id="searchPopularWords" class="search-popular loading-animation" style="overflow: hidden; transition: height 200ms; height: 133px;">

            <div class="search-title-bar">
                <h5 class="search-title">大家都在搜</h5>
            </div>
            <div class="search-tags">
                <a href="/1/search.html?title=盛唐崛起" class="btn-line-gray jsSearchLink" data-keyword="盛唐崛起">盛唐崛起</a>
                <a href="/1/search.html?title=武动乾坤" class="btn-line-gray jsSearchLink" data-keyword="武动乾坤">武动乾坤</a>
                <a href="/1/search.html?title=黄金瞳" class="btn-line-gray jsSearchLink" data-keyword="黄金瞳">黄金瞳</a>
                <a href="/1/search.html?title=橙红年代" class="btn-line-gray jsSearchLink" data-keyword="橙红年代">橙红年代</a>
                <a href="/1/search.html?title=校花的贴身高手" class="btn-line-gray jsSearchLink" data-keyword="校花的贴身高手">校花的贴身高手</a>
            </div>

        </div>
        <div id="searchResult" class="search-detail">
            <div class="module">
                <ol id="books-0" class="book-ol book-ol-normal jsBooks" data-cached="true">
                    <core:forEach items="${list}" var="fiction">
                        <li class="book-li">
                            <a href="/${fiction.id}/1/1/fiction.html" class="book-layout">
                                <img src="${fiction.cover}" class="book-cover" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/>
                                <div class="book-cell">
                                    <div class="book-title-x">
                                        <h4 class="book-title"><mark>${fiction.title}</mark></h4>
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
            <!-- 作品搜索结果 E -->


        </div>
    </div>
    <!-- 搜索提示 E -->
</div>

<script type="text/javascript" src="/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript">

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

            var url = "/"+pageIndex+"/js_search.html";
            if(flag){
                flag=false;
                $("#tip").removeClass("none");
                $.ajax({
                    url: url,
                    type: "get",
                    dataType: 'json',
                    data:{'title':'${condition}'},
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
