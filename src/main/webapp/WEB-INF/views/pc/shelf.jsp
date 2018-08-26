<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/8/26
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" type="image/x-icon" href="https://qidian.gtimg.com/readnovel/favicon/favicon.ico">
    <link rel="Bookmark" type="image/x-icon" href="https://qidian.gtimg.com/readnovel/favicon/favicon.ico">
    <link rel="stylesheet" href="/css/shelf.css" type="text/css"/>
    <link rel="stylesheet" href="/css/Panel.css" type="text/css"/>
    <script src="/js/push.js"></script>
    <script src="/js/stats.js"
            name="MTAH5" sid="500406364" cid="500406409"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="main-wrap box-center cf">

    <div class="right-content fl" style="position: relative;left: 50%;margin-left: -385px">
        <div class="content-wrap mb20">
            <div class="content-head cf">
                <div class="head-tab fl">
                    <core:choose>
                        <core:when test="${empty total}">
                            <h1 class="lang">我的书架（0）</h1>
                        </core:when>
                        <core:otherwise>
                            <h1 class="lang">我的书架（${total}）</h1>
                        </core:otherwise>
                    </core:choose>

                </div>
            </div>
            <div class="bookshelf-list-wrap">

                <div class="bookshelf-list-wrap" id="j-bookshelfList">
                    <table class="shelf-table">
                        <colgroup>
                            <col width="20px">
                            <col width="20px">
                            <col width="240px">
                            <col width="370px">
                            <col width="100px">
                        </colgroup>
                        <tbody>

                        <core:choose>
                            <core:when test="${empty list}">
                                <div style="width: 200px;margin-top: 50px;position: relative;left: 50%;margin-left: -100px;font-size: 20px;">书架为空</div>
                            </core:when>
                            <core:otherwise>
                                <core:if test="${top != null && pager.pageIndex == 1}">
                                <tr class="" data-bookid="5369131804594101">
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <label class="label">
                                            <div class="cf">
                                                <div class="book-img">
                                                    <a href="/${top.fiction.id}/${top.chapter.number}/chapter.html" target="_blank">
                                                        <img src="${top.fiction.cover}" alt="${top.fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/>

                                                        <i class="fin">已完结</i>
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <h3 style="overflow: visible"><a href="/${top.fiction.id}/${top.chapter.number}/chapter.html" target="_blank">${top.fiction.title}</a></h3>
                                                    <p>笑寒烟</p>
                                                </div>
                                            </div>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="label">
                                            <div class="chapter">
                                                <h4>
                                                    <a href="/${top.fiction.id}/${top.chapter.number}/chapter.html" target="_blank">读至 ${top.chapter.name}</a>
                                                </h4>
                                            </div>
                                        </label>
                                    </td>
                                    <td>
                                        <label class="label">
                                            <div class="btn">

                                                <a class="pink-btn" href="/${top.fiction.id}/${top.chapter.number}/chapter.html" target="_blank">继续阅读</a>

                                                <div class="hide-btn">
                                                    <a class="top-btn top" href="/cancelTop.html" data-btn="0">取消置顶</a>
                                                    <a class="del-btn" href="/delShelf.html?id=${top.id}">删除</a>
                                                </div>
                                            </div>
                                        </label>
                                    </td>
                                </tr>
                            </core:if>
                                <core:forEach var="item" items="${list}">
                                    <tr class="" data-bookid="5369131804594101">
                                        <td></td>
                                        <td></td>
                                        <td style="width: 400px">
                                            <label class="label">
                                                <div class="cf">
                                                    <div class="book-img">
                                                        <a href="/${item.fiction.id}/${item.chapter.number}/chapter.html" target="_blank">
                                                            <img src="${item.fiction.cover}" alt="${item.fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/>

                                                            <i class="fin">已完结</i>
                                                        </a>
                                                    </div>
                                                    <div class="info">
                                                        <h3 style="overflow: visible"><a href="/${item.fiction.id}/${item.chapter.number}/chapter.html" target="_blank">${item.fiction.title}</a></h3>
                                                        <p>笑寒烟</p>
                                                    </div>
                                                </div>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="label">
                                                <div class="chapter">
                                                    <h4>
                                                        <a href="/${item.fiction.id}/${item.chapter.number}/chapter.html" target="_blank">读至 ${item.chapter.name}</a>
                                                    </h4>
                                                </div>
                                            </label>
                                        </td>
                                        <td>
                                            <label class="label">
                                                <div class="btn">

                                                    <a class="pink-btn" href="/${item.fiction.id}/${item.chapter.number}/chapter.html" target="_blank">继续阅读</a>

                                                    <div class="hide-btn">
                                                        <a class="top-btn top" href="/setTop.html?id=${item.id}" data-btn="1">置顶</a>
                                                        <a class="top-btn cancel" href="javascript:" data-btn="0">取消置顶</a>
                                                        <a class="del-btn" href="/delShelf.html?id=${item.id}">删除</a>
                                                    </div>
                                                </div>
                                            </label>
                                        </td>
                                    </tr>
                                </core:forEach>
                            </core:otherwise>
                        </core:choose>
                        </tbody>
                    </table>
                </div>

                <core:if test="${pager != null && list != null}">
                    ${pager.build()}
                </core:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
