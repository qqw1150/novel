<%--
  Created by IntelliJ IDEA.
  User: zy
  Date: 2018/7/1
  Time: 18:46
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
    <link rel="stylesheet" href="/css/typelist.css" type="text/css"/>
    <title>Title</title>
</head>
<body>
<div class="page page-category">
    <div class="content">
        <jsp:include page="header.jsp">
            <jsp:param value="/index.html" name="goBack"/>
            <jsp:param value="分类" name="typename"/>
        </jsp:include>


        <div class="module">
            <div class="module-header booklist-module">
                <div class="module-header-l">
                    <h3 class="module-title">书籍分类</h3>
                </div>
            </div>
            <ol class="book-ol book-ol-normal">
                <li class="book-li-msg book-back">
                    <a href="/1/0/1/type.html" class="book-sort">
                        <img src="//qidian.qpic.cn/qdbimg/349573/c_25396310000735801/90" class="book-pic" alt="玄幻奇幻}">
                        <div class="book-cell">
                            <div class="book-title-x">
                                <h4 class="book-title">玄幻奇幻</h4>
                            </div>
                            <p class="book-tags">
                                <em>${typesTotal.get(FictionType.XUANHUAN)}本</em>
                            </p>
                        </div>
                    </a>
                </li>
                <li class="book-li-msg book-back">
                    <a href="/2/0/1/type.html" class="book-sort">
                        <img src="//qidian.qpic.cn/qdbimg/349573/c_22278759000152102/90" class="book-pic" alt="武侠仙侠">
                        <div class="book-cell">
                            <div class="book-title-x">
                                <h4 class="book-title">武侠仙侠</h4>
                            </div>
                            <p class="book-tags">
                                <em>${typesTotal.get(FictionType.WUXIA)}本</em>
                            </p>
                        </div>
                    </a>
                </li>
                <li class="book-li-msg book-back">
                    <a href="/3/0/1/type.html" class="book-sort">
                        <img src="//qidian.qpic.cn/qdbimg/349573/c_9500446903583303/90" class="book-pic" alt="女频言情">
                        <div class="book-cell">
                            <div class="book-title-x">
                                <h4 class="book-title">女频言情</h4>
                            </div>
                            <p class="book-tags">
                                <em>${typesTotal.get(FictionType.NVPING)}本</em>
                            </p>
                        </div>
                    </a>
                </li>
                <li class="book-li-msg book-back">
                    <a href="/4/0/1/type.html" class="book-sort">
                        <img src="//qidian.qpic.cn/qdbimg/349573/c_7920237703552803/90" class="book-pic" alt="现代都市">
                        <div class="book-cell">
                            <div class="book-title-x">
                                <h4 class="book-title">现代都市</h4>
                            </div>
                            <p class="book-tags">
                                <em>${typesTotal.get(FictionType.DUSHI)}本</em>
                            </p>
                        </div>
                    </a>
                </li>
                <li class="book-li-msg book-back">
                    <a href="/5/0/1/type.html" class="book-sort">
                        <img src="//qidian.qpic.cn/qdbimg/349573/c_22627120000545902/90" class="book-pic" alt="历史军事">
                        <div class="book-cell">
                            <div class="book-title-x">
                                <h4 class="book-title">历史军事</h4>
                            </div>
                            <p class="book-tags">
                                <em>${typesTotal.get(FictionType.LISHI)}本</em>
                            </p>
                        </div>
                    </a>
                </li>
                <li class="book-li-msg book-back">
                    <a href="/6/0/1/type.html" class="book-sort">
                        <img src="//qidian.qpic.cn/qdbimg/349573/c_25421978000077401/90" class="book-pic" alt="游戏竞技">
                        <div class="book-cell">
                            <div class="book-title-x">
                                <h4 class="book-title">游戏竞技</h4>
                            </div>
                            <p class="book-tags">
                                <em>${typesTotal.get(FictionType.YOUXI)}本</em>
                            </p>
                        </div>
                    </a>
                </li>
                <li class="book-li-msg book-back">
                    <a href="/7/0/1/type.html" class="book-sort">
                        <img src="//qidian.qpic.cn/qdbimg/349573/c_5873763503937503/90" class="book-pic" alt="科幻灵异">
                        <div class="book-cell">
                            <div class="book-title-x">
                                <h4 class="book-title">科幻灵异</h4>
                            </div>
                            <p class="book-tags">
                                <em>${typesTotal.get(FictionType.KEHUAN)}本</em>
                            </p>
                        </div>
                    </a>
                </li>
                <li class="book-li-msg book-back">
                    <a href="/8/0/1/type.html" class="book-sort">
                        <img src="//qidian.qpic.cn/qdbimg/349573/c_6120394504094103/90" class="book-pic" alt="美文同人">
                        <div class="book-cell">
                            <div class="book-title-x">
                                <h4 class="book-title">美文同人</h4>
                            </div>
                            <p class="book-tags">
                                <em>${typesTotal.get(FictionType.MEIWEN)}本</em>
                            </p>
                        </div>
                    </a>
                </li>
            </ol>
        </div>

        <!-- 页面内容 E -->
    </div>
</div>
</body>
</html>
