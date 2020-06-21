<%@ page import="utils.R" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang='pl'>
<head>
    <title>海报相册</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui, user-scalable=no">
    <link href="${pageContext.request.contextPath}/static/gallery/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/gallery/css/screen.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/gallery/css/ma5gallery.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/light_year_front_ui/css/style.min.css" />
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/animate.css" rel="stylesheet">
    <style type="text/css">
        .top-bar{width: 100%;height: 50px;background-color: rgba(50,50,50,0.5)!important;display: flex;}
        .div_back_btn{margin-left: 50px;line-height: 50px;flex-shrink: 0;cursor: pointer}
        .gallery_title{line-height: 50px;width: 100%;flex-shrink: 1; text-align: center;}
    </style>

</head>
<body style="background-color: #000000!important;">
<div class="top-bar">
    <div class="div_back_btn"><a style="color: #FFF;" href="${pageContext.request.contextPath}<%=R.GLOBAL_URL.GLOBAL_URL_INDEX_PAGE%>">返回首页</a></div>
    <div class="gallery_title"><h4>海报相册</h4></div>
</div>
<section class="site-header container">

    <div class="ma5-gallery">

    </div>
</section>

<div style="text-align:center;clear:both;">
</div>
<script src="${pageContext.request.contextPath}/static/gallery/js/jquery.js"></script>
<%--<script src="${pageContext.request.contextPath}/static/gallery/js/ma5gallery.js"></script>--%>
<script src="${pageContext.request.contextPath}/static/gallery/js/functions.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pull_down_loading.js"></script>
<!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/gallery/js/html5.js"></script>
    <![endif]-->
<!--消息提示-->
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-notify.min.js"></script>
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/loading.js"></script>
<script>
    //********加载动画***********
    loading.loading('show');
    document.onreadystatechange=function(){
        if(document.readyState==='complete'){
            setTimeout(function () {
                 loading.loading('hide');
            },500)
        }
    }
    //*************************
    //无正在请求的AJAX（false）/存在正在请求的AJAX（true）
    var scroll_pull_down_request_sign=false;
    //分页起始参数
    var page_params={
        limit : 56,//单页显示数目
        offset: 0,//起始索引
        page: 1,//初始页码
        sort: '<%=R.REQUEST.REQUEST_FILED_ARTICLE_ID%>', // 排序的列名 ---暂无作用
        sortOrder: 'asc',      // 排序方式'asc' 'desc'
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
                            }else{
                                //页码+1
                                page_params.page++;
                            }

                        }catch (e) {
                            //不再AJAX请求
                            scroll_pull_down_request_sign=true;

                        }

                    },
                    error: function () {
                        scroll_pull_down_request_sign=true;
                    }
                });

            }

        }
        //追加元素
        function appendArticle(rows) {
            for(let article of rows){
                let figure_element='<figure class="gallery-item ma5-lightbox">'+'<img src="'+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_POSTER%>+'" alt="">'+'<figcaption>'+article.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE%>+'</figcaption>'+'</figure>';
                $('.ma5-gallery').append(figure_element);
            }
            //设置不存在AJAX请求
            scroll_pull_down_request_sign=false;

            $.fn.ma5preload = function() {
                $('body').append('<div class="ma5-preloadbox"></div>');
                this.each(function(){
                    if (typeof $(this).data('ma5pathtofull') !== "undefined") {
                        $(this).clone().attr('src', $(this).data('ma5pathtofull')).appendTo('.ma5-preloadbox');
                    } else {
                        $(this).clone().attr('src', $(this).attr('src').replace(/\-thumbnail./, '.')).appendTo('.ma5-preloadbox');
                    }
                });
            };
            function enterFullScreen(selector) {
                if (document.documentElement.requestFullscreen) {
                    document.documentElement.requestFullscreen();
                } else if (document.documentElement.msRequestFullscreen) {
                    document.documentElement.msRequestFullscreen();
                } else if (document.documentElement.mozRequestFullScreen) {
                    document.documentElement.mozRequestFullScreen();
                } else if (document.documentElement.webkitRequestFullscreen) {
                    document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
                }
            }
            function exitFullScreen(selector) {
                if (document.exitFullscreen) {
                    document.exitFullscreen();
                } else if (document.msExitFullscreen) {
                    document.msExitFullscreen();
                } else if (document.mozCancelFullScreen) {
                    document.mozCancelFullScreen();
                } else if (document.webkitExitFullscreen) {
                    document.webkitExitFullscreen();
                }
                ma5exit(selector);
            }
            function ma5showActive(selector, fullscreen) {
                $('.ma5-imgbox').addClass('ma5-previous');
                $('.ma5-prev').removeClass('ma5-hide');
                $('.ma5-next').removeClass('ma5-hide');
                $('.ma5-imgbox .ma5-html-content-center').removeClass('ready-to-play');
                if(!$('.ma5-tmp .ma5-active').prev().length) {
                    $('.ma5-prev').addClass('ma5-hide');
                }
                if(!$('.ma5-tmp .ma5-active').next().length) {
                    $('.ma5-next').addClass('ma5-hide');
                }
                setTimeout(function() {$('.ma5-imgbox.ma5-previous').remove();$('html').removeClass('ma5-in');}, 500);
                var ma5clone = '';
                if($('.ma5-active').hasClass('ma5-html')) {
                    ma5clone = $('.ma5-active .ma5-html-content').clone().addClass('ma5-clone');
                } else {
                    if (typeof $('.ma5-active img').data('ma5pathtofull') !== "undefined") {
                        ma5clone = $('.ma5-active img').clone().attr('src', $('.ma5-active img').data('ma5pathtofull')).addClass('ma5-clone');
                    } else {
                        ma5clone = $('.ma5-active img').clone().attr('src', $('.ma5-active img').attr('src').replace(/\-thumbnail./, '.')).addClass('ma5-clone');
                    }
                }
                $('html').addClass('ma5-in');
                $('body').append('<div class="ma5-imgbox noSwipe"></div>');
                ma5showFigcaption();
                ma5toggleFigcaption();
                ma5hideFigcaption();
                $(ma5clone).appendTo($('.ma5-imgbox').last());
                $('.ma5-close').on('touch click', function() {
                    exitFullScreen(selector);
                });
                $('.ma5-imgbox .ma5-html-content-center').on('click touch', function () {
                    $(this).addClass('ready-to-play');
                });
                if(fullscreen === true) {
                    enterFullScreen(selector);
                }
            }

            function ma5exit(selector) {
                $(selector).removeClass('ma5-active');
                $('.ma5-imgbox').addClass('ma5-out');
                $('.ma5-tmp').addClass('ma5-out');
                $('.ma5-prev, .ma5-next').remove();
                $('.ma5-figcaption').addClass('ma5-out');
                $('html').addClass('ma5-closing');
                setTimeout(function() {
                    $('.ma5-tmp').remove();
                    $('.ma5-imgbox').remove();
                    $('html').removeClass('ma5-gallery-active ma5-lightbox-active ma5-loaded ma5-closing');
                    $('.ma5-figcaption').remove();
                    $('.ma5-close').remove();
                    $('.ma5-backdrop').remove();
                    $('.ma5-toggle-control').remove();
                    $('.ma5-toggle-figcaption').remove();
                    $(document).scrollTop(localStorage.getItem("position"));
                }, 400);
            }
            function ma5goPrev(selector) {
                if($('.ma5-tmp .ma5-active').prev().length) {
                    $('.ma5-tmp .ma5-active').removeClass('ma5-active').prev().addClass('ma5-active');
                    ma5showActive(selector);
                }
            }
            function ma5goNext(selector) {
                if($('.ma5-tmp .ma5-active').next().length) {
                    $('.ma5-tmp .ma5-active').removeClass('ma5-active').next().addClass('ma5-active');
                    ma5showActive(selector);
                }
            }
            function ma5showFigcaption() {
                if( $('.ma5-active').has('figcaption').length ) {
                    $('.ma5-toggle-figcaption').remove();
                    $('body').append('<span class="ma5-toggle-figcaption noSwipe"><span class="ma5-gallery-icon-info"></span></span>');
                    $('.ma5-figcaption').removeClass('ma5-figcaption').addClass('ma5-figcaption-old');
                    $('body').append('<div class="ma5-figcaption noSwipe"><div class="ma5-centerbox"><span class="ma5-gallery-icon-info"></span></div></div>');
                    $('.ma5-imgbox').last().addClass('ma5-has-figcaption');
                    $('.ma5-active figcaption').contents().clone().appendTo($('.ma5-figcaption .ma5-centerbox'));

                } else {
                    $('.ma5-figcaption').addClass('ma5-out');
                    setTimeout(function() {$('.ma5-figcaption').remove(); $('.ma5-toggle-figcaption').remove();}, 400);
                }
            }
            function ma5toggleFigcaption() {
                $('.ma5-toggle-figcaption').on('touch click', function() {
                    $('.ma5-figcaption').toggleClass('ma5-figcaption-visible');
                });
            }

            function ma5hideFigcaption() {
                setTimeout(function() {$('.ma5-figcaption-old').remove();}, 400);
            }

            $.fn.ma5gallery = function(atributes) {

                // Microsoft IE detect
                function isIE() {
                    return ((navigator.appName == 'Microsoft Internet Explorer') || ((navigator.appName == 'Netscape') && (new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})").exec(navigator.userAgent) !== null)));
                }
                if( isIE() ) {
                    $('body').addClass( 'ie' );
                }
                if(atributes.preload === true) {
                    $(this.selector+' img').ma5preload();
                }
                if(atributes.fullscreen === true) {

                }
                var selector = this.selector;
                $(selector).addClass('ma5-lightbox');
                var thisSelector = '.ma5-tmp '+this.selector;
                $(this).on('touch click', function(event) {
                    if(typeof(Storage) !== "undefined") {
                        localStorage.setItem("position", $(document).scrollTop());
                    }
                    $('body').append('<span class="ma5-close noSwipe"><span class="ma5-gallery-icon-close"></span></span><div class="ma5-backdrop"></div>');
                    if(!$('.ma5-imgbox').hasClass('ma5-out') && !$('html').hasClass('ma5-in') ) {
                        setTimeout(function() {$('html').addClass('ma5-loaded');}, 30);
                        if($(this).parent().hasClass('ma5-gallery') || $(this).parent().hasClass('ma5-bg')) {
                            // gallery mode
                            $(this).addClass('ma5-active').parent().clone().appendTo($('body')).removeClass('ma5-gallery').addClass('ma5-tmp noSwipe');
                            $('.ma5-gallery .ma5-active').removeClass('ma5-active');
                            if (!$('html').hasClass('ma5-gallery-active')) {
                                $('body').append('<div class="ma5-prev noSwipe"><span class="ma5-gallery-icon-left"></span></div><div class="ma5-next noSwipe"><span class="ma5-gallery-icon-right"></span></div><span class="ma5-toggle-control noSwipe"><span class="ma5-gallery-icon-dot"></span></span>');
                                $('.ma5-toggle-control').on('touch click', function() {
                                    $('.ma5-tmp').toggleClass('ma5-visible');
                                });
                                $('html').addClass('ma5-gallery-active');
                                $('.ma5-tmp').find(selector).wrapAll( '<div class="ma5-bg" />');
                                setTimeout(function() {$('.ma5-tmp').addClass('ma5-control');}, 400);
                                ma5showActive(selector, atributes.fullscreen);


                            }
                            if(!$('.ma5-tmp .ma5-active').prev().length) {
                                $('.ma5-prev').addClass('ma5-hide');
                            }
                            if(!$('.ma5-tmp .ma5-active').next().length) {
                                $('.ma5-next').addClass('ma5-hide');
                            }
                            $('.ma5-prev').on('touch click', function() {
                                if($("html").hasClass('ma5-gallery-active')) {
                                    ma5goPrev(selector);
                                }
                            });
                            $('.ma5-next').on('touch click', function() {
                                if($("html").hasClass('ma5-gallery-active')) {
                                    ma5goNext(selector);
                                }
                            });
                            $(thisSelector).on('touch click', function() {
                                if(!$(this).hasClass('ma5-active') && !$("html").hasClass('ma5-in') ) {
                                    $(thisSelector).removeClass('ma5-active');
                                    $(this).addClass('ma5-active');
                                    ma5showActive(selector, atributes.fullscreen);
                                }
                            });
                        } else {
                            //lightbox mode
                            $('html').addClass('ma5-lightbox-active');
                            $(this).addClass('ma5-active');
                            ma5showActive(selector, atributes.fullscreen);
                        }
                    }
                });
                // full screen
                if(atributes.fullscreen === true) {
                    (function() {
                        var fullScreenApi = {
                                supportsFullScreen: false,
                                isFullScreen: function() { return false; },
                                requestFullScreen: function() {},
                                cancelFullScreen: function() {},
                                fullScreenEventName: '',
                                prefix: ''
                            },
                            browserPrefixes = 'webkit moz o ms khtml'.split(' ');
                        if (typeof document.cancelFullScreen != 'undefined') {
                            fullScreenApi.supportsFullScreen = true;
                        } else {
                            for (var i = 0, il = browserPrefixes.length; i < il; i++ ) {
                                fullScreenApi.prefix = browserPrefixes[i];

                                if(fullScreenApi.prefix == 'ms') {
                                    if (typeof document.msExitFullscreen != 'undefined' ) {
                                        fullScreenApi.supportsFullScreen = true;
                                        break;
                                    }
                                } else {
                                    if (typeof document[fullScreenApi.prefix + 'CancelFullScreen' ] != 'undefined' ) {
                                        fullScreenApi.supportsFullScreen = true;
                                        break;
                                    }
                                }
                            }
                        }
                        if (fullScreenApi.supportsFullScreen) {
                            if(fullScreenApi.prefix == 'ms') {
                                fullScreenApi.fullScreenEventName = 'MSFullscreenChange';
                            } else {
                                fullScreenApi.fullScreenEventName = fullScreenApi.prefix + 'fullscreenchange';
                            }
                            fullScreenApi.isFullScreen = function() {
                                switch (this.prefix) {
                                    case '':
                                        return document.fullScreen;
                                    case 'webkit':
                                        return document.webkitIsFullScreen;
                                    case 'ms':
                                        return document.msFullscreenElement;
                                    default:
                                        return document[this.prefix + 'FullScreen'];
                                }
                            };
                            fullScreenApi.requestFullScreen = function(el) {
                                return (this.prefix === '') ? el.requestFullScreen() : el[this.prefix + 'RequestFullScreen']();
                            };
                            fullScreenApi.cancelFullScreen = function(el) {
                                return (this.prefix === '') ? document.cancelFullScreen() : document[this.prefix + 'CancelFullScreen']();
                            };
                        }
                        if (typeof jQuery != 'undefined') {
                            jQuery.fn.requestFullScreen = function() {

                                return this.each(function() {
                                    if (fullScreenApi.supportsFullScreen) {
                                        fullScreenApi.requestFullScreen(this);
                                    }
                                });
                            };
                        }
                        window.fullScreenApi = fullScreenApi;
                    })();
                }
                var fs = false;
                var changeHandler = false;
                if(atributes.fullscreen === true) {
                    changeHandler = function(){
                        fs = fullScreenApi.isFullScreen();
                        if (!fs) {
                            exitFullScreen(selector);
                        }
                    };
                }
                //key navigate
                $("body").keydown(function(e) {
                    if($("html").hasClass('ma5-gallery-active')) {
                        if(e.keyCode == 37) {ma5goPrev(selector);} else if(e.keyCode == 39) {ma5goNext(selector);}
                        if (e.keyCode == 32) {
                            $('.ma5-control').toggleClass('ma5-visible');
                        }
                    }
                    if(e.keyCode == 27) {
                        exitFullScreen(selector);
                    }
                });
                if(atributes.fullscreen === true) {
                    document.addEventListener("fullscreenchange", changeHandler, false);
                    document.addEventListener("webkitfullscreenchange", changeHandler, false);
                    document.addEventListener("mozfullscreenchange", changeHandler, false);
                    document.addEventListener("MSFullscreenChange", changeHandler, false);
                }
            };

            $('.gallery-item').ma5gallery({
                preload:true,
                fullscreen:false
            });
    }






    });
</script>
</body>
</html>
<%-- author:Jason Date: 6/20/2020 5:52 PM--%>