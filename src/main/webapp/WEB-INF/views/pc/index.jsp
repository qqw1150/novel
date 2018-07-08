<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/5/20
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.luowenit.domain.assist.FictionType" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" type="image/x-icon" href="https://qidian.gtimg.com/readnovel/favicon/favicon.ico">
    <link rel="Bookmark" type="image/x-icon" href="https://qidian.gtimg.com/readnovel/favicon/favicon.ico">
    <link rel="stylesheet" href="/css/index.css?1" type="text/css"/>
    <script src="/js/push.js"></script>
    <script src="/js/stats.js"
            name="MTAH5" sid="500406364" cid="500406409"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<style>
    .book-wrap .book-info h3{
        background: #fd8820;
    }
</style>
<div class="box-center">
    <div class="index-book-wrap hot-rec-wrap mb20">
        <div class="inner-wrap cf">
            <div class="left-wrap fl hover-icon"><h3 class="lang">热门推荐<em class="icon icon-edit_rec"></em></h3>
                <div id="new-book-list">
                    <core:forEach items="${hotsItems}" var="item">
                        <div class="type-new-list cf" data-l2="1">
                            <ul>
                                <core:forEach items="${item}" var="fiction">
                                    <li data-rid="1">
                                        <div class="book-img">
                                            <a href="/${fiction.id}/1/1/fiction.html" data-eid="qd_F23"
                                               data-bid="3148413700960802" target="_blank"><img src="${fiction.cover}"
                                                                                                alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"></a>
                                        </div>
                                        <div class="book-info"><h4><a href="/${fiction.id}/1/1/fiction.html"
                                                                      data-eid="qd_F24"
                                                                      data-bid="3148413700960802" target="_blank"
                                                                      title="${fiction.title}">${fiction.title}</a>
                                        </h4>
                                            <core:choose>
                                                <core:when test="${fiction.intro.length()>24}">
                                                    <p>${fiction.intro.substring(0,21)}...</p>
                                                </core:when>
                                                <core:otherwise>
                                                    <p>${fiction.intro}</p>
                                                </core:otherwise>
                                            </core:choose>
                                            <div class="state-box cf"><i>${fiction.type.name}</i><a
                                                    class="author default" data-eid="qd_F25"
                                                    target="_blank">${fiction.author}</a></div>
                                        </div>
                                    </li>
                                </core:forEach>
                            </ul>
                        </div>
                    </core:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="row-book-wrap mb20">
        <div class="inner-wrap"><h3 class="wrap-title lang"></h3>
            <div class="hot-book-list-wrap">
                <core:forEach items="${list}" var="typesHotsItems">
                    <ul class="mb30 cf">
                        <core:forEach items="${typesHotsItems.keySet()}" var="type">
                            <li class="hover-icon">
                                <dl>
                                    <core:forEach items="${typesHotsItems.get(type)}" var="fiction">
                                        <core:choose>
                                            <core:when test="${typesHotsItems.get(type).indexOf(fiction) == 0}">
                                                <dd class="top" data-rid="1"><h6>${FictionType.fromIndex(type).name}<span style="font-size: 10px;margin-left: 108px;"><a style="color: #4284ed;" class="more" href="/${type}/0/1/type.html" target="_blank">更多<em class="iconfont" style="font-size: 12px;"></em></a></span></h6>
                                                    <div class="book-wrap cf">
                                                        <div class="book-info fl"><h4><a href="/${fiction.id}/1/1/fiction.html"
                                                                                         target="_blank"
                                                                                         data-eid="qd_A117"
                                                                                         data-bid="6458282403768703"
                                                                                         title="${fiction.title}">${fiction.title}</a>
                                                        </h4>
                                                            <core:choose>
                                                                <core:when test="${fiction.intro.length()>24}">
                                                                    <p>${fiction.intro.substring(0,21)}...</p>
                                                                </core:when>
                                                                <core:otherwise>
                                                                    <p>${fiction.intro}</p>
                                                                </core:otherwise>
                                                            </core:choose>
                                                        </div>
                                                        <div class="book-cover"><a class="link"
                                                                                   href="/${fiction.id}/1/1/fiction.html"
                                                                                   data-eid="qd_A117" target="_blank"
                                                                                   data-bid="/book/6458282403768703"><img
                                                                src="${fiction.cover}"
                                                                alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"></a><span></span></div>
                                                    </div>
                                                </dd>
                                            </core:when>
                                            <core:otherwise>
                                                <dd data-rid="2"><i><a href="/${fiction.id}/1/1/fiction.html"
                                                                       target="_blank">${fiction.title}</a></i></dd>
                                            </core:otherwise>
                                        </core:choose>
                                    </core:forEach>
                                </dl>
                            </li>
                        </core:forEach>
                    </ul>
                </core:forEach>
            </div>
        </div>
    </div>

    <div class="rank-wrap mb20" data-l1="11">
        <div id="rank-list-row" class="rank-list-row inner-wrap cf">
            <div class="rank-list" data-l2="1"><h3 class="wrap-title lang">周榜<a class="more" href="/rank/newbook" target="_blank"></a></h3>
                <div class="book-list">
                    <ul>
                        <core:forEach items="${sortedByWeek}" var="fiction">
                            <core:choose>
                                <core:when test="${sortedByWeek.indexOf(fiction) == 0}">
                                    <li class="unfold" data-rid="${sortedByWeek.indexOf(fiction)+1}">
                                        <div class="book-wrap cf">
                                            <div class="book-info fl">
                                                <h3>NO.1</h3><h4><a href="/${fiction.id}/1/1/fiction.html" target="_blank" data-eid="qd_A117" data-bid="9742595903887003" title="${fiction.title}">${fiction.title}</a></h4>
                                                <p class="author"><a class="type" href="/${fiction.type.index}/0/1/type.html" target="_blank">${fiction.type.name}</a><i>·</i><a class="writer default">${fiction.author}</a></p>
                                            </div>
                                            <div class="book-cover">
                                                <a class="link" href="/${fiction.id}/1/1/fiction.html" data-eid="qd_A117" target="_blank" data-bid="9742595903887003"><img src="${fiction.cover}" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/></a><span></span>
                                            </div>
                                        </div>
                                    </li>
                                </core:when>
                                <core:otherwise>
                                    <li data-rid="${sortedByWeek.indexOf(fiction)+1}">
                                        <div class="num-box"><span class="num${sortedByWeek.indexOf(fiction)+1}">${sortedByWeek.indexOf(fiction)+1}</span></div>
                                        <div class="name-box"><a class="name" href="/${fiction.id}/1/1/fiction.html" target="_blank" data-eid="qd_A117" data-bid="9631525003729203" title="${fiction.title}">${fiction.title}</a><i class="author">${fiction.author}</i></div>
                                    </li>
                                </core:otherwise>
                            </core:choose>
                        </core:forEach>
                    </ul>
                </div>
            </div>
                <div class="rank-list" data-l2="1"><h3 class="wrap-title lang">月榜<a class="more" href="/rank/hotsales" target="_blank"></a></h3>
                    <div class="book-list">
                        <ul>
                            <core:forEach items="${sortedByMonth}" var="fiction">
                                <core:choose>
                                    <core:when test="${sortedByMonth.indexOf(fiction) == 0}">
                                        <li class="unfold" data-rid="${sortedByMonth.indexOf(fiction)+1}">
                                            <div class="book-wrap cf">
                                                <div class="book-info fl">
                                                    <h3>NO.1</h3><h4><a href="/${fiction.id}/1/1/fiction.html" target="_blank" data-eid="qd_A117" data-bid="9742595903887003" title="${fiction.title}">${fiction.title}</a></h4>
                                                    <p class="author"><a class="type" href="/${fiction.type.index}/0/1/type.html" target="_blank">${fiction.type.name}</a><i>·</i><a class="writer default">${fiction.author}</a></p>
                                                </div>
                                                <div class="book-cover">
                                                    <a class="link" href="/${fiction.id}/1/1/fiction.html" data-eid="qd_A117" target="_blank" data-bid="9742595903887003"><img src="${fiction.cover}" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/></a><span></span>
                                                </div>
                                            </div>
                                        </li>
                                    </core:when>
                                    <core:otherwise>
                                        <li data-rid="${sortedByMonth.indexOf(fiction)+1}">
                                            <div class="num-box"><span class="num${sortedByMonth.indexOf(fiction)+1}">${sortedByMonth.indexOf(fiction)+1}</span></div>
                                            <div class="name-box"><a class="name" href="/${fiction.id}/1/1/fiction.html" target="_blank" data-eid="qd_A117" data-bid="9631525003729203" title="${fiction.title}">${fiction.title}</a><i class="author">${fiction.author}</i></div>
                                        </li>
                                    </core:otherwise>
                                </core:choose>
                            </core:forEach>
                        </ul>
                    </div>
                </div>
                <div class="rank-list" data-l2="1"><h3 class="wrap-title lang">年榜<a class="more" href="/rank/xyyuepiao" target="_blank"></a></h3>
                    <div class="book-list">
                        <ul>
                            <core:forEach items="${sortedByYear}" var="fiction">
                                <core:choose>
                                    <core:when test="${sortedByYear.indexOf(fiction) == 0}">
                                        <li class="unfold" data-rid="${sortedByYear.indexOf(fiction)+1}">
                                            <div class="book-wrap cf">
                                                <div class="book-info fl">
                                                    <h3>NO.1</h3><h4><a href="/${fiction.id}/1/1/fiction.html" target="_blank" data-eid="qd_A117" data-bid="9742595903887003" title="${fiction.title}">${fiction.title}</a></h4>
                                                    <p class="author"><a class="type" href="/${fiction.type.index}/0/1/type.html" target="_blank">${fiction.type.name}</a><i>·</i><a class="writer default">${fiction.author}</a></p>
                                                </div>
                                                <div class="book-cover">
                                                    <a class="link" href="/${fiction.id}/1/1/fiction.html" data-eid="qd_A117" target="_blank" data-bid="9742595903887003"><img src="${fiction.cover}" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/></a><span></span>
                                                </div>
                                            </div>
                                        </li>
                                    </core:when>
                                    <core:otherwise>
                                        <li data-rid="${sortedByYear.indexOf(fiction)+1}">
                                            <div class="num-box"><span class="num${sortedByYear.indexOf(fiction)+1}">${sortedByYear.indexOf(fiction)+1}</span></div>
                                            <div class="name-box"><a class="name" href="/${fiction.id}/1/1/fiction.html" target="_blank" data-eid="qd_A117" data-bid="9631525003729203" title="${fiction.title}">${fiction.title}</a><i class="author">${fiction.author}</i></div>
                                        </li>
                                    </core:otherwise>
                                </core:choose>
                            </core:forEach>
                        </ul>
                    </div>
                </div>
                <div class="rank-list" data-l2="1"><h3 class="wrap-title lang">总榜<a class="more" href="/rank/update" target="_blank"></a></h3>
                    <div class="book-list">
                        <ul>
                            <core:forEach items="${sortedAll}" var="fiction">
                                <core:choose>
                                    <core:when test="${sortedAll.indexOf(fiction) == 0}">
                                        <li class="unfold" data-rid="${sortedAll.indexOf(fiction)+1}">
                                            <div class="book-wrap cf">
                                                <div class="book-info fl">
                                                    <h3>NO.1</h3><h4><a href="/${fiction.id}/1/1/fiction.html" target="_blank" data-eid="qd_A117" data-bid="9742595903887003" title="${fiction.title}">${fiction.title}</a></h4>
                                                    <p class="author"><a class="type" href="/${fiction.type.index}/0/1/type.html" target="_blank">${fiction.type.name}</a><i>·</i><a class="writer default">${fiction.author}</a></p>
                                                </div>
                                                <div class="book-cover">
                                                    <a class="link" href="/${fiction.id}/1/1/fiction.html" data-eid="qd_A117" target="_blank" data-bid="9742595903887003"><img src="${fiction.cover}" alt="${fiction.title}" onerror="javascript:this.src='https://www.qisuu.la/modules/article/images/nocover.jpg';"/></a><span></span>
                                                </div>
                                            </div>
                                        </li>
                                    </core:when>
                                    <core:otherwise>
                                        <li data-rid="${sortedAll.indexOf(fiction)+1}">
                                            <div class="num-box"><span class="num${sortedAll.indexOf(fiction)+1}">${sortedAll.indexOf(fiction)+1}</span></div>
                                            <div class="name-box"><a class="name" href="/${fiction.id}/1/1/fiction.html" target="_blank" data-eid="qd_A117" data-bid="9631525003729203" title="${fiction.title}">${fiction.title}</a><i class="author">${fiction.author}</i></div>
                                        </li>
                                    </core:otherwise>
                                </core:choose>
                            </core:forEach>
                        </ul>
                    </div>
                </div>
        </div>
    </div>

    <div class="index-book-wrap update-list-wrap mb20">
        <div class="inner-wrap cf">
            <div class="left-table fl">
                <h3 class="wrap-title lang">最近更新</h3>
                <div id="j-updateList">
                    <div class="update-wrap">
                        <table>
                            <tbody style="text-align: center">
                            <tr>
                                <td class="name">类型</td>
                                <td class="name">标题</td>
                                <td class="name">最新章节</td>
                                <td class="name">作者</td>
                                <td class="name">点击量</td>
                                <td class="name">更新时间</td>
                            </tr>
                            <core:forEach items="${latests}" var="fiction">
                                <tr>
                                    <td><a class="type" href="javascript:void(0)">「${fiction.type.name}」</a></td>
                                    <td><a class="name" href="/${fiction.id}/1/1/fiction.html" target="_blank">${fiction.title}</a></td>
                                    <td><a class="chapter" href="/${fiction.id}/1/chapter.html" target="_blank">${fiction.latest.name}</a></td>
                                    <td><a class="writer" href="javascript:void(0)">${fiction.author}</a></td>
                                    <td><em class="words">${fiction.clicks}</em></td>
                                    <td><em class="time" style="text-align: center"><fmt:formatDate value="${fiction.uptime}" pattern="yyyy-MM-dd HH:mm:ss"/></em></td>
                                </tr>
                            </core:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
