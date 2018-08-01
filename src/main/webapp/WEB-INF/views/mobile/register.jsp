<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/7/29
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0184)https://passport.yuewen.com/yuewen.html?popup=0&ticket=1&target=top&areaid=1&appid=13&auto=1&autotime=30&version=1.0&source=m&returnurl=https%3A%2F%2Fm.qidian.com%2Fuser%3Ffrom%3Dlogin -->
<html lang="zh-CN" style="font-size: 100px;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="robots" content="all">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no" name="format-detection">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>账号登录 | 起点中文网_阅文集团旗下网站</title>
    <!-- start 计算页面使用rem的尺寸 必须放在头部 -->
    <!-- end 计算页面使用rem的尺寸 必须放在头部 -->
    <link rel="stylesheet" href="/css/login.css">
    <link rel="shortcut icon" type="image/x-icon" href="https://qidian.gtimg.com/qd/favicon/qd_icon.0.2.ico">
    <link rel="Bookmark" type="image/x-icon" href="https://qidian.gtimg.com/qd/favicon/qd_icon.0.2.ico">
</head>
<body>
    <div style="display:none;">
        <svg style="position: absolute; width: 0; height: 0; overflow: hidden;" version="1.1"
             xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <defs>
                <symbol id="icon-arrow-down" viewBox="0 0 16 16">
                    <title>arrow-down</title>
                    <path class="path1"
                          d="M7.434 13.366c0.312 0.312 0.819 0.312 1.131 0l6.4-6.4c0.312-0.312 0.312-0.819 0-1.131s-0.819-0.312-1.131 0l-6.4 6.4h1.131l-6.4-6.4c-0.312-0.312-0.819-0.312-1.131 0s-0.312 0.819 0 1.131l6.4 6.4z"></path>
                </symbol>
                <symbol id="icon-arrow-left" viewBox="0 0 9 16">
                    <title>arrow-left</title>
                    <path class="path1" fill="none" stroke="#000" stroke-width="1.1429" stroke-miterlimit="4"
                          stroke-linecap="round" stroke-linejoin="round" d="M8.196 0.75l-7.25 7.25 7.25 7.25"></path>
                </symbol>
                <symbol id="icon-arrow-left-white" viewBox="0 0 9 16">
                    <title>arrow-left-white</title>
                    <path class="path1" fill="none" stroke="#FFF" stroke-width="1.1429" stroke-miterlimit="4"
                          stroke-linecap="round" stroke-linejoin="round" d="M8.196 0.75l-7.25 7.25 7.25 7.25"></path>
                </symbol>
                <symbol id="icon-arrow-right-full" viewBox="0 0 9 16">
                    <title>arrow-right-full</title>
                    <path class="path1" d="M0.691 15.163v-14.399l7.2 7.2z"></path>
                </symbol>
                <symbol id="icon-close" viewBox="0 0 16 16">
                    <title>close</title>
                    <path class="path1"
                          d="M8.024 6.812l-6.263-6.263-1.212 1.212 6.263 6.263-6.263 6.263 1.212 1.212 6.263-6.263 6.263 6.263 1.212-1.212-6.263-6.263 6.263-6.263-1.212-1.212-6.263 6.263z"></path>
                </symbol>
                <symbol id="icon-del" viewBox="0 0 16 16">
                    <title>del</title>
                    <path class="path1"
                          d="M16 8c0 4.418-3.582 8-8 8s-8-3.582-8-8c0-4.418 3.582-8 8-8s8 3.582 8 8z"></path>
                    <path class="path2" stroke="#fff" stroke-width="1.1429" stroke-miterlimit="4" stroke-linecap="round"
                          stroke-linejoin="round" d="M5.143 5.143l5.714 5.714"></path>
                    <path class="path3" stroke="#fff" stroke-width="1.1429" stroke-miterlimit="4" stroke-linecap="round"
                          stroke-linejoin="round" d="M10.857 5.143l-5.714 5.714"></path>
                </symbol>
                <symbol id="icon-look" viewBox="0 0 21 16">
                    <title>look</title>
                    <path class="path1"
                          d="M0 8c1.315 3.843 5.267 7 10.667 7s9.339-3.134 10.667-7c-1.305-3.855-5.267-7-10.667-7s-9.344 3.128-10.667 7z"></path>
                    <path class="path2" fill="#f6f7f9"
                          d="M10.667 12c2.356 0 4.267-1.791 4.267-4s-1.91-4-4.267-4c-2.356 0-4.267 1.791-4.267 4s1.91 4 4.267 4z"></path>
                    <path class="path3"
                          d="M16.926 4.934c0 1.621-1.401 2.934-3.13 2.934s-3.13-1.314-3.13-2.934c0-1.621 1.401-2.934 3.13-2.934s3.13 1.314 3.13 2.934z"></path>
                </symbol>
                <symbol id="icon-nolook" viewBox="0 0 21 16">
                    <title>nolook</title>
                    <path class="path1"
                          d="M3.378 12.632c-1.608-1.237-2.773-2.862-3.378-4.632 1.323-3.872 5.267-7 10.667-7 1.342 0 2.595 0.194 3.741 0.545l-2.599 2.599c-0.363-0.094-0.746-0.145-1.141-0.145-2.356 0-4.267 1.791-4.267 4 0 0.461 0.083 0.904 0.236 1.316l-3.002 3.002c-0.098 0.098-0.183 0.203-0.256 0.313zM7.104 14.506c1.097 0.319 2.29 0.494 3.563 0.494 5.4 0 9.339-3.134 10.667-7-0.586-1.731-1.708-3.319-3.256-4.544-0.080 0.129-0.176 0.252-0.288 0.364l-3.034 3.034c0.116 0.363 0.178 0.748 0.178 1.146 0 2.209-1.91 4-4.267 4-0.329 0-0.649-0.035-0.956-0.101l-2.607 2.607z"></path>
                    <path class="path2"
                          d="M17.8 1.13c0.312 0.312 0.312 0.819 0 1.131l-13.011 13.011c-0.312 0.312-0.819 0.312-1.131 0s-0.312-0.819 0-1.131l13.011-13.011c0.312-0.312 0.819-0.312 1.131 0z"></path>
                </symbol>
                <symbol id="icon-password" viewBox="0 0 16 16">
                    <title>password</title>
                    <path class="path1"
                          d="M11.557 4.482c-0.476-0.476-0.476-1.249 0-1.725s1.248-0.476 1.725 0c0.476 0.476 0.476 1.248 0 1.725s-1.249 0.476-1.725 0zM14.681 1.322c-1.759-1.759-4.61-1.759-6.369 0-1.315 1.315-1.646 3.241-0.995 4.864-0.031 0.020-0.062 0.042-0.089 0.070l-6.875 6.875c-0.195 0.195-0.354 0.579-0.354 0.854v1.519c0 0.275 0.225 0.5 0.5 0.5l1.522-0.003c0.275-0 0.5-0.226 0.5-0.501v-1.463c0-0.275 0.225-0.5 0.5-0.5h1.463c0.275 0 0.501-0.225 0.501-0.5l0.002-1.467c0-0.275 0.226-0.5 0.501-0.5h1.463c0.275 0 0.66-0.159 0.854-0.354l1.94-1.941c0.027-0.027 0.050-0.057 0.069-0.089 1.623 0.651 3.549 0.32 4.864-0.995 1.759-1.759 1.759-4.611 0-6.369z"></path>
                </symbol>
                <symbol id="icon-reload" viewBox="0 0 17 16">
                    <title>reload</title>
                    <path class="path1" fill="none" stroke="#c0c5cc" stroke-width="1.5" stroke-miterlimit="4"
                          stroke-linecap="butt" stroke-linejoin="miter"
                          d="M8 1c-3.866 0-7 3.134-7 7s3.134 7 7 7c3.866 0 7-3.134 7-7"></path>
                    <path class="path2" fill="#c0c5cc" d="M15.018 5l1.96 3h-3.956z"></path>
                </symbol>
                <symbol id="icon-user" viewBox="0 0 14 16">
                    <title>user</title>
                    <path class="path1"
                          d="M13.474 15.158c0 0.233-0.189 0.421-0.421 0.421s-0.421-0.189-0.421-0.421c0-0.233 0.189-0.421 0.421-0.421s0.421 0.189 0.421 0.421z"></path>
                    <path class="path2"
                          d="M3.368 15.158c0 0.233-0.189 0.421-0.421 0.421s-0.421-0.189-0.421-0.421c0-0.233 0.189-0.421 0.421-0.421s0.421 0.189 0.421 0.421z"></path>
                    <path class="path3"
                          d="M9.394 10.049c-0.099-0.032-0.731-0.316-0.336-1.515h-0.006c1.026-1.058 1.812-2.76 1.812-4.436 0-2.58-1.713-3.931-3.704-3.931-1.994 0-3.697 1.35-3.697 3.931 0 1.681 0.779 3.39 1.813 4.449 0.403 1.055-0.318 1.447-0.467 1.502-2.086 0.756-4.808 2.13-4.808 3.487v0.51c0 1.85 3.86 1.859 7.178 1.859 3.325 0 7.138-0.009 7.138-1.859v-0.51c0-1.399-2.734-2.761-4.922-3.487z"></path>
                </symbol>
                <symbol id="icon-code" viewBox="0 0 32 32">
                    <title>icon-code</title>
                    <path class="path1" fill="#999"
                          d="M2.667 16c0-5.155 4.167-9.333 9.327-9.333h8.013c5.151 0 9.327 4.189 9.327 9.333 0 5.155-4.167 9.333-9.327 9.333h-8.013c-5.151 0-9.327-4.189-9.327-9.333zM13.794 20.421c0.391 0.391 1.024 0.391 1.414 0l6.474-6.474c0.391-0.391 0.391-1.024 0-1.414s-1.024-0.391-1.414 0l-5.74 5.794c0 0-2.435-2.435-2.435-2.435-0.391-0.391-1.024-0.391-1.414 0s-0.391 1.024 0 1.414l3.115 3.115z"></path>
                </symbol>
            </defs>
        </svg>

    </div>
    <section class="wrap" id="staticLoginDv">

        <!-- start logo -->
        <section class="logo"></section>
        <!-- end logo -->

        <!-- start 登录 -->
        <section class="login-wrap input-list">
            <form id="loginForm" action="/register.html" method="post">
            <ul>
                <li class="">
                    <svg class="icon icon-user">
                        <use xlink:href="#icon-user"></use>
                    </svg>
                    <input type="text" name="username" id="username" placeholder="传阅账号/手机号/邮箱"></li>
                <li class="password-input">
                    <svg class="icon icon-password">
                        <use xlink:href="#icon-password"></use>
                    </svg>
                    <input type="password" name="password" id="password" placeholder="密码">
                </li>
                <li class="password-input">
                    <svg class="icon icon-password">
                        <use xlink:href="#icon-look"></use>
                    </svg>
                    <input style="width: 54% !important;" type="text" name="valicode" id="valicode" placeholder="验证码">
                    <span><img id="verificationCodeImg" src="/verify_code.html" width="90" height="35"><a href="javascript:void(0);" onclick="var code = document.getElementById('verificationCodeImg');code.src=code.src+'?'+Math.random()"></a></span>
                </li>
            </ul>

            <div class="mask hidden">
                <div id="cap_iframe"></div>
            </div>
                <core:choose>
                    <core:when test="${errors != null && errors.size() >0}">
                        <core:forEach items="${errors}" var="err">
                            <p id="merror" class="tip red error-tip">${err.defaultMessage}</p>
                        </core:forEach>
                    </core:when>
                    <core:otherwise>
                        <p id="merror" class="tip red error-tip hidden"></p>
                    </core:otherwise>
                </core:choose>
            <!-- 去掉禁用 把disabled去掉即可 loading状态请查看loading.html -->
            <a class="red-btn disabled login-button" href="javascript:" onclick="msubmit()"><span class="load"></span>注册</a>
            <a class="red-btn disabled login-button" style="background-color: whitesmoke;border: 1px solid #c0c5cc;color: #2b2a2e" href="/to_login.html"><span class="load"></span>返回</a>
            </form>
        </section>
        <!-- end 登录 -->

    </section>

    <script src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        function msubmit() {
            var username = $("#username").val();
            var password = $("#password").val();
            var valicode = $("#valicode").val();

            if(username.trim() == "" || password.trim() == ""){
                $("#merror").removeClass("hidden");
                $("#merror").text("用户名获取密码为空");
            }

            if(valicode.trim() == ""){
                $("#merror").removeClass("hidden");
                $("#merror").text("验证码不能为空");
            }

            $("#loginForm").submit();
        }
    </script>
    </body>
</html>
