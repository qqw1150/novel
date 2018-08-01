<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/6/18
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.luowenit.domain.assist.FictionType" %>
<%@ page import="java.util.Objects" %>
<style>
    .header .top-head .search-wrap form label{
        border-color: #fd8820 !important;
    }
    .header .top-head .search-wrap form input.search-box{
        border-color: #fd8820 !important;
    }
    .header .top-head .search-wrap form label .iconfont{
        color: #fd8820 !important;
    }
    .header .top-head .user-wrap li .iconfont{
        color: #fd8820 !important;
    }
    .page-box .pagination .lbf-pagination-current{
        border-color: #fd8820 !important;
        background: #fd8820 !important;
    }
</style>
<style>
    .K2_POP {
        padding: 6px;
        width: 340px;
        background: #c0c5cc;
        font-size: 12px;
        color: #333;
    }
    .K2_POP .title {
        font-weight: 700;
        background: #eee;
        font-size: 14px;
        padding: 10px;
        line-height: 18px;
        border-bottom: 1px solid #c9c9c9;
    }
    .K2_POP .context {
        padding: 15px 30px;
        background: #fff;
    }
    .K2_POP .war_text {
        display: none;
        color: #ef5400;
        font-size: 12px;
        font-weight: 400;
        position: relative;
    }
    .K2_POP .context input.code, .K2_POP .context input.pass, .K2_POP .context input.user {
        width: 275px;
        height: 32px;
        padding: 0;
        display: block;
        line-height: 32px;
        margin: 15px 0;
        text-indent: 36px;
        font-size: 14px;
        color: #666;
        border: 1px solid #c9c9c9;
    }
    .K2_POP .context input.code.user, .K2_POP .context input.pass.user, .K2_POP .context input.user.user {
        background: url(/image/input.png) no-repeat left top;
    }
    .K2_POP .context input.code.pass, .K2_POP .context input.pass.pass, .K2_POP .context input.user.pass {
        background: url(/image/input.png) no-repeat left bottom;
    }
    .K2_POP .context .save {
        clear: both;
    }
    .K2_POP .context input.sub {
        width: 280px;
        height: 32px;
        background: #ef5400;
        color: #fff;
        border: 0;
        margin: 15px 0;
        font-size: 14px;
        font-weight: 700;
        cursor: pointer;
    }
    .K2_POP .context input.sub:hover {
        background-color: #cc4b05;
    }
    .K2_POP .context a.reg {
        font-size: 14px;
        display: block;
        line-height: 32px;
        text-align: center;
        background: #ececec;
    }

    .K2_POP .context a.reg:hover{
        background-color: #dcd8d8;
    }
    .K2_POP .context .oauth {
        padding: 20px 0;
    }
    .none{display: none}

    .header .top-head .logo img {
        width: 180px;
        height: 46px;
        position: relative;
        bottom: 6px;
    }

</style>
<div class="header">
    <div class="top-head box-center cf">
        <h1 class="logo" title="传阅小说网" style="background: none">
            <a href="/index.html"><img src="/image/logo2.png"/></a>
        </h1>
        <div class="search-wrap">
            <form class="cf" id="formUrl" action="/1/search.html" method="get" target="_blank">
                <input class="search-box" id="s-box" name="title" type="text" placeholder="暖婚似火：顾少，轻轻宠" autocomplete="off" value="">
                <input class="submit-input" type="submit" id="searchSubmit" data-eid="">
                <label id="search-btn" class="search-btn" for="searchSubmit"><em class="iconfont"></em></label>
            </form>
        </div>
        <div class="user-wrap">
            <core:set var="user" value="${sessionScope.user}"/>
            <core:choose>
                <core:when test="${Objects.isNull(user) || \"\".equals(user)}">
            <div class="avatar" id="j-userWrap">
                <a class="link" href="javascript:" onclick="showLogin()">
                    <img src="/image/account.1e031.png"/>
                </core:when>
                <core:otherwise>
            <div class="avatar" id="j-userWrap" onmouseout="hideLogout()" onmouseover="showLogout()">
                <a class="link" href="javascript:" id="j-avatar">
                    <img src="${user.icon}" title="${user.username}"/>
                </core:otherwise>
            </core:choose>
                </a>
                <div class="down-drop" id="j-userDownDrop">
                    <dl>
                        <dd><a href="/logout.html" id="sign-out">退出</a></dd>
                    </dl>
                </div>
            </div>
            <ul>
                <li><a class="head-shelf" href="javascript:"><em class="iconfont"></em>我的书架</a></li>
            </ul>
        </div>
    </div>
    <div class="top-nav-wrap box-center cf">
        <div class="left-nav fl">
            <ul class="cf" style="margin-left: 80px">
                <li class=""><a href="/1/0/1/type.html">玄幻奇幻</a></li>
                <li class=""><a href="/2/0/1/type.html">武侠仙侠</a></li>
                <li class=""><a href="/3/0/1/type.html">女频言情</a></li>
                <li class=""><a href="/4/0/1/type.html">现代都市</a></li>
                <li class=""><a href="/5/0/1/type.html">历史军事</a></li>
                <li class=""><a href="/6/0/1/type.html">游戏竞技</a></li>
                <li class=""><a href="/7/0/1/type.html">科幻灵异</a></li>
                <li class=""><a href="/8/0/1/type.html">美文同人</a></li>
                <%--<core:forEach items="${FictionType.getAllType()}" var="type">
                    <li class=""><a href="/${type.index}/0/1/type.html">${type.name}</a></li>
                </core:forEach>--%>
            </ul>
        </div>
    </div>
</div>
<div id="mlogin" class="Q_pop_box none" style="position: fixed; z-index: 2147483600; overflow: hidden; opacity: 1; top: 98.5px;">
    <div id="k2_login_pop" class="K2_POP">
        <div class="title">用户登录</div>
        <div class="context">
            <core:set value="${sessionScope.get('errors')}" var="errors"></core:set>
            <core:choose>
                <core:when test="${!Objects.isNull(errors) && errors.size()>0}">
                    <core:forEach items="${errors}" var="err">
                        <span id="Q_login_user_error" class="war_text" style="display: block">${err.defaultMessage}</span>
                    </core:forEach>
                </core:when>
                <core:otherwise>
                    <span id="Q_login_user_error" class="war_text" style="display: none"></span>
                </core:otherwise>
            </core:choose>
            <form name="k2_login_pop" id="k2_login_pop_form" action="/login.html" method="post">
                <input id="username" class="user" type="text" name="username" style="color:gray;" value="" placeholder="邮箱/手机/用户名"/>
                <input id="password" class="pass" type="password" name="password" value=""/>
                <input class="sub" type="button" value="登录" onclick="goSubmit()">
                <a class="reg" target="_blank" href="/go_register.html">注册</a>
            </form>
        </div>
    </div>
    <div style="position: absolute; z-index: 2147483647; top: 0px; right: 0px;">
        <div class="close_bar"></div>
    </div>
</div>
</div>

<script src="/js/jquery-2.0.3.min.js"></script>
<script>
    $(function () {
        $("#mlogin").css("left",$(document.body).width()/2-$("#mlogin").width()/2)
        <core:if test="${!Objects.isNull(errors) && errors.size()>0}">
            showLogin();
        </core:if>
    });

    function goSubmit() {
        if($("#username").val() == "" || $("#username").val() == null){
            $("#Q_login_user_error").text("用户名不能为空");
            $("#Q_login_user_error").show();
            return false;
        }

        if($("#password").val() == "" || $("#password").val() == null){
            $("#Q_login_user_error").text("密码不能为空");
            $("#Q_login_user_error").show();
            return false;
        }

        document.getElementById("k2_login_pop_form").submit();
    }

    $("input.user").focus(function () {
        $(this).css("borderColor",'#ef5400');
    });
    $("input.user").blur(function () {
        $(this).css("borderColor",'#c9c9c9');

    });
    $("input.pass").focus(function () {
        $(this).css("borderColor",'#ef5400');
    });
    $("input.pass").blur(function () {
        $(this).css("borderColor",'#c9c9c9');
    });
    function showLogout() {
        $("#j-userDownDrop").show();
    }

    function hideLogout() {
        $("#j-userDownDrop").hide();
    }

    function showLogin() {
        var height=$(document.body).height();
        var width = $(document.body).width();
        var html="<div id='bgcover' onclick='closeLogin()' style='width:"+width+"px;height: "+height+"px;background-color: #1A1A1A;opacity: 0.5;position: absolute;left: 0;top: 0;z-index: 100;'></div>";
        $(document.body).append(html);
        $("#mlogin").removeClass("none");
    }

    function closeLogin() {
        $("#bgcover").remove();
        $("#mlogin").addClass("none");
    }

</script>

