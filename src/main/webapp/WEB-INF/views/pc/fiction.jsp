<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/6/18
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/vote_popup.76a80.css" type="text/css"/>
</head>
<body>
<%@ include file="header.jsp"%>
<style>
    .pink-btn{
        background: #fd8820;
    }
    .border-btn{
        border-color: #fd8820;
        color: #fd8820;
    }
    .content-nav-wrap .nav-wrap li.act a{
        color: #fd8820;
    }
    .content-nav-wrap .nav-wrap li.act{
        border-bottom-color: #fd8820;
    }
</style>
<div class="book-detail-wrap center1020">
    <div class="book-information cf">

        <div class="book-img">
            <a class="J-getJumpUrl default" id="bookImg" data-bid="9500446903583303" data-firstchapterjumpurl=""><img src="${fiction.cover}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"></a>
        </div>
        <div class="book-info">
            <h1><em>${fiction.title}</em> <a class="writer default" target="_blank">${fiction.author} 著</a></h1>
            <p class="tag-box">
            <span class="tag">
                <i class="blue">${fiction.status.name}</i>
                <i>${fiction.type.name}</i></span>
            </p>
            <p class="intro">
                ${fiction.intro}
            </p>

            <p class="btn">
                <a class="pink-btn J-getJumpUrl " href="/${fiction.id}/1/chapter.html" id="readBtn" data-firstchapterjumpurl="//www.readnovel.com/chapter/9500446903583303/25615310121292841" data-uid="//www.readnovel.com/chapter/9500446903583303/">在线阅读</a>
                <a class="border-btn add-book" id="addBookBtn" href="${fiction.downUrl}" data-bookid="9500446903583303">TXT下载</a>
            </p>

        </div>
    </div>

    <div class="content-nav-wrap cf" data-l1="10">
        <div class="nav-wrap fl">
            <ul>
                <li class="j_catalog_block act"><a class="lang" href="javascript:" id="j_catalogPage" data-eid="qd_G15">目录</a></li>
            </ul>
        </div>
    </div>
    <div class="catalog-content-wrap catalog-page" id="j-catalogWrap">
        <div class="go-top-box" id="j-goTopBox">
            <a href="javascript:" title="回到顶部"><em class="iconfont"></em></a>
        </div>

        <div class="volume-wrap">
            <div class="volume">
                <div class="cover"></div>

                <ul class="cf">
                    <core:forEach items="${fiction.chapters}" var="chapter">
                        <li data-rid="1"><a href="/${fiction.id}/${chapter.number}/chapter.html" target="_blank" data-cid="//www.readnovel.com/chapter/9500446903583303/25615310121292841" title="${chapter.name}">${chapter.name}</a></li>
                    </core:forEach>
                </ul>
            </div>
            ${pager.build()}
        </div>
    </div>
</div>


<%@ include file="footer.jsp"%>
</body>
</html>
