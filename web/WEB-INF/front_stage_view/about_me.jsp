<%@ page import="utils.R" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>关于我</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Jason." />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}<%=R.GLOBAL_URL.GLOBAL_URL_WEB_FAVICON_ICON%>" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/materialdesignicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/style.min.css" />
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/animate.css" rel="stylesheet">
</head>
<body>
<!--前台导航 Start-->
<jsp:include page="<%=R.GLOBAL_URL.GLOBAL_URL_FRONT_STAGE_NAVIGATION_COMPONENT%>"></jsp:include>
<!--前台导航 End-->
<div class="lyear-wrapper">
    <section class="mt-5 pb-5">
        <div class="container">

            <div class="row">
                <!-- 文章列表 -->
                <div class="col-12">

                    <article class="lyear-arc">
                        <div class="lyear-arc-detail">
                            <h5 class="text-center mt-0 mb-3 pb-3">关于我</h5>
                            <p>大二，Java小白。</p>
                            <p></p>
                            <h6><strong>特别鸣谢</strong></h6>
                            <ul>
                                <li><a href="https://gitee.com/yinqi/Light-Year-Blog">笔下光年</a>模板</li>
                            </ul>
                        </div>
                    </article>

                </div>
                <!-- 内容 end -->

            </div>

        </div>
        <!-- end container -->
    </section>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/main.min.js"></script>
<!--消息提示-->
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-notify.min.js"></script>
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/loading.js"></script>
</body>
</html>
<%-- author:Jason Date: 6/20/2020 7:55 PM--%>