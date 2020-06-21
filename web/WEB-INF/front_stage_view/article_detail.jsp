<%@ page import="utils.R" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>详情页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Jason." />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}<%=R.GLOBAL_URL.GLOBAL_URL_WEB_FAVICON_ICON%>" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/materialdesignicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/js/highlight/styles/agate.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/style.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/editor_md/css/editormd.preview.css" />

    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/style.min.css" rel="stylesheet">
    <!--图标样式-->
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/lightbox/popup-lightbox.css" rel="stylesheet">

    <style>
        .arc-title{color: #4d5259;}
        .editormd-html-preview {
            width: 100%;
            margin: 0 auto;
            background-color: #f5f6fa;
            overflow-y: hidden;
            overflow-x: hidden;
        }
        .lightbox {width: 930px!important;height: 570px!important;margin-left: -450px!important;margin-top: -260px!important;}
        .lightbox .btn-close{line-height: 20px;}
        .arc-post-time{padding-left: 5px;}
        .arc-reader-count{padding: 0 5px;}
    </style>

</head>
<body>
<!--前台导航 Start-->
<jsp:include page="<%=R.GLOBAL_URL.GLOBAL_URL_FRONT_STAGE_NAVIGATION_COMPONENT%>"></jsp:include>
<!--前台导航 End-->
<div class="lyear-wrapper">
    <section class="mt-5 pb-5">
        <div class="container">

            <div class="row">
                <!-- 文章阅读 -->
                <div class="col-xl-8">
                    <article class="lyear-arc">
                        <div class="arc-header">
                            <h2><a class="arc-title" href="#">标题</a></h2>
                            <ul class="arc-meta">
                                <li><i class="mdi mdi-calendar"></i><span class="arc-post-time">2019-09-25 09:21</span></li>
                                <li><i class="mdi mdi-eye"></i> <span class="arc-reader-count">0</span>阅读</li>
                                <li><i class="mdi mdi-comment-multiple-outline"></i> <a href="#">3 评论</a></li>
                            </ul>
                        </div>

                        <div class="arc-preview">
                            <img  src="#" alt="" class="img-fluid rounded arc-poster" />
                        </div>

                        <div class="lyear-arc-detail">

                            <%-- Markdown文章显示 --%>
                            <div id="article-editormd-view">
                                <textarea style="display:none;" name="test-editormd-markdown-doc">###Hello world!</textarea>
                            </div>

                            <div class="mt-5">
                                <h6>Tags:</h6>
                                <div class="tag-cloud">
                                    <a href="#" class="badge badge-light">logo</a>
                                    <a href="#" class="badge badge-light">AI</a>
                                    <a href="#" class="badge badge-light">芯片</a>
                                </div>
                            </div>

                            <div class="mt-5 lyear-comment-title">
                                <h5><span>评论 (5)</span></h5>
                            </div>

                            <ul class="media-list list-unstyled lyear-comment">

                                <li id="comment-1">
                                    <div class="media">
                                        <img class="d-flex mr-3 rounded-circle" src="${pageContext.request.contextPath}/static/light_year_front_ui/images/author.jpg" alt="花满楼">
                                        <div class="media-body">
                                            <a href="#!" class="text-custom reply-btn" data-id="1"><i class="mdi mdi-reply"></i>&nbsp; 回复</a>
                                            <h4 class="media-heading"><a href="#!">花满楼</a></h4>
                                            <p class="text-muted post-date">2019-09-25 16:17</p>
                                            <p>只要你肯去领略，就会发现人生本是多么可爱，每个季节里都有很多足以让你忘记所有烦恼的赏心乐趣。</p>
                                        </div>
                                    </div>
                                </li>

                                <li id="comment-2">
                                    <div class="media">
                                        <img class="d-flex mr-3 rounded-circle" src="${pageContext.request.contextPath}/static/light_year_front_ui/images/author.jpg" alt="陆小凤">
                                        <div class="media-body">
                                            <a href="#!" class="text-custom reply-btn" data-id="2"><i class="mdi mdi-reply"></i>&nbsp; 回复</a>
                                            <h4 class="media-heading"><a href="#!">陆小凤</a></h4>
                                            <p class="text-muted post-date">2019-07-06 15:32</p>
                                            <p>有的人求名，有的人求利，我求的是什么呢？</p>
                                        </div>
                                    </div>
                                    <ul class="comment-children">
                                        <li id="comment-3">
                                            <div class="media">
                                                <img class="d-flex mr-3 rounded-circle" src="${pageContext.request.contextPath}/static/light_year_front_ui/images/author.jpg" alt="西门吹雪">
                                                <div class="media-body">
                                                    <a href="#!" class="text-custom reply-btn" data-id="3"><i class="mdi mdi-reply"></i>&nbsp; 回复</a>
                                                    <h4 class="media-heading"><a href="#!">西门吹雪</a></h4>
                                                    <p class="text-muted post-date">2019-07-06 15:36</p>
                                                    <p>麻烦！</p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                                <li id="comment-4">
                                    <div class="media">
                                        <img class="d-flex mr-3 rounded-circle" src="${pageContext.request.contextPath}/static/light_year_front_ui/images/author.jpg" alt="楚留香">
                                        <div class="media-body">
                                            <a href="#!" class="text-custom reply-btn" data-id="4"><i class="mdi mdi-reply"></i>&nbsp; 回复</a>
                                            <h4 class="media-heading"><a href="#!">楚留香</a></h4>
                                            <p class="text-muted post-date">2019-06-27 10:02</p>
                                            <p>闻君有白玉美人，妙手雕成，极尽妍态, 不胜心向往之。今夜子正,当踏月来取, 君素雅达，必不致令我徒劳往返也。</p>
                                        </div>
                                    </div>
                                </li>

                                <li id="comment-5">
                                    <div class="media">
                                        <img class="d-flex mr-3 rounded-circle" src="${pageContext.request.contextPath}/static/light_year_front_ui/images/author.jpg" alt="傅红雪">
                                        <div class="media-body">
                                            <a href="#!" class="text-custom reply-btn" data-id='5'><i class="mdi mdi-reply"></i>&nbsp; 回复</a>
                                            <h4 class="media-heading"><a href="#!">傅红雪</a></h4>
                                            <p class="text-muted post-date">2019-06-26 11:45</p>
                                            <p>一把刀，一条没有退路的征途；一个人，一个孤独而又寂寞的灵魂！</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <div id="respond" class="comment-respond">
                                <div class="mt-2">
                                    <h5><span>说点什么吧...</span> <small class="cancel-comment-reply" onclick="cancelReply()">(取消回复)</small></h5>
                                </div>

                                <form action="#" method="post" class="mt-4 lyear-comment-form">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input id="author" class="form-control" placeholder="昵称*" name="author" type="text" required="" />
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <input id="email" class="form-control" placeholder="邮箱*" name="email" type="text" required="" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <input id="subject" class="form-control" placeholder="网址" name="subject" type="text" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <textarea id="comment" class="form-control" rows="5" placeholder="想说的内容" name="comment" required=""></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <button name="submit" type="submit" id="submit" class="btn btn-primary">发表评论</button>
                                                <input type='hidden' name='comment_arc_id' value='1' id='comment_arc_id' />
                                                <input type='hidden' name='comment_parent' id='comment_parent' value='0' />
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>

                    </article>
                </div>
                <!-- 内容 end -->

                <!-- 侧边栏 -->
                <div class="col-xl-4">
                    <jsp:include page="<%=R.GLOBAL_URL.GLOBAL_URL_FRONT_STAGE_SIDEBAR_COMPONENT%>"></jsp:include>
                </div>
                <!-- 侧边栏 end -->
            </div>

        </div>
        <!-- end container -->
    </section>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/highlight/highlight.pack.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/main.min.js"></script>
<script type="text/javascript">hljs.initHighlightingOnLoad();</script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/prettify.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/underscore.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/sequence-diagram.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/jquery.flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/editormd.js"></script>
<!--消息提示-->
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-notify.min.js"></script>
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/loading.js"></script>
<%--Light-Box--%>
<script src="${pageContext.request.contextPath}/static/lightbox/jquery.popup.lightbox.js" type="text/javascript"></script>
<script>
    //********加载动画***********
    loading.loading('show');
    // document.onreadystatechange=function(){
    //     if(document.readyState==='complete'){
    //         setTimeout(function () {
    //             loading.loading('hide');
    //         },500)
    //     }
    // }
    //*************************
    var articleEditormdView,article_data;
    $(function () {
        //获取文章信息
        $.ajax({
            url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_GET_ARTICLE%>',
            type: 'get',
            data: {<%=R.REQUEST.REQUEST_FILED_ARTICLE_UUID%>:${requestScope.article_uuid}},
            timeout: 8000,
            success: function (msg) {
                //关闭加载页
                loading.loading('hide');
                try{
                    article_data=JSON.parse(msg);
                    //填充页面标题
                    $('title').text(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE%>+' 详情页');
                    //填充内容标题
                    $('.arc-title').text(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE%>);
                    $('.arc-title').attr('href','${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_ARTICLE_DETAIL_VIEW%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_UUID%>='+article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID%>)
                    //填充阅读人数
                    $('.arc-reader-count').text(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_READ_COUNT%>);
                    //填充海报
                    $('.arc-poster').attr('src',article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_POSTER%>);
                    //填充时间
                    $('.arc-post-time').text(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_RELEASE_TIME%>);
                    //新建并填充文章内容
                    articleEditormdView = editormd.markdownToHTML("article-editormd-view", {
                        markdown        : article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_CONTENT%> ,//+ "\r\n" + $("#append-test").text(),
                        //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                        htmlDecode      : "style,script,iframe",  // you can filter tags decode
                        // toc             : false,
                        tocm            : true,    // Using [TOCM]
                        // theme : "dark",
                        // previewTheme : "dark",
                        // editorTheme : "pastel-on-dark",
                        //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                        //gfm             : false,
                        //tocDropdown     : true,
                        // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                        emoji           : true,
                        taskList        : true,
                        tex             : true,  // 默认不解析
                        flowChart       : true,  // 默认不解析
                        sequenceDiagram : true,  // 默认不解析
                    });
                    //图片弹出查看
                    $('#article-editormd-view').popupLightbox();


                }catch (e) {
                    loading.notify('数据拉取失败！请重新访问', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                    //设置1s后返回首页
                    setTimeout(function(){
                        window.location.href='${pageContext.request.contextPath}<%=R.GLOBAL_URL.GLOBAL_URL_INDEX_PAGE%>';
                    },5e2);
                }
            },
            error: function () {
                //关闭加载页
                loading.loading('hide');
                loading.notify('数据拉取失败！请重新访问', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                //设置1s后返回首页
                setTimeout(function(){
                    window.location.href='${pageContext.request.contextPath}<%=R.GLOBAL_URL.GLOBAL_URL_INDEX_PAGE%>';
                },5e2);
            }
        });





    })

</script>
</body>
</html>
<%-- author:Jason Date: 6/17/2020 5:34 PM--%>