<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/6/30
  Time: 17:29
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
    <link rel="stylesheet" href="/css/sprite-598edc8675.css" type="text/css"/>
    <title>Title</title>
    <style>
        .header-operate-a, .header-operate>.icon{
            color: #fd8820 !important;
        }
        .active>.btn-tab, .btn-tab.active{
            background-color: #fd8820;
        }
    </style>
</head>
<body>
<div class="page page-home">
    <div class="content">
        <header id="header" class="header header-index"><a href="/" class="logo-a"><h1 class="logo">小说阅读网</h1></a>
            <div class="header-operate red">
                <a id="openSearchPopup" href="/to_search.html" class="icon icon-search" title="搜索">
                    <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-search"></use><svg id="icon-search" viewBox="0 0 18 18" width="100%" height="100%"><path d="M12.215 12.215a6.57 6.57 0 1 1-9.29-9.29 6.57 6.57 0 0 1 9.29 9.29zm.707.707h-.707l.342.342a7.64 7.64 0 0 0 .365-.342zm.342-.365a7.57 7.57 0 1 0-.707.707l4.59 4.59c.47.471 1.178-.236.707-.708l-4.59-4.59z"></path></svg></svg>
                </a>
                <a id="aUserCenter" href="/user" class="icon icon-person jsLogin" title="个人设置"><svg class="jsGuestWrapper" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-person"><svg id="icon-person" viewBox="0 0 17 20" width="100%" height="100%"><g><path d="M8.5 12.5c-2.692 0-5-3.529-5-7 0-3.133 2.04-5 5-5s5 1.867 5 5c0 3.471-2.308 7-5 7zm0-1c2.029 0 4-3.014 4-6 0-2.56-1.573-4-4-4s-4 1.44-4 4c0 2.986 1.971 6 4 6z"></path><path d="M8.5 19.5c-4.69 0-8-.965-8-3.5 0-2.768 3.42-4.5 8-4.5s8 1.732 8 4.5c0 2.535-3.31 3.5-8 3.5zm0-1c4.095 0 7-.847 7-2.5 0-2.031-2.9-3.5-7-3.5s-7 1.469-7 3.5c0 1.653 2.905 2.5 7 2.5z"></path></g></svg></use></svg><img id="avatar" class="header-avatar jsUserWrapper" hidden="" style="display: none;"></a>
                <a href="/bookshelf/my" class="icon icon-book" title="我的书架"><svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-book"><svg id="icon-book" viewBox="0 0 18 16" width="100%" height="100%"><g><path d="M.5 1h14C15.88 1 17 2.121 17 3.5 17 4.884 15.886 6 14.5 6H.5a.5.5 0 0 0 0 1h14C16.44 7 18 5.436 18 3.5 18 1.57 16.432 0 14.5 0H.5a.5.5 0 1 0 0 1z"></path><path d="M1.146.854c.09.089.245.296.407.62C1.832 2.03 2 2.705 2 3.5c0 .795-.168 1.469-.447 2.026-.162.324-.318.531-.407.62l.708.708c.16-.161.38-.454.593-.88C2.793 5.28 3 4.455 3 3.5c0-.955-.207-1.781-.553-2.474C2.234.6 2.015.307 1.854.146l-.708.708zM17.5 9h-14C1.568 9 0 10.57 0 12.5 0 14.436 1.56 16 3.5 16h14a.5.5 0 1 0 0-1h-14A2.494 2.494 0 0 1 1 12.5C1 11.121 2.12 10 3.5 10h14a.5.5 0 1 0 0-1z"></path><path d="M16.146 9.146c-.16.161-.38.454-.593.88-.346.693-.553 1.519-.553 2.474 0 .955.207 1.781.553 2.474.213.426.432.719.593.88l.708-.708c-.09-.089-.245-.296-.407-.62C16.168 13.97 16 13.295 16 12.5c0-.795.168-1.469.447-2.026.162-.324.318-.531.407-.62l-.708-.708z"></path></g></svg></use></svg></a>
            </div>
        </header><!-- 页面内容 S -->
        <div class="module" style="margin: 0px;">
            <div class="module-slide">
                <ol class="module-slide-ol" style="min-height:auto;" role="listbox" title="水平列表，可以水平滚动">
                    <%--<core:forEach items="${FictionType.getAllType()}" var="type">
                        <li class="module-slide-li"><a href="/${type.index}/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">${type.name}</p></a></li>
                    </core:forEach>--%>
                    <li class="module-slide-li"><a href="/1/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">玄幻奇幻</p></a></li>
                    <li class="module-slide-li"><a href="/2/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">武侠仙侠</p></a></li>
                    <li class="module-slide-li"><a href="/3/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">女频言情</p></a></li>
                    <li class="module-slide-li"><a href="/4/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">现代都市</p></a></li>
                    <li class="module-slide-li"><a href="/5/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">历史军事</p></a></li>
                    <li class="module-slide-li"><a href="/6/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">游戏竞技</p></a></li>
                    <li class="module-slide-li"><a href="/7/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">科幻灵异</p></a></li>
                    <li class="module-slide-li"><a href="/8/0/1/type.html" class="module-slide-a"><p class="module-slide-author" style="font-size: 0.95rem;">美文同人</p></a></li>
                </ol>
            </div>
        </div>
        <div class="module"><!-- 模块标题 -->
            <div class="module-header">
                <div class="module-header-l"><h3 class="module-title">热门推荐</h3></div>
            </div><!-- 侧滑 -->
            <div class="module-slide">
                <ol class="module-slide-ol" role="listbox" title="水平列表，可以水平滚动">
                    <core:forEach var="fiction" items="${hotsItems}">
                        <li class="module-slide-li">
                            <a href="/${fiction.id}/1/1/fiction.html" class="module-slide-a"><img src="${fiction.cover}" class="module-slide-img" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/><figcaption class="module-slide-caption">${fiction.title}</figcaption><p class="module-slide-author"><span class="clip">作者：</span><span class="gray">${fiction.author}</span></p></a>
                        </li>
                    </core:forEach>
                </ol>
            </div>
        </div><!-- 本期强推 E --><!-- 新书抢鲜 -->
        <core:forEach items="${list}" var="typesHotsItems">
            <core:forEach var="type" items="${typesHotsItems.keySet()}">
                <div class="module"><!-- 模块标题 -->
                    <div class="module-header">
                        <div class="module-header-l"><h3 class="module-title">${FictionType.fromIndex(type).name}</h3></div>
                        <div class="module-header-r">
                            <a href="/${type}/0/1/type.html" class="module-header-btn">更多<svg class="icon icon-arrow-r"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-arrow-r"></use></svg></a>
                        </div>
                    </div><!-- 书介绍list -->
                    <ol class="book-ol book-ol-normal">
                        <core:forEach var="fiction" items="${typesHotsItems.get(type)}">
                            <li class="book-li">
                                <a href="/${fiction.id}/1/1/fiction.html" class="book-layout"><img src="${fiction.cover}" class="book-cover" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"><div class="book-cell"><h4 class="book-title">${fiction.title}</h4>
                                    <core:choose>
                                        <core:when test="${fiction.intro.length()>40}">
                                            <p class="book-desc">${fiction.intro.substring(0,40)}...</p>
                                        </core:when>
                                        <core:otherwise>
                                            <p class="book-desc">${fiction.intro}</p>
                                        </core:otherwise>
                                    </core:choose>
                                    <div class="book-meta">
                                        <div class="book-meta-l"><span class="book-author"><svg class="icon icon-human"><title>作者</title><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-human"></use></svg>${fiction.author}</span></div>
                                        <div class="book-meta-r"><span class="tag-small-group origin-right"><em class="tag-small yellow">${fiction.type.name}</em><em class="tag-small red">${fiction.status.name}</em></span></div>
                                    </div>
                                </div></a>
                            </li>
                        </core:forEach>
                    </ol>
                </div>
            </core:forEach>
        </core:forEach>

        <div class="module"><!-- 模块标题 -->
            <div class="module-header">
                <div class="module-header-l"><h3 class="module-title">排行榜</h3></div>
            </div><!-- 模块内选项卡 -->
            <div class="module-tab moduleTab">
                <nav class="btn-group">
                    <h3 alt="0" class="btn-group-cell" role="tab" aria-selected="true"><a href="javascript:" class="btn-tab active" data-rel="rankOl1" data-index="0">周榜</a></h3>
                    <h3 alt="1" class="btn-group-cell" role="tab" aria-selected="false"><a href="javascript:" class="btn-tab" data-rel="rankOl2" data-index="1">月榜</a></h3>
                    <h3 alt="2" class="btn-group-cell" role="tab" aria-selected="false"><a href="javascript:" class="btn-tab" data-rel="rankOl3" data-index="2">年榜</a></h3>
                    <h3 alt="3" class="btn-group-cell" role="tab" aria-selected="false"><a href="javascript:" class="btn-tab" data-rel="rankOl4" data-index="3">总榜</a></h3>
                </nav>
            </div><!-- 侧滑 -->
            <div class="module-slide">
                <core:forEach var="item" items="${sorts}">
                    <core:choose>
                        <core:when test="${sorts.indexOf(item) == 0}">
                            <ol id="rankOl1" class="module-slide-ol active" role="listbox" title="水平列表，可以水平滚动">
                        </core:when>
                        <core:otherwise>
                            <ol id="rankOl1" class="module-slide-ol" role="listbox" title="水平列表，可以水平滚动">
                        </core:otherwise>
                    </core:choose>
                        <core:forEach var="fiction" items="${item}">
                            <li class="module-slide-li"><a href="/${fiction.id}/1/1/fiction.html" class="module-slide-a">
                                <img src="${fiction.cover}" class="module-slide-img" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';">
                                <figcaption class="module-slide-caption">${fiction.title}</figcaption>
                                <p class="module-slide-author"><span class="clip">作者：</span><span class="gray">${fiction.author}</span></p>
                            </a></li>
                        </core:forEach>
                    </ol>
                </core:forEach>
            </div>
        </div><!-- 排行榜 E --><!-- 分类推荐 S -->

        <div class="module"><!-- 模块标题 -->
            <div class="module-header">
                <div class="module-header-l"><h3 class="module-title">最新更新</h3></div>
            </div><!-- 侧滑 -->
            <div class="module-slide">
                <ol class="module-slide-ol" role="listbox" title="水平列表，可以水平滚动">
                    <core:forEach var="fiction" items="${latests}">
                        <li class="module-slide-li"><a href="/${fiction.id}/1/1/fiction.html" class="module-slide-a"><img
                                src="${fiction.cover}" class="module-slide-img"
                                alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';">
                            <figcaption class="module-slide-caption">${fiction.title}</figcaption>
                            <p class="module-slide-author"><span class="clip">作者：</span><span class="gray">${fiction.author}</span></p>
                        </a></li>
                    </core:forEach>
                </ol>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/jquery-2.0.3.min.js"></script>
<script>
    $(function () {
        $(".module .module-tab .btn-group .btn-group-cell").click(function () {
            $(".module .module-slide .module-slide-ol").removeClass("active");
            $(this).parent().find("a").removeClass("active");
            $(this).find("a").addClass("active");
            var ll = $(this).parent().parent().next().children();
            var active = $(ll[$(this).attr("alt")]);
            $(active).addClass("active");
        });
    })
</script>
</body>
</html>
