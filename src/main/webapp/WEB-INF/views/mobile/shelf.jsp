<%--
  Created by IntelliJ IDEA.
  User: 14521
  Date: 2018/8/27
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="icon" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="shortcut icon" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="Bookmark" type="image/x-icon" href="https://qidian.gtimg.com/readnovelm/img/favicon-c5863766e3.ico">
    <link rel="stylesheet" href="/css/m_shelf.css" type="text/css"/>
    <title>Title</title>
</head>
<body>
<div class="page page-bookshelft-my">
    <div class="content">


        <!-- 公用头部 S -->
        <jsp:include page="header.jsp">
            <jsp:param value="/typelist.html" name="goBack"/>
            <jsp:param value="${FictionType.fromIndex(selectType).name}" name="typename"/>
        </jsp:include>

        <div class="module module-merge">

            <div id="editBtnHeader" class="mybook-module-header">
                <header class="mybook-default-header" style="">
                    <a href="javascript:" class="header-opt-a-l">共<span class="book-count-current">2</span>本</a>
                </header>
            </div>

            <!-- 列表内容 -->
            <ol id="bookEditOl" class="book-ol book-ol-progress" data-sort-type="2" data-count-num="2" data-page-size="10">


                <!-- 加载更多 -->

                <span class="list-split-1">
                    <core:choose>
                        <core:when test="">
                            书架为空
                        </core:when>
                        <core:otherwise>
                            <core:forEach var="item" items="${list}">
                                <li class="book-li " data-book-id="10538744704758701" data-list-type="list-book">
                        <i class="radio"><svg class="icon icon-ok"><use xlink:href="#icon-ok"></use></svg></i>
                        <div class="book-layout">
                            <div class="rel">
                                <a href="/${item.fiction.id}/${item.chapter.number}/chapter.html" class="mybook-to-detail">

                                    <img src="${item.fiction.cover}" class="book-cover" alt="${item.fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/>
                                </a>
                                <a href="/${item.fiction.id}/${item.chapter.number}/chapter.html" class="book-title-x">
                                    <h4 class="book-title">${item.fiction.title}
                                        <span class="tag-small-group">

                                        </span>
                                    </h4>
                                </a>
                            </div>

                            <!-- 继续阅读 -->
                            <a href="/${item.fiction.id}/${item.chapter.number}/chapter.html" class="mybook-to-goon">
                                <div class="book-title-x">
                                    <div class="book-title-r">
                                        <span class="gray">继续阅读</span><svg class="icon icon-arrow-r"><use xlink:href="#icon-arrow-r"><svg id="icon-arrow-r" viewBox="0 0 7 12" width="100%" height="100%"><path d="M6.146 6.354v-.708l-5.5 5.5a.5.5 0 0 0 .708.708l5.5-5.5a.5.5 0 0 0 0-.708l-5.5-5.5a.5.5 0 1 0-.708.708l5.5 5.5z"></path></svg></use></svg>
                                    <div style="position: absolute;top:63px;">
                                        <span onclick="javascript:window.location.href='';return false;" style="padding: 0 4px">置顶</span>
                                        <span onclick="javascript:alert('xxx');return false;" style="padding: 0 4px">删除</span>
                                    </div>
                                    </div>
                                </div>
                                <div class="book-meta">
                                    <p class="ell"><svg class="icon icon-human"><use xlink:href="#icon-human"><svg id="icon-human" viewBox="0 0 12 12" width="100%" height="100%"><g><path d="M11.5 11.5C11.5 8.79 9.145 7 6 7S.5 8.79.5 11.5a.5.5 0 1 0 1 0C1.5 9.411 3.357 8 6 8s4.5 1.411 4.5 3.5a.5.5 0 1 0 1 0z"></path><path d="M6 8c1.908 0 3.5-2.225 3.5-4.5C9.5 1.379 8.028 0 6 0S2.5 1.379 2.5 3.5C2.5 5.775 4.092 8 6 8zm0-1C4.73 7 3.5 5.281 3.5 3.5 3.5 1.946 4.51 1 6 1s2.5.946 2.5 2.5C8.5 5.281 7.27 7 6 7z"></path></g></svg></use></svg>${item.fiction.author} | 读至${item.chapter.name}</p>
                                </div>
                            </a>

                            <div class="rel">
                                <!-- 最新章节 -->
                                <a style="width: 160px;" href="/${item.fiction.id}/${item.fiction.latest.number}/chapter.html" class="mybook-to-new">
                                    <div class="book-meta">
                                        <p class="ell" style="color: #ff3955;">
                                                更新至 ${item.fiction.latest.name}
                                        </p>
                                    </div>
                                </a>
                            </div>


                        </div>
                    </li>
                            </core:forEach>
                        </core:otherwise>
                    </core:choose>

                  </span>


            </ol>
        </div>

        <!-- 底部操作 -->
    </div>

    <div class="module-bar jsInfiniteScroll" data-scroller-rel="" hidden="" id="infiniteScroller-0">正在加载中<dot>...</dot></div>


    <!-- 移动至，删除 -->
    <div id="bookEditPopup" class="mybook-move-del" hidden="">
        <nav class="btn-group">

            <div class="btn-group-cell">
                <a href="javascript:" id="bookDelBtn" class="btn-blank red"><svg class="icon icon-delete"><use xlink:href="#icon-delete"></use></svg>删除<span class="selected-count"></span></a>
            </div>
        </nav>
    </div>

</div>
</body>
</html>
