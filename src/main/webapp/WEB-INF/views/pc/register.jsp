<%--
  Created by IntelliJ IDEA.
  User: 14521
  Date: 2018/7/4
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/bootstrapValidator.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/index.css" type="text/css"/>
    <style>
        .mainbody {
            min-height: 390px;
            width: 948px;
            margin: 10px auto;
            border: 1px solid #C7C7C7;
            position: relative;
            padding-top: 35px;
        }
        b.topl {
            top: -1px;
            left: -1px;
            background-position: -572px 0;
        }
        b.topl {
            top: -1px;
            left: -1px;
            background-position: -572px 0;
        }
        b.topl {
            top: -1px;
            left: -1px;
            background-position: -572px 0;
        }
        b.topl {
            top: -1px;
            left: -1px;
            background-position: -572px 0;
        }
        .mainbody h1 {
            margin: 0 0 27px 32px;
            background: url(/image/zctext.gif) 0 0 no-repeat;
            height: 18px;
            padding-left: 130px;
            font-size: 14px;
            color: #F00;
        }
        .left {
            float: left;
            width: 855px;
            padding-left: 25px;
        }
        .left {
            float: left;
            width: 855px;
            padding-left: 25px;
        }
        .edit div p {
            clear: both;
            line-height: 40px;
            height: 40px;
            overflow: hidden;
            font-size: 12px;
        }
        .edit label {
            margin-right: 10px;
            width: 80px;
            display: block;
            float: left;
            line-height: 35px;
            text-align: right;
        }
        .edit div input {
            float: left;
            width: 260px;
            height: 35px;
            line-height: 35px;
            border: 1px solid #C7C7C7;
            padding: 0 5px;
            background: #F6F6F6;
        }
        .edit label {
            margin-right: 10px;
            width: 80px;
            display: block;
            float: left;
            line-height: 35px;
            text-align: right;
        }
        .edit div p {
            clear: both;
            line-height: 40px;
            height: 40px;
            overflow: hidden;
            font-size: 12px;
        }
        .header .top-nav-wrap {
            position: relative;
            z-index: 20;
        }
        .zcbtn input {
            cursor: pointer;
            background: url(/image/zc0823.gif) no-repeat 0 -287px;
            width: 172px;
            height: 54px;
            border: 0;
            margin-bottom: 20px;
            margin-left: 90px;
        }
        .edit .m, .edit .load {
            float: left;
            background: url(/image/zc0823.gif) no-repeat -608px -42px;
            font-size: 12px;
            width: 148px;
            margin-left: 8px;
            padding: 0 0 7px 25px;
            line-height: 18px;
            height: 38px;
            color: #999;
            overflow: hidden;
        }
        .edit .m1 {
            float: left;
            background: url(/image/zc0823.gif) no-repeat -608px -42px;
            font-size: 12px;
            width: 148px;
            margin-left: 8px;
            padding: 0 0 7px 25px;
            line-height: 30px;
            overflow: hidden;
            height: 38px;
            color: #999;
        }
        .edit .no {
            float: left;
            background: url(/image/zc0823.gif) no-repeat -608px 0;
            font-size: 12px;
            color: #F00;
            margin-left: 8px;
            padding: 0 0 6px 25px;
            line-height: 38px;
        }
        .header .top-head .search-wrap form label{
            height: 34px !important;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="mainbody">
    <!-- 圆角 -->
    <b class="topl"></b> <b class="topr"></b> <b class="botl"></b> <b class="botr"></b>
    <!-- 圆角 -->
    <div class="VIP7AD"></div>
    <h1></h1>
    <div class="left">
        <form action="/register.html" method="post" id="formMR" class="form-horizontal">
            <div class="edit" style="position: relative;" id="adit">
                    <core:if test="${errors != null && errors.size() > 0}">
                        <core:forEach var="err" items="${errors}">
                            <div class="form-group">
                                <label class="col-lg-3 control-label"><em></em></label>
                                <div class="col-lg-4" style="color: red">${err.defaultMessage}</div>
                            </div>
                        </core:forEach>
                    </core:if>
                <div class="form-group">
                    <label class="col-lg-3 control-label"><em></em>用户名</label>
                    <div class="col-lg-4">
                    <input type="text" name="username" class="form-control" placeholder="用户名/手机号/邮箱"/>

                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label"><em></em>密码</label>
                    <div class="col-lg-4">
                        <input type="password" name="password" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">验证码</label>
                    <div class="col-lg-4">
                        <input type="text" name="valicode" class="yzinput" maxlength="4" class="form-control"/>
                    </div>
                    <div class="col-lg-5">
                        <span class="yz"><img id="verificationCodeImg" src="/verify_code.html" width="90" height="35"><a href="javascript:void(0);" onclick="var code = document.getElementById('verificationCodeImg');code.src=code.src+'?'+Math.random()">看不清换一张</a></span>
                    </div>
                </div>
            </div>
            <div class="line-x"></div>
            <div class="zcbtn">
                <input type="submit" id="submitBut" value=" "/>
            </div>
        </form>
    </div>

    <div class="right1">
    </div>
    <div class="cl"></div>

</div>

<script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/bootstrapValidator.min.js"></script>
<script>
    $(function () {
        if($("input.yzinput").val().trim() == ""){
            var yzm = $(this).next().next();
            $(yzm).removeClass();
            $(yzm).addClass("no");
        }
    })

    $(document).ready(function() {
        // Generate a simple captcha
        $('#formMR').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                verificationCode: {
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            message: '密码长度最少6位'
                        }
                    }
                }
            }
        });

        // Validate the form manually
        $('#submitBut').click(function() {
            $('#formMR').bootstrapValidator('validate');
            if ($('#formMR').data('bootstrapValidator').isValid()) {//获取验证结果，如果成功，执行下面代码
                document.getElementById("formMR").submit();
            }
        });
    });
</script>
<%@ include file="footer.jsp"%>
</body>
</html>
