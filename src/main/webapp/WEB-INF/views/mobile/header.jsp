<%--
  Created by IntelliJ IDEA.
  User: 14521
  Date: 2018/7/2
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .header-operate-a, .header-operate>.icon{
        color: #fd8820;
    }
    .header a{
        color: #fd8820 !important;
    }
</style>
<header id="header" class="header">
    <a href="<%=request.getParameter("goBack")%>" class="header-back jsBack">
        <svg class="icon icon-arrow-l"><title>返回</title><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-arrow-l"><svg id="icon-arrow-l" viewBox="0 0 8 16" width="100%" height="100%"><path d="M7.854 1.354a.5.5 0 0 0-.708-.708l-7 7a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708L1.207 8l6.647-6.646z"></path></svg></use></svg>
    </a>
    <h1 class="header-back-title"><%=request.getParameter("typename")%></h1>
    <div class="header-operate">
        <core:choose>
            <core:when test="${empty sessionScope.get('user')}">
                <a id="aUserCenter" href="/to_login.html" class="icon icon-person jsLogin" title="个人设置"><svg class="jsGuestWrapper" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-person"><svg id="icon-person" viewBox="0 0 17 20" width="100%" height="100%"><g><path d="M8.5 12.5c-2.692 0-5-3.529-5-7 0-3.133 2.04-5 5-5s5 1.867 5 5c0 3.471-2.308 7-5 7zm0-1c2.029 0 4-3.014 4-6 0-2.56-1.573-4-4-4s-4 1.44-4 4c0 2.986 1.971 6 4 6z"></path><path d="M8.5 19.5c-4.69 0-8-.965-8-3.5 0-2.768 3.42-4.5 8-4.5s8 1.732 8 4.5c0 2.535-3.31 3.5-8 3.5zm0-1c4.095 0 7-.847 7-2.5 0-2.031-2.9-3.5-7-3.5s-7 1.469-7 3.5c0 1.653 2.905 2.5 7 2.5z"></path></g></svg></use></svg><img id="avatar" class="header-avatar jsUserWrapper" hidden="" style="display: none;"></a>
            </core:when>
            <core:otherwise>
                <a href="/logout.html"><img style="width: 2rem;" src="//shp.qpic.cn/readnovel/0/1/100" class="center-header-img" alt="小阅书友15328715523814851"></a>
            </core:otherwise>
        </core:choose>
        <a id="openSearchPopup" href="/to_search.html" class="icon icon-search" title="搜索">
            <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-search"><svg id="icon-search" viewBox="0 0 18 18" width="100%" height="100%"><path d="M12.215 12.215a6.57 6.57 0 1 1-9.29-9.29 6.57 6.57 0 0 1 9.29 9.29zm.707.707h-.707l.342.342a7.64 7.64 0 0 0 .365-.342zm.342-.365a7.57 7.57 0 1 0-.707.707l4.59 4.59c.47.471 1.178-.236.707-.708l-4.59-4.59z"></path></svg></use></svg>
        </a>
        <a href="/bookshelf/my" class="icon icon-book" title="我的书架"><svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-book"><svg id="icon-book" viewBox="0 0 18 16" width="100%" height="100%"><g><path d="M.5 1h14C15.88 1 17 2.121 17 3.5 17 4.884 15.886 6 14.5 6H.5a.5.5 0 0 0 0 1h14C16.44 7 18 5.436 18 3.5 18 1.57 16.432 0 14.5 0H.5a.5.5 0 1 0 0 1z"></path><path d="M1.146.854c.09.089.245.296.407.62C1.832 2.03 2 2.705 2 3.5c0 .795-.168 1.469-.447 2.026-.162.324-.318.531-.407.62l.708.708c.16-.161.38-.454.593-.88C2.793 5.28 3 4.455 3 3.5c0-.955-.207-1.781-.553-2.474C2.234.6 2.015.307 1.854.146l-.708.708zM17.5 9h-14C1.568 9 0 10.57 0 12.5 0 14.436 1.56 16 3.5 16h14a.5.5 0 1 0 0-1h-14A2.494 2.494 0 0 1 1 12.5C1 11.121 2.12 10 3.5 10h14a.5.5 0 1 0 0-1z"></path><path d="M16.146 9.146c-.16.161-.38.454-.593.88-.346.693-.553 1.519-.553 2.474 0 .955.207 1.781.553 2.474.213.426.432.719.593.88l.708-.708c-.09-.089-.245-.296-.407-.62C16.168 13.97 16 13.295 16 12.5c0-.795.168-1.469.447-2.026.162-.324.318-.531.407-.62l-.708-.708z"></path></g></svg></use></svg></a>
    </div>
</header>
