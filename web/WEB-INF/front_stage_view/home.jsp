<%@ page import="utils.R" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>听风-MIS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Jason." />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}<%=R.GLOBAL_URL.GLOBAL_URL_WEB_FAVICON_ICON%>" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/materialdesignicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/style.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/pull_down_loading.css" />
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/animate.css" rel="stylesheet">
    <style type="text/css">
        .waterfllow-loading{
            z-index: 2000;
            visibility: hidden;
            width: 100%;
        }
        .waterfllow-loading.active{
            visibility: visible;
        }
        .waterfllow-loading .load-wrapp{
            width: 100%;
            margin: 0 auto;

            /*不能设置margin-top:auto和margin-bottom:auto否则IE下bottom就不顶用了*/
            bottom: 30px;
        }
        .arc-post-time{padding-left: 5px;}
        .arc-reader-count{padding: 0 5px;}
        .arc-post-comment{padding: 0 5px}
        .arc-preview-disabled{display: none;}
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
                <div class="col-xl-8">
                    <!-- 内容 Start -->
                    <div id="id_div_article_list_box">
                        <!-- 文章列表 -->
                    </div>
                    <!-- 内容 End -->



                    <!--加载动画 Start-->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="waterfllow-loading">
                                <div class="load-wrapp">
                                    <div class="load-3">
                                        <div class="line"></div>
                                        <div class="line"></div>
                                        <div class="line"></div>
                                        <div class="line"></div>
                                        <div class="line"></div>
                                        <div class="line"></div>
                                        <div class="line"></div>
                                        <div class="line"></div>
                                        <div class="line"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--加载动画 End -->
                </div>


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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/main.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pull_down_loading.js"></script>
<!--消息提示-->
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-notify.min.js"></script>
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/loading.js"></script>
<script>
    //滚动下拉请求标记   无正在请求的AJAX（false）/存在正在请求的AJAX（true）
    var scroll_pull_down_request_sign=false;
    //分页起始参数
    var page_params={
        limit : 4,//单页显示数目
        offset: 0,//起始索引
        page: 1,//初始页码
        sort: '<%=R.REQUEST.REQUEST_FILED_ARTICLE_ID%>', // 排序的列名 ---暂无作用
        sortOrder: 'desc',      // 排序方式'asc' 'desc'
        searchType: '<%=R.REQUEST.REQUEST_FILED_ARTICLE_TYPE%>',//前台文章默认检索方式
        snippet: ''//默认检索全部类型
    };
    //动态改变分页查询参数函数
    function queryParams(params){
        return {
            limit : params.limit,//单页显示数目
            offset: (params.page-1)*params.limit,//起始索引
            page: params.page,//初始页码
            sort: params.sort, // 排序的列名 ---暂无作用
            sortOrder: params.sortOrder,      // 排序方式'asc' 'desc'
            searchType: params.searchType,//前台文章默认检索方式
            snippet: params.snippet//默认检索全部类型
        };
    }
    $(function () {
        //初始化请求文章数据
        waterallowData();

        //图片查询中正对浏览器主页面滚动事件处理(瀑布流)。只能使用window方式绑定，使用document方式不起作用
        $(window).on('scroll',function(){
            if(scrollTop() + windowHeight() >= (documentHeight() - 30/*滚动响应区域高度取30px*/)){
                waterallowData();
            }
            /*TODO: listening scroll bar to top action. ajax request again.*/
            // if(scrollTop() + windowHeight() < (documentHeight() - 370)){
            //     scroll_pull_down_request_sign=false;
            //     $('.arrive_bottom_tips_box').remove();
            // }
        });
        //请求数据
        function waterallowData(){
            $('.waterfllow-loading').addClass('active');

            if(!scroll_pull_down_request_sign){
                //设置已经存在AJAX请求
                scroll_pull_down_request_sign=true;
                $.ajax({
                    url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_LIST_JSON%>',
                    type:"post",
                    data: queryParams(page_params),
                    timeout:8000,
                    success:function(msg){
                        try{
                            let article_list_data=JSON.parse(msg);
                            //添加数据
                            appendArticle(article_list_data.<%=R.JSON.JSON_FILED_TABLE_PAGINATION_ROWS%>)



                            if(article_list_data.<%=R.JSON.JSON_FILED_TABLE_PAGINATION_TOTAL%><=queryParams(page_params).offset){
                                //不再AJAX请求
                                scroll_pull_down_request_sign=true;
                                //隐藏加载条
                                $('.waterfllow-loading').css('visibility','hidden');
                                //添加到底提示语
                                $('#id_div_article_list_box').append('<div class="arrive_bottom_tips_box" style="text-align: center;border-top: 1px solid #ddd"><p style="margin-top: 10px;color: #00aaaa"><i class="mdi mdi-emoticon-poop"></i>&nbsp;到底啦~</p></div>');
                            }else{
                                //页码+1
                                page_params.page++;
                            }

                        }catch (e) {
                            //不再AJAX请求
                             scroll_pull_down_request_sign=true;
                            //隐藏加载条
                            $('.waterfllow-loading').css('visibility','hidden');
                            //添加到底提示语
                           $('#id_div_article_list_box').append('<div class="arrive_bottom_tips_box" style="text-align: center;border-top: 1px solid #ddd"><p style="margin-top: 10px;color: #00aaaa"><i class="mdi mdi-emoticon-poop"></i>&nbsp;到底啦~</p></div>');
                        }

                    },
                    error: function () {
                        scroll_pull_down_request_sign=true;
                        //隐藏加载条
                        $('.waterfllow-loading').css('visibility','hidden');
                        //添加到底提示语
                        $('#id_div_article_list_box').append('<div class="arrive_bottom_tips_box" style="text-align: center;border-top: 1px solid #ddd"><p style="margin-top: 10px;color: #00aaaa"><i class="mdi mdi-emoticon-poop"></i>&nbsp;到底啦~</p></div>');

                    }
                });

            }

        }
        //追加元素
        function appendArticle(rows) {
            for(let article of rows){
                console.log(article);
                let li_arc_mate_arc_post_time='<li><i class="mdi mdi-calendar"></i><span class="arc-post-time">'+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_RELEASE_TIME%>+'</span></li>';
                let li_arc_meta_arc_reader_count='<li><i class="mdi mdi-eye"></i> <span class="arc-reader-count">'+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_READ_COUNT%>+'</span>阅读</li>';
                /*TODO: add a JSON field.*/
                let li_arc_meta_arc_post_comment='<li><i class="mdi mdi-comment-multiple-outline"></i> <a href="#"><span class="arc-post-comment">3</span>评论</a></li>';

                let ul_arc_meta='<ul class="arc-meta">'+li_arc_mate_arc_post_time+li_arc_meta_arc_reader_count+li_arc_meta_arc_post_comment+'</ul>';

                let h2_and_a_arc_title='<h2><a class="arc-title" href="'+'${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_ARTICLE_DETAIL_VIEW%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_UUID%>='+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID%>+'">'+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE%>+'</a></h2>';

                let div_arc_header='<div class="arc-header">'+h2_and_a_arc_title+ul_arc_meta+'</div>';

                let a_and_img_arc_preview_poster='<a href="'+'${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_ARTICLE_DETAIL_VIEW%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_UUID%>='+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID%>+'"><img src="'+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_POSTER%>+'" alt="" class="img-fluid rounded"></a>';
                let div_arc_preview='<div class="arc-preview '+(article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_POSTER%>==''?'arc-preview-disabled':'')+'">'+a_and_img_arc_preview_poster+'</div>';

                let p_arc_synopsis_content='<p>'+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_SUMMARY%>+'</p>';
                let div_arc_synopsis='<div class="arc-synopsis">'+p_arc_synopsis_content+'</div>';

                let article_lyear_arc='<article class="lyear-arc">'+div_arc_header+div_arc_preview+div_arc_synopsis+'</article>';
                $('#id_div_article_list_box').append(article_lyear_arc);
            }
            //设置不存在AJAX请求
            scroll_pull_down_request_sign=false;
        }
    });
</script>
</body>
</html>
<%-- author:Jason Date: 6/17/2020 4:16 PM--%>