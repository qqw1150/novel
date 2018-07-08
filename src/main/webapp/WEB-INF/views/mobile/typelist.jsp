<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/7/1
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.luowenit.domain.assist.FictionType" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="icon" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="shortcut icon" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="Bookmark" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="stylesheet" href="/css/typelist.css" type="text/css"/>
    <title>Title</title>
</head>
<body>
<div class="page page-category">
    <div class="content">
        <jsp:include page="header.jsp">
            <jsp:param value="/index.html" name="goBack"/>
            <jsp:param value="分类" name="typename"/>
        </jsp:include>


        <div class="module">
            <div class="module-header booklist-module">
                <div class="module-header-l">
                    <h3 class="module-title">书籍分类</h3>
                </div>
            </div>
            <ol class="book-ol book-ol-normal">

                <core:forEach var="type" items="${typesTotal.keySet()}">
                    <li class="book-li-msg book-back">
                        <a href="/${type.index}/0/1/type.html" class="book-sort">
                            <img src="${imgs.get(type)}" class="book-pic" alt="${type.name}">
                            <div class="book-cell">
                                <div class="book-title-x">
                                    <h4 class="book-title">${type.name}</h4>
                                </div>
                                <p class="book-tags">
                                    <em>${typesTotal.get(type)}本</em>
                                </p>
                            </div>
                        </a>
                    </li>
                </core:forEach>
            </ol>
        </div>

        <!-- 页面内容 E -->
    </div>
</div>
</body>
</html>
