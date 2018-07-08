<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/6/18
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.luowenit.domain.assist.FictionType" %>
<%@ page import="com.luowenit.domain.assist.FictionStatus" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/footer.729bd.css" type="text/css"/>
</head>
<body>
<%@ include file="header.jsp"%>
<style>
    .select-list .work-filter ul li.act{
        background: #fd8820;
    }
</style>
<div class="all-pro-wrap box-center cf">
    <div class="range-sidebar fl">
        <div class="inner-wrap">
            <div class="select-list">

                <div class="work-filter type-filter">

                    <h3>分类</h3>
                    <ul type="category">
                        <core:choose>
                            <core:when test="${selectType == null || selectType == 0}">
                                <li data-id="30013" class="act">
                            </core:when>
                            <core:otherwise>
                                <li data-id="30013">
                            </core:otherwise>
                        </core:choose>
                            <a href="/0/${selectStatus}/${pager.pageIndex}/type.html">全部<cite><i></i></cite></a>
                        </li>

                        <core:forEach items="${FictionType.getAllType()}" var="type">
                            <core:choose>
                                <core:when test="${type.index.equals(selectType)}">
                                    <li data-id="30013" class="act">
                                </core:when>
                                <core:otherwise>
                                    <li data-id="30013">
                                </core:otherwise>
                            </core:choose>
                                <a href="/${type.index}/${selectStatus}/${pager.pageIndex}/type.html">${type.name}<cite><i></i></cite></a>
                            </li>
                        </core:forEach>
                    </ul>
                </div>

                <div class="work-filter action-filter">

                    <h3>状态</h3>
                    <ul type="action">

                        <core:choose>
                            <core:when test="${selectStatus == null || selectStatus == 0}">
                                <li data-id="30013" class="act">
                            </core:when>
                            <core:otherwise>
                                <li data-id="30013">
                            </core:otherwise>
                        </core:choose>
                            <a href="/${selectType}/0/${pager.pageIndex}/type.html">全部</a>
                        </li>

                        <core:forEach items="${FictionStatus.getAllStatus()}" var="status">
                            <core:choose>
                                <core:when test="${status.index.equals(selectStatus)}">
                                    <li data-id="30013" class="act">
                                </core:when>
                                <core:otherwise>
                                    <li data-id="30013">
                                </core:otherwise>
                            </core:choose>
                                <a href="/${selectType}/${status.index}/${pager.pageIndex}/type.html">${status.name}</a>
                            </li>
                        </core:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="main-content-wrap fl" data-l1="5">

        <div class="all-book-list inner-wrap">
            <div class="right-book-list">
                <ul>
                    <core:forEach items="${list}" var="fiction">
                        <li>
                            <div class="book-img">
                                <a href="/${fiction.id}/1/1/fiction.html" target="_blank" title="${fiction.title}">
                                    <img src="${fiction.cover}" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';">
                                </a>
                            </div>
                            <div class="book-info">
                                <h3><a href="/${fiction.id}/1/1/fiction.html" target="_blank" title="${fiction.title}">${fiction.title}</a>
                                </h3>
                                <h4><a class="default">${fiction.author}</a></h4>
                                <p class="tag"><span class="org">${fiction.type.name}</span><span class="red">${fiction.status.name}</span></p>
                                <core:choose>
                                    <core:when test="${fiction.intro.length()>60}">
                                        <p class="intro">${fiction.intro.substring(0,57)}...</p>
                                    </core:when>
                                    <core:otherwise>
                                        <p class="intro">${fiction.intro}</p>
                                    </core:otherwise>
                                </core:choose>
                            </div>
                        </li>
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

