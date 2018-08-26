<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/6/18
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/chapter.css" type="text/css"/>
    <style>
        .header .top-head .search-wrap form input.search-box{
            border-color: #fd8820;
        }
        .header .top-head .search-wrap form label{
            border-color: #fd8820;
        }
        .header .top-head .search-wrap form label .iconfont{
            color: #fd8820;
        }
        .header .top-head .user-wrap li .iconfont{
            color: #fd8820;
        }
        .header .top-head .logo img {
            width: 180px;
            height: 46px;
            position: relative;
            bottom: 6px;
        }
    </style>
</head>
<body>
<%--<div class="header">
    <div class="top-head box-center cf">
        <h1 class="logo" title="传阅小说网" style="background: none">
            <a href="/index.html"><img src="/image/logo2.png"/></a>
        </h1>
        <div class="search-wrap">
            <form class="cf" id="formUrl" action="/1/search.html" method="get" target="_blank">
                <input class="search-box" id="s-box" name="title" type="text" placeholder="暖婚似火：顾少，轻轻宠" autocomplete="off"
                       value="">
                <input class="submit-input" type="submit" id="searchSubmit" data-eid="">
                <label id="search-btn" class="search-btn" for="searchSubmit"><em class="iconfont"></em></label>
            </form>
        </div>
        <div class="user-wrap">
            <div class="avatar" id="j-userWrap">
                <a class="link" href="javascript:" id="j-avatar"><img src="/image/account.1e031.png"></a>
                <div class="down-drop" id="j-userDownDrop">
                    <dl>
                        <dd><a href="javascript:" id="sign-out">退出</a></dd>
                    </dl>
                </div>
            </div>
            <ul>
                <li><a class="head-shelf" href="javascript:"><em class="iconfont"></em>我的书架</a></li>
            </ul>
        </div>
    </div>
</div>--%>
<jsp:include page="header.jsp">
    <jsp:param value="true" name="isChapter"/>
</jsp:include>
<div class="crumbs-nav" data-l1="1">
    <a href="/index.html" target="_blank">首页</a><em class="iconfont"></em>
    <a href="/${chapter.fiction.type.index}/0/1/type.html" target="_blank" data-chanid="30013" id="j_chanId">${chapter.fiction.type.name}</a><em class="iconfont"></em>
    <a class="act" href="/${chapter.fiction_id}/1/1/fiction.html" target="_blank" id="bookImg" data-bid="10028039603751303">${chapter.fiction.title}</a>
</div>
<div class="read-main-wrap font-family01" style="font-size:18px" id="j_readMainWrap">
    <div id="j_chapterBox" data-l1="3">
        <div class="text-wrap" id="chapter-25615310121292841" data-cid="25615310121292841" data-purl="javascript:void(0);" data-nurl="//www.readnovel.com/chapter/9500446903583303/25615334801648388" data-info="0|0|25615334801648388|1|0">
            <div class="main-text-wrap">
                <div class="text-head">
                    <h3 class="j_chapterName">${chapter.name}</h3>
                </div>
                <div class="read-content j_readContent">
                    ${chapter.content}
                </div>
            </div>
        </div>
    </div>

    <div class="chapter-control dib-wrap" data-l1="3">

        <a id="j_chapterPrev" target="_self" href="${prev}">上一章</a><span>|</span>
        <a href="/${chapter.fiction_id}/1/1/fiction.html" target="_blank">目录</a><span>|</span>
        <a id="j_chapterNext" target="_self" href="${next}">下一章</a>
    </div>

    <div class="la-ball-pulse j_chapterLoad hidden">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<div class="left-bar-list" id="j_leftBarList" style="top: 140px;">
    <dl>
        <dd id="j_navCatalogBtn">
            <a href="/${chapter.fiction_id}/1/1/fiction.html"><i><em class="iconfont"></em><span style="color: #262626;">目录</span></i></a>
            <div class="guide-box">
                <cite></cite>
                目录
            </div>
        </dd>
        <dd id="j_navSettingBtn">
            <a href="javascript:"><i><em class="iconfont"></em><span style="color: #262626;">设置</span></i></a>
            <div class="guide-box" style="color: #262626;">
                <cite></cite>
                设置
            </div>
        </dd>
        <dd id="j_navAddBookBtn">
            <a class="add-book" href="javascript:;" data-bookid="10112704904733103"><i><em class="iconfont"></em><span style="color: #262626;">书架</span></i></a>
            <div class="guide-box">
                <cite></cite>
                加入书架
            </div>
        </dd>
    </dl>
    <div class="panel-wrap setting" id="j_setting" style="background: white">
        <a class="iconfont close-panel setting-close" id="setting-close-btn" href="javascript:"></a>
        <div class="panel-box">
            <h4 class="lang">设置</h4>
            <div class="setting-list-wrap">
                <ul>
                    <li class="theme-list" id="j_themeList">
                        <i>阅读主题</i>
                        <span title="默认" class="theme-0 act" data-stc="0" data-st="0"><em class="iconfont">
                            </em></span>

                        <span title="牛皮纸" class="theme-1 " data-stc="1" data-st="1"><em class="iconfont">
                            </em></span>

                        <span title="淡绿色" class="theme-2 " data-stc="2" data-st="2"><em class="iconfont">
                            </em></span>

                        <span title="淡蓝色" class="theme-3 " data-stc="3" data-st="3"><em class="iconfont">
                            </em></span>

                        <span title="淡粉色" class="theme-4 " data-stc="4" data-st="4"><em class="iconfont">
                            </em></span>

                        <span title="灰色" class="theme-5 " data-stc="5" data-st="5"><em class="iconfont">
                            </em></span>

                        <span title="黑色" class="theme-6 " data-stc="6" data-st="6"><em class="iconfont">
                            </em><cite class="iconfont"></cite></span>

                    </li>
                    <li class="font-family" id="j_fontFamily"><i>正文字体</i>

                        <span data-st="0" class="yahei act">雅黑</span>

                        <span data-st="1" class="yahei ">宋体</span>

                        <span data-st="2" class="yahei ">楷书</span>

                    </li>
                    <li class="font-size" id="j_fontSize"><i>字体大小</i>
                        <cite>
                            <span class="prev"><em class="iconfont"></em></span><b></b>
                            <span class="lang">18</span><b></b>
                            <span class="next"><em class="iconfont"></em></span>
                        </cite>
                    </li>
                    <li class="page-width" id="j_pageWidth">
                        <i>页面宽度</i>
                        <cite>
                            <span class="prev"><em class="iconfont"></em></span><b></b>
                            <span class="lang">800</span><b></b>
                            <span class="next" å=""><em class="iconfont"></em></span>
                        </cite>
                    </li>
                </ul>
                <div class="btn-wrap dib-wrap">
                    <a class="red-btn" id="j_setSave" href="javascript:">保存</a>
                    <a class="grey-btn" id="j_setCancel" href="javascript:">取消</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery-1.10.2.min.js"></script>
<script>
    $(function () {
        $("#j_setting").hide();
        var stcs = ['Microsoft YaHei', 'SimSun', 'KaiTi'];
        var pageWidth = "${sessionScope.get('pageWidth')}" != "" ? "${sessionScope.get('pageWidth')}" : 800;
        var pageBar = "${sessionScope.get('pageBar')}" != "" ? "${sessionScope.get('pageBar')}" : -468;
        var fontSize = "${sessionScope.get('fontSize')}" != "" ? "${sessionScope.get('fontSize')}" : 18;
        var fontType = "${sessionScope.get('fontType')}" != "" ? "${sessionScope.get('fontType')}" : 0;
        var theme = parseInt("${sessionScope.get('theme')}" != "" ? "${sessionScope.get('theme')}" : 0);

        $(".read-main-wrap").css("width",pageWidth+"px");
        $(".left-bar-list").css("marginLeft",pageBar+"px");
        $("#j_pageWidth .lang").text(pageWidth);
        $(".read-content").css(fontSize+"px");
        $("#j_fontSize .lang").text(fontSize);
        $(".read-content").css("fontFamily",stcs[fontType]);
        $("#j_fontFamily span").removeClass("act");
        for(var i = 0 ;i<$("#j_fontFamily span").length;i++){
            if($($("#j_fontFamily span")[i]).attr('data-st') == fontType){
                $($("#j_fontFamily span")[i]).addClass('act');
            }
        }

        var stcs = ['','#f3e9c6','#e2eee2','#e2eff3','#f5e4e4','#dcdcdc','#111']
        if(theme == 6){
            $("body").css("background",stcs[theme]);
            $("a").css("color","#cccccc");
            $(".left-bar-list dd a .iconfont").css("color","#cccccc");
            $("body").css("color","#666");
            $(".left-bar-list dd a i span").css("color","#cccccc");
            $(".header .top-head").css("border","none");
            $("body").css("background",stcs[theme]);
        }else{
            $("body").css("background",stcs[theme]);
            $("a").css("color","#1a1a1a");
            $(".left-bar-list dd a i span").css("color","#262626");
            $(".left-bar-list dd a .iconfont").css("color","#262626");
        }
        $("#j_themeList span").removeClass("act");
        for(var i = 0 ;i<$("#j_themeList span").length;i++){
            if($($("#j_themeList span")[i]).attr('data-stc') == theme){
                $($("#j_themeList span")[i]).addClass('act');
            }
        }


        $("#j_themeList span").click(function () {
            var stcs = ['','#f3e9c6','#e2eee2','#e2eff3','#f5e4e4','#dcdcdc','#111']

            $("#j_themeList span").removeClass("act");
            $(this).addClass("act");
            var stc = $(this).attr("data-stc");
            if(stc == 6){
                $("body").css("background",stcs[stc]);
                $("a").css("color","#cccccc");
                $(".left-bar-list dd a .iconfont").css("color","#cccccc");
                $("body").css("color","#666");
                $(".left-bar-list dd a i span").css("color","#cccccc");
                $(".header .top-head").css("border","none");
                $("body").css("background",stcs[stc]);
            }else{
                $("body").css("background",stcs[stc]);
                $("a").css("color","#1a1a1a");
                $(".left-bar-list dd a i span").css("color","#262626");
                $(".left-bar-list dd a .iconfont").css("color","#262626");
            }

        });

        $("#j_fontFamily span").click(function () {
            var stcs = ['Microsoft YaHei','SimSun','KaiTi'];
            $("#j_fontFamily span").removeClass("act");
            $(this).addClass("act");
            $(".read-content").css("fontFamily",stcs[$(this).attr("data-st")])
        });
        
        $("#j_fontSize .prev").click(function () {
            if(parseInt($(".read-content").css("fontSize")) <= 12){
                $(".read-content").css("fontSize","12px");
            }else{
                $(".read-content").css("fontSize",(parseInt($(".read-content").css("fontSize"))-2)+"px");
            }
            $("#j_fontSize .lang").text(parseInt($(".read-content").css("fontSize")));
        });

        $("#j_fontSize .next").click(function () {
            if(parseInt($(".read-content").css("fontSize")) >= 48){
                $(".read-content").css("fontSize","48px");
            }else{
                $(".read-content").css("fontSize",(parseInt($(".read-content").css("fontSize"))+2)+"px");
            }
            $("#j_fontSize .lang").text(parseInt($(".read-content").css("fontSize")));
        });

        $("#j_pageWidth .prev").click(function () {
            if(parseInt($(".read-main-wrap").css("width")) <= 700){
                $(".read-main-wrap").css("width","700px");
            }else{
                $(".read-main-wrap").css("width",(parseInt($(".read-main-wrap").css("width")) - 100)+"px");
                $(".left-bar-list").css("marginLeft",(parseInt($(".left-bar-list").css("marginLeft")) + 50)+"px");
            }
            $("#j_pageWidth .lang").text(parseInt($(".read-main-wrap").css("width")));
        });

        $("#j_pageWidth .next").click(function () {
            if(parseInt($(".read-main-wrap").css("width")) >= 1100){
                $(".read-main-wrap").css("width","1000px");
            }else{
                $(".read-main-wrap").css("width",(parseInt($(".read-main-wrap").css("width")) + 100)+"px");
                $(".left-bar-list").css("marginLeft",(parseInt($(".left-bar-list").css("marginLeft")) - 50)+"px");
            }
            $("#j_pageWidth .lang").text(parseInt($(".read-main-wrap").css("width")));
        });

        $("#j_setSave").click(function () {
            var data={
                'pageWidth': $("#j_pageWidth .lang").text(),
                'fontSize': $("#j_fontSize .lang").text() ,
                'fontType': $("#j_fontFamily span.act").attr('data-st'),
                'theme': $("#j_themeList span.act").attr('data-stc') ,
                'pageBar': parseInt($(".left-bar-list").css("marginLeft"))
            };
            $.ajax({
                url: "/prop.html",
                type: "get",
                data:data,
                dataType: 'json',
                success: function (data) {

                },
                error: function () {
                    console.log("出错了");
                }
            });
            $("#j_setting").hide();
        });

        $("#j_navSettingBtn").click(function () {
            $("#j_setting").show();
        });
        $("#j_setCancel").click(function () {
            $("#j_setting").hide();
        });
        $("#setting-close-btn").click(function () {
            $("#j_setting").hide();
        });

        $("#j_navAddBookBtn").click(function () {
            $.ajax({
                url: "/shelf.html",
                type: "post",
                data:{'fiction_id':${chapter.fiction_id},'chapter_id':${chapter.id},'chapter_num':${chapter.number}},
                dataType: 'json',
                success: function (data) {
                    if(!data.error){
                        //书架加入成功
                        alert("成功加入书架");
                    }
                    console.log(data.msg);
                },
                error: function () {
                    console.log("出错了");
                }
            });
        });
    })
</script>

<%@ include file="footer.jsp"%>
</body>
</html>
