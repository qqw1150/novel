<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/6/18
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/chapter.css" type="text/css"/>
    <style>
        .header .top-head .search-wrap form input.search-box{
            border-color: #fd8820;
        }
        .header .top-head .search-wrap form label{
            border-color: #fd8820;
        }
        .header .top-head .search-wrap form label .iconfont{
            color: #fd8820;
        }
        .header .top-head .user-wrap li .iconfont{
            color: #fd8820;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="top-head box-center cf">
        <h1 class="logo" title="小说阅读网">
            <a href="/index.html"><em></em></a>
        </h1>
        <div class="search-wrap">
            <form class="cf" id="formUrl" action="/1/search.html" method="get" target="_blank">
                <input class="search-box" id="s-box" name="title" type="text" placeholder="暖婚似火：顾少，轻轻宠" autocomplete="off"
                       value="">
                <input class="submit-input" type="submit" id="searchSubmit" data-eid="">
                <label id="search-btn" class="search-btn" for="searchSubmit"><em class="iconfont"></em></label>
            </form>
        </div>
        <div class="user-wrap">
            <div class="avatar" id="j-userWrap">
                <a class="link" href="javascript:" id="j-avatar"><img src="/image/account.1e031.png"></a>
                <div class="down-drop" id="j-userDownDrop">
                    <dl>
                        <dd><a href="javascript:" id="sign-out">退出</a></dd>
                    </dl>
                </div>
            </div>
            <ul>
                <li><a class="head-shelf" href="javascript:"><em class="iconfont"></em>我的书架</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="crumbs-nav" data-l1="1">
    <a href="/index.html" target="_blank">首页</a><em class="iconfont"></em>
    <a href="/${chapter.fiction.type.index}/0/1/type.html" target="_blank" data-chanid="30013" id="j_chanId">${chapter.fiction.type.name}</a><em class="iconfont"></em>
    <a class="act" href="/${chapter.fiction_id}/1/1/fiction.html" target="_blank" id="bookImg" data-bid="10028039603751303">${chapter.fiction.title}</a>
</div>
<div class="read-main-wrap font-family01" style="font-size:18px" id="j_readMainWrap">
    <div id="j_chapterBox" data-l1="3">
        <div class="text-wrap" id="chapter-25615310121292841" data-cid="25615310121292841" data-purl="javascript:void(0);" data-nurl="//www.readnovel.com/chapter/9500446903583303/25615334801648388" data-info="0|0|25615334801648388|1|0">
            <div class="main-text-wrap">
                <div class="text-head">
                    <h3 class="j_chapterName">${chapter.name}</h3>
                </div>
                <div class="read-content j_readContent">
                    ${chapter.content}
                </div>
            </div>
        </div>
    </div>

    <div class="chapter-control dib-wrap" data-l1="3">

        <a id="j_chapterPrev" target="_self" href="${prev}">上一章</a><span>|</span>
        <a href="/${chapter.fiction_id}/1/1/fiction.html" target="_blank">目录</a><span>|</span>
        <a id="j_chapterNext" target="_self" href="${next}">下一章</a>
    </div>

    <div class="la-ball-pulse j_chapterLoad hidden">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
