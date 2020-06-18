<%@ page import="utils.R" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文章发布</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}<%=R.GLOBAL_URL.GLOBAL_URL_WEB_FAVICON_ICON%>" />
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <!-- Markdown Editor md CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/editor_md/css/editormd.css" />

    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/style.min.css" rel="stylesheet">
    <style type="text/css">
        html,body,form,.layout{height: 100%;width: 100%;}
        .layout{position: absolute;}
        .artical_tools_bar{position: relative;display: flex;flex-direction: row;align-items: center;justify-content: center;}

        .back_btn{flex-shrink: 0;padding-left: 30px;}
        .article_title_input{width: 100%;padding-left: 10px;}
        .article_type{flex-shrink: 0;padding-left: 10px;}
        .article_post_btn{flex-shrink: 0;padding: 0px 10px;}
        .user_box{flex-shrink: 0;padding: 0px 30px 0px 5px;}
        .btn_user_option{display: none;}
        /*成功提示页*/
        .success_alert{display: none;z-index: 9999;position: fixed;width: 100%;height: 100%;background-color: #EEE;font-family: "microsoft yahei";}
        .post_box{width: 600px;height: 500px;position: fixed;top: 50%;left: 50%;transform: translate(-50%,-50%);background-color: #FFF;border-radius: 10px; box-shadow: 3px 3px 5px 1px #AAA;padding: 30px 20px;}
        .article_mini_info{position: relative;background-color: #EEE;margin-top: 20px;padding: 20px 10px 10px;height: 280px;}
        .article_summary_box{
            color: #999;font-size: 14px;margin: 8px 0px;
            height: 173px;
            overflow:hidden;
            text-overflow:ellipsis;

            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 9;
            overflow: hidden;
            /*-webkit-line-clamp用来限制在一个块元素显示的文本的行数。 为了实现该效果，它需要组合其他的WebKit属性。常见结合属性：
            display: -webkit-box; 必须结合的属性 ，将对象作为弹性伸缩盒子模型显示 。
            -webkit-box-orient 必须结合的属性 ，设置或检索伸缩盒对象的子元素的排列方式 。*/
        }
        .link_bar{text-align: center;padding: 50px;}
    </style>
</head>
<body>
<div class="layout">
    <form id="id_form_editor_md" action="#" method="post">

        <input id="id_input_hidden_article_id" type="hidden" name="<%=R.REQUEST.REQUEST_FILED_ARTICLE_ID%>" value="0"/>
        <div class="artical_tools_bar" style="width: 100%; height: 56px; overflow: inherit;">
            <div class="back_btn">
                <a title="文章管理" href="${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_ARTICLE_MANAGEMENT_VIEW%>">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org  /1999/xlink" width="89px" height="17px" viewbox="0 0 89 17" version="1.1">
                        <g id="页面1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                            <g id="MD编辑器优化-20190916" transform="translate(-24.000000, -24.000000)" fill="#6B6B6B">
                                <g id="Group-4" transform="translate(21.000000, 24.000000)">
                                    <path d="M11.2719767,13.1315385 C11.4864972,13.3286154 11.6239413,13.6086154 11.6239413,13.9230769 C11.6239413,14.5175385 11.1410006,15 10.5459486,15 C10.2651315,15 10.0118033,14.8901538 9.81992058,14.7140769 L9.8172256,14.7167692 L3.34926962,8.79369231 L3.3519646,8.791 C3.13690507,8.59392308 3,8.31392308 3,8 C3,7.68553846 3.13690507,7.40553846 3.3519646,7.20846154 L3.34926962,7.20630769 L9.8172256,1.28323077 L9.81992058,1.28538462 C10.0118033,1.10984615 10.2651315,1 10.5459486,1 C11.1410006,1 11.6239413,1.48192308 11.6239413,2.07692308 C11.6239413,2.39084615 11.4864972,2.67138462 11.2719767,2.86792308 L11.2741327,2.87061538 L5.6734218,8 L11.2741327,13.1288462 L11.2719767,13.1315385 Z M21.152,3.336 L28.604,3.336 C28.118,2.382 27.524,1.482 26.804,0.636 L28.1,0.168 C28.784,1.032 29.396,2.094 29.972,3.336 L36.848,3.336 L36.848,4.632 L34.04,4.632 C33.158,7.476 31.826,9.87 30.062,11.778 C31.97,13.398 34.364,14.73 37.244,15.792 L36.542,16.872 C33.554,15.756 31.106,14.37 29.162,12.696 C27.11,14.586 24.554,15.972 21.494,16.854 L20.81,15.72 C23.834,14.91 26.318,13.632 28.262,11.868 C26.174,9.816 24.734,7.404 23.924,4.632 L21.152,4.632 L21.152,3.336 Z M25.202,4.632 C25.976,7.062 27.29,9.168 29.162,10.968 C30.764,9.222 31.934,7.116 32.69,4.632 L25.202,4.632 Z M46.37,12.066 L41.348,12.066 L41.348,6.594 L52.688,6.594 L52.688,12.066 L47.702,12.066 L47.702,13.326 L54.92,13.326 L54.92,14.478 L47.702,14.478 L47.702,16.728 L46.37,16.728 L46.37,14.478 L39.08,14.478 L39.08,13.326 L46.37,13.326 L46.37,12.066 Z M42.626,9.834 L42.626,10.986 L51.41,10.986 L51.41,9.834 L42.626,9.834 Z M51.41,8.826 L51.41,7.674 L42.626,7.674 L42.626,8.826 L51.41,8.826 Z M42.968,2.688 L40.25,2.688 L40.25,1.554 L46.208,1.554 C46.064,1.122 45.902,0.708 45.722,0.348 L47.108,0.132 C47.288,0.564 47.45,1.032 47.63,1.554 L53.75,1.554 L53.75,2.688 L51.086,2.688 L50.438,4.362 L54.686,4.362 L54.686,5.478 L39.332,5.478 L39.332,4.362 L43.634,4.362 L42.968,2.688 Z M44.948,4.362 L49.106,4.362 L49.736,2.688 L44.282,2.688 L44.948,4.362 Z M70.148,7.404 L70.148,10.932 L61.166,10.932 L61.166,12.174 L70.976,12.174 L70.976,16.8 L69.698,16.8 L69.698,16.044 L61.166,16.044 L61.166,16.782 L59.87,16.782 L59.87,7.404 L70.148,7.404 Z M61.166,14.892 L69.698,14.892 L69.698,13.218 L61.166,13.218 L61.166,14.892 Z M61.166,9.888 L68.888,9.888 L68.888,8.448 L61.166,8.448 L61.166,9.888 Z M72.632,5.226 L72.632,8.484 L71.372,8.484 L71.372,6.342 L58.628,6.342 L58.628,8.484 L57.368,8.484 L57.368,5.226 L64.496,5.226 C64.316,4.794 64.136,4.416 63.938,4.056 L65.198,3.84 L65.09,3.768 C65.954,2.688 66.566,1.518 66.962,0.222 L68.204,0.492 C68.078,0.87 67.952,1.23 67.808,1.59 L73.01,1.59 L73.01,2.724 L69.806,2.724 C70.184,3.228 70.49,3.696 70.706,4.128 L69.554,4.56 C69.23,3.912 68.852,3.3 68.42,2.724 L67.286,2.724 C66.962,3.336 66.584,3.912 66.188,4.452 L65.216,3.858 C65.414,4.272 65.612,4.722 65.792,5.226 L72.632,5.226 Z M59.528,2.724 C59.096,3.426 58.628,4.074 58.088,4.668 L56.954,3.948 C58.034,2.832 58.826,1.572 59.33,0.204 L60.572,0.474 C60.428,0.87 60.266,1.23 60.122,1.59 L64.946,1.59 L64.946,2.724 L61.922,2.724 C62.318,3.264 62.66,3.786 62.912,4.272 L61.724,4.722 C61.4,4.038 61.004,3.372 60.554,2.724 L59.528,2.724 Z M81.488,1.014 L90.29,1.014 L90.29,9.33 L86.546,9.33 L86.546,11.454 L90.596,11.454 L90.596,12.678 L86.546,12.678 L86.546,15.018 L91.262,15.018 L91.262,16.26 L80.426,16.26 L80.426,15.018 L85.25,15.018 L85.25,12.678 L81.182,12.678 L81.182,11.454 L85.25,11.454 L85.25,9.33 L81.488,9.33 L81.488,1.014 Z M89.048,8.178 L89.048,5.748 L86.546,5.748 L86.546,8.178 L89.048,8.178 Z M85.25,8.178 L85.25,5.748 L82.73,5.748 L82.73,8.178 L85.25,8.178 Z M82.73,4.614 L85.25,4.614 L85.25,2.166 L82.73,2.166 L82.73,4.614 Z M86.546,2.166 L86.546,4.614 L89.048,4.614 L89.048,2.166 L86.546,2.166 Z M75.134,6.972 L77.096,6.972 L77.096,2.706 L74.882,2.706 L74.882,1.482 L80.624,1.482 L80.624,2.706 L78.428,2.706 L78.428,6.972 L80.408,6.972 L80.408,8.214 L78.428,8.214 L78.428,12.3 C79.112,12.066 79.76,11.814 80.408,11.526 L80.408,12.786 C78.752,13.47 76.97,14.046 75.062,14.514 L74.738,13.272 C75.53,13.128 76.322,12.948 77.096,12.732 L77.096,8.214 L75.134,8.214 L75.134,6.972 Z" id="形状结合"></path>
                                </g>
                            </g>
                        </g>
                    </svg></a>


            </div>
            <div class="article_title_input">
                <input id="id_input_article_title" type="text" name="<%=R.REQUEST.REQUEST_FILED_ARTICLE_TITLE%>" maxlength="25" class="form-control" placeholder="输入文章标题" style="width: 100%;">
            </div>
            <div class="article_type">
                <select class="custom-select" name="<%=R.REQUEST.REQUEST_FILED_ARTICLE_TYPE%>" id="id_select_article_type">
                    <option selected value="0">文章类别</option>

                </select>
            </div>
            <div class="article_post_btn">
                <input id="id_btn_post_article" type="button" class="btn" value="发布文章" />
            </div>
            <div class="user_box">
                <div class="btn_user_info">
                    <div class="user_avater">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/static/light_year_ui/images/users/avatar.jpg" alt="Jason." title="Jason." width="32px" height="32px" style="border-radius: 15px;"/>
                        </a>
                    </div>
                    <div class="btn_user_option"></div>
                </div>
            </div>

        </div>
        <div id="id_editor_md">
		    <textarea id="id_editor_textarea" style="display:none;">输入文章内容，支持Markdown。
		    </textarea>
        </div>

        <%--摘要模态框--%>
        <div class="modal fade" id="id_article_summary_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalCenterTitle">摘要</h6>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <textarea class="form-control" style="resize: none;height: 100px" name="<%=R.REQUEST.REQUEST_FILED_ARTICLE_SUMMARY%>" id="id_textarea_article_summary" maxlength="150" style="width: 100%;height: 100%;"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>
<%--成功提示页--%>
<div id="id_div_success_alert_dialog" class="success_alert">
    <div class="post_box">
        <p><a href="${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_ARTICLE_MANAGEMENT_VIEW%>" style="color: #3399ea;text-decoration: none;font-size: 15px;">&lt;&nbsp;管理博文</a></p>
        <div class="article_mini_info">
            <p style="line-height: 30px;font-size: 18px;color: #000000;" id="id_success_alert_p_article_title">文章标题</p>
            <div id="id_success_alert_div_article_summary" class="article_summary_box">文章摘要</div>
            <p style="color: #6b6b6b;font-size: 14px;position: absolute;bottom: 10px;right: 10px;">仗剑天涯，从你的摘要开始</p>
        </div>
        <div class="link_bar">
            <a href="#" id="id_success_alert_a_article_link" style="color: #3399ea;text-decoration: none;font-size: 15px;"><span class="mdi mdi-rocket"></span>发布成功并查看文章&nbsp;&gt;</a>

        </div>
    </div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- Markdown Editor md JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/static/editor_md/editormd.js"></script>
<!-- Bootstrap-maxlength JavaScript 文件 -->
<script src="https://cdn.staticfile.org/bootstrap-maxlength/1.10.0/bootstrap-maxlength.min.js"></script>
<!--消息提示-->
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-notify.min.js"></script>
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/loading.js"></script>
<script type="text/javascript">
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
    var editor_intention;
    var editor_intention_post='${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_POST_ARTICLE%>';
    var editor_intention_update='${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_UPDATE_ARTICLE%>';
    //编辑状态下的文章信息
    var article_data;
    //不同状态下的提示语
    var editor_intention_tips_success='';
    var editor_intention_tips_failed='';
    $(function() {
        // 限制标题长度
        $("input#id_input_article_title").maxlength({
            threshold: 25,
            alwaysShow: false,
            warningClass: "badge badge-info",
            limitReachedClass: "badge badge-warning"
        });

        //限制摘要长度
        $("textarea#id_textarea_article_summary").maxlength({
            threshold: 100,
            alwaysShow: false,
            warningClass: "badge badge-info",
            limitReachedClass: "badge badge-warning"
        });
        // 获取文章类别
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_TYPES%>',
            success: function (msg) {

                let article_type_data=JSON.parse(msg).<%=R.JSON.JSON_FILED_DATA%>;
                for(let i=0;i<article_type_data.length;i++){
                    $('#id_select_article_type').append('<option value="'+article_type_data[i].<%=R.JSON.JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_ID%>+'">'+article_type_data[i].<%=R.JSON.JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_NAME%>+'</option>');
                }

                //判断打开编辑器目的
                if('<%=R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_EDIT_ARTICLE%>'==='${sessionScope.intention}'){
                    //设置请求url
                    editor_intention=editor_intention_update;
                    //设置提示语
                    editor_intention_tips_failed='更新失败，请重新尝试！';
                    editor_intention_tips_success='更新成功！';
                    //获取文章信息
                    $.ajax({
                            url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLES%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_ID%>=${sessionScope.article_id}',
                            type: 'get',
                            data: {<%=R.REQUEST.REQUEST_FILED_ARTICLE_ID%>:${sessionScope.article_id}},
                            timeout: 8000,
                            success: function (msg) {
                                //隐藏加载动画
                                loading.loading('hide');
                                try{
                                     article_data=JSON.parse(msg);
                                    //填充隐藏域文章id
                                    $('#id_input_hidden_article_id').val(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_ID%>);
                                    //填充标题
                                    $('#id_input_article_title').val(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE%>);
                                    //填充下拉框
                                    $("#id_select_article_type").each(function(){
                                        $(this).find("option").eq(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TYPE%>).prop("selected",true);
                                    });
                                    //填充摘要
                                    $('#id_textarea_article_summary').val(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_SUMMARY%>);
                                    //填充内容
                                    $('#id_editor_textarea').val(article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_CONTENT%>);

                                }catch (e) {
                                    loading.notify('数据拉取失败！请重新访问', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                                    //设置0.5s后返回管理页
                                    setTimeout(function(){
                                        window.location.href='${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_ARTICLE_MANAGEMENT_VIEW%>';
                                    },5e2);
                                }



                            },
                             error: function () {
                                 //隐藏加载动画
                                 loading.loading('hide');
                                 loading.notify('数据拉取失败！请重新访问', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                                 //设置0.5s后返回管理页
                                 setTimeout(function(){
                                     window.loading.href='${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_ARTICLE_MANAGEMENT_VIEW%>';
                                 },5e2);
                            }
                        });
                }else if('<%=R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_POST_ARTICLE%>'==='${sessionScope.intention}'){
                    //设置请求url
                    editor_intention=editor_intention_post;
                    //设置提示语
                    editor_intention_tips_failed='发布失败，请重新发布！';
                    editor_intention_tips_success='发布成功！';
                    //隐藏加载动画
                    loading.loading('hide');
                }else {

                }
            }
        });

        //Markdown Editor
       var editor = editormd("id_editor_md", {
            width  : "100%",
            height : "100%",
            name : '<%=R.REQUEST.REQUEST_FILED_ARTICLE_CONTENT%>',
            /*TODO: Big Bug, fix html auto decode script code.*/
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            // theme : "dark",
            // previewTheme : "dark",
            // editorTheme : "pastel-on-dark",
            emoji : true,
            codeFold : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
            path   : "${pageContext.request.contextPath}/static/editor_md/lib/",
           //Toolbar Icons
           toolbarIcons : function () {
                /*TODO: add a article poster image setting button.*/
                return [
                    "undo", "redo", "|",
                    "bold", "del", "italic", "quote", "ucwords", "uppercase", "lowercase", "|",
                    "h1", "h2", "h3", "h4", "h5", "h6", "|",
                    "list-ul", "list-ol", "hr", "|",
                    "link", "reference-link", "image", "code", "preformatted-text", "code-block", "table", "datetime", "emoji", "html-entities", "pagebreak", "|",
                    "goto-line", "watch", "preview", "fullscreen", "clear", "search", "|",
                    "article_summary", "article_poster"
                ];
                /*TODO: add a article poster setting button.*/
            },
           //Toolbar Icon Class
           // toolbarIconsClass : {
           //      article_info: "fa fa-info-circle"
           // },
           //Toolbar Test
           toolbarIconTexts : {
                article_summary : "摘要",
                article_poster : '海报'
           },
           //By custom elements
           // toolbarCustomIcons : {
           //     article_summary : '<input class="btn btn-primary" type="button" value="摘要"/>'
           // }
           toolbarHandlers : {
               /**
                * @param {Object}      cm         CodeMirror对象
                * @param {Object}      icon       图标按钮jQuery元素对象
                * @param {Object}      cursor     CodeMirror的光标对象，可获取光标所在行和位置
                * @param {String}      selection  编辑器选中的文本
                */
                article_summary: function (cm, icon, cursor, selection) {
                    $('#id_article_summary_modal').modal('show');
                }
           }

        });
       //发布按钮
        $('#id_btn_post_article').on('click',function () {

            //检测是否输入信息完整
           if($('#id_input_article_title').val()===''){
               loading.notify('请输入标题!', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
           }else if($('#id_select_article_type').val()==0){
               loading.notify('请选择文章类别！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
           }else if($("[name='article_content']").val()===''){
               loading.notify('请输入内容！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
           }else {
               //显示加载动画
               loading.loading('show');
               $.ajax({
                   type: 'post',
                   url: editor_intention,
                   data: $('#id_form_editor_md').serialize(),
                   timeout: 8000,
                   success: function (msg) {
                       //隐藏加载动画
                       loading.loading('hide');
                       try{
                           let result_data=JSON.parse(msg);
                           setTimeout(function(){
                               switch (result_data.<%=R.JSON.JSON_STATUS_CODE%>) {
                                   case '<%=R.JSON.JSON_STATUS_CODE_500%>':{
                                       loading.notify(editor_intention_tips_failed, 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                                   };break;
                                   case '<%=R.JSON.JSON_STATUS_CODE_200%>':{
                                       //设置成功页信息
                                       $('#id_success_alert_p_article_title').html($('#id_input_article_title').val());
                                       $('#id_success_alert_div_article_summary').html($('#id_editor_textarea').text());


                                       //判断打开编辑器目的
                                       if('<%=R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_EDIT_ARTICLE%>'==='${sessionScope.intention}'){
                                           $('#id_success_alert_a_article_link').attr('href','${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_ARTICLE_DETAIL_VIEW%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_UUID%>='+article_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID%>);
                                       }else if('<%=R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_POST_ARTICLE%>'==='${sessionScope.intention}'){
                                           $('#id_success_alert_a_article_link').attr('href','${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_ARTICLE_DETAIL_VIEW%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_UUID%>='+result_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID%>);
                                       }else{
                                           $('#id_success_alert_a_article_link').attr('href','${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_ARTICLE_DETAIL_VIEW%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_UUID%>='+result_data.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID%>);
                                       }

                                       $('#id_div_success_alert_dialog').css('display','block');
                                   };break;
                                   default:{
                                       loading.notify(editor_intention_tips_failed, 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                                   };break;
                               }
                           },5e2);
                       }catch (e) {
                           loading.notify(editor_intention_tips_failed, 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                       }

                   },
                   error: function () {
                      //隐藏加载动画
                       loading.loading('hide');
                       loading.notify(editor_intention_tips_failed, 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                   }
               });
           }



        });
    });
</script>
</body>
</html>

<%-- author:Jason Date: 6/11/2020 3:20 PM--%>