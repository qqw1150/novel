<%--
  Created by IntelliJ IDEA.
  User: 14521
  Date: 2018/6/29
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.luowenit.domain.assist.FictionType" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/footer.729bd.css" type="text/css"/>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="box-center">
    <div class="result-wrap cf">
        <div class="main-content-wrap fl">
            <div id="result-list" class="inner-wrap">
                <div class="book-img-text">
                    <ul>
                        <core:forEach var="fiction" items="${list}">
                            <li>
                                <div class="book-img-box">
                                    <a href="/${fiction.id}/1/1/fiction.html" target="_blank"><img src="${fiction.cover}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"></a>
                                </div>
                                <div class="book-mid-info">

                                    <h4><a href="/${fiction.id}/1/1/fiction.html" target="_blank"><cite class="red-kw">${fiction.title}</cite></a></h4>
                                    <p class="author">
                                        <a class="name default">${fiction.author}</a><em>|</em><a href="/${fiction.type.index}/${fiction.status.index}/1/type.html" target="_blank">${fiction.type.name}</a><em>|</em><span>${fiction.status.name}</span>
                                    </p>

                                    <core:choose>
                                        <core:when test="${fiction.intro.length()>70}">
                                            <p class="intro">${fiction.intro.substring(0,70)}...</p>
                                        </core:when>
                                        <core:otherwise>
                                            <p class="intro">${fiction.intro}</p>
                                        </core:otherwise>
                                    </core:choose>
                                    <p class="update">
                                        <a href="/${fiction.id}/${fiction.latest.number}/chapter.html" target="_blank">${fiction.latest.name}</a><em>·</em><span><fmt:formatDate value="${fiction.uptime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
                                </div>
                                <div class="book-right-info">
                                    <p class="btn">
                                        <a class="pink-btn" href="/${fiction.id}/1/1/fiction.html" target="_blank">书籍详情</a>
                                        <a class="add-book border-btn" href="javascript:" data-bookid="22281178000299202">加入书架</a>
                                    </p>
                                </div>
                            </li>
                        </core:forEach>
                    </ul>
                </div>
                ${pager.build()}
            </div>

        </div>
        <div class="right-side-wrap fr">
            <div class="other-rec-wrap inner-wrap">
                <h3 class="lang">大家都在搜</h3>
                <ul>
                    <core:forEach var="item" items="${hots}">
                        <li>
                            <div class="img-box">
                                <a href="/${item.id}/1/1/fiction.html" target="_blank" data-bid="9500446903583303"><img src="${item.cover}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"></a>
                            </div>
                            <div class="book-info">
                                <h4><a href="/${item.id}/1/1/fiction.html" target="_blank">${item.title}</a></h4>
                                <p class="author"><a href="javascript:void(0);" target="_blank">${item.author}</a></p>
                                <core:choose>
                                    <core:when test="${item.intro.length()>20}">
                                        <p class="intro">${item.intro.substring(0,20)}...</p>
                                    </core:when>
                                    <core:otherwise>
                                        <p class="intro">${item.intro}</p>
                                    </core:otherwise>
                                </core:choose>
                            </div>
                        </li>
                    </core:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
