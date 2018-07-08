<%--
  Created by IntelliJ IDEA.
  User: 14521
  Date: 2018/7/2
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <a id="openSearchPopup" href="javascript:" class="icon icon-search" title="搜索">
            <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-search"><svg id="icon-search" viewBox="0 0 18 18" width="100%" height="100%"><path d="M12.215 12.215a6.57 6.57 0 1 1-9.29-9.29 6.57 6.57 0 0 1 9.29 9.29zm.707.707h-.707l.342.342a7.64 7.64 0 0 0 .365-.342zm.342-.365a7.57 7.57 0 1 0-.707.707l4.59 4.59c.47.471 1.178-.236.707-.708l-4.59-4.59z"></path></svg></use></svg>
        </a>
    </div>
</header>
