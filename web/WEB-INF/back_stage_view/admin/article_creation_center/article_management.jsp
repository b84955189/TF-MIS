<%@ page import="utils.R" %>
<%@ page import="bean.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>文章管理 - 听风-微管理(TF-TIM)后台</title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}<%=R.GLOBAL_URL.GLOBAL_URL_WEB_FAVICON_ICON%>" />
    <meta name="keywords" content="听风-微管理(TF-TIM)后台">
    <meta name="description" content="听风-微管理(TF-TIM),小型信息管理系统。">
    <meta name="author" content="Jason.">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/js/jconfirm/jquery-confirm.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/style.min.css" rel="stylesheet">
    <!--Start 左侧导航数据-->
    <jsp:include page="<%=R.GLOBAL_URL.GLOBAL_URL_NAV_MENU_DATA_LIST%>"></jsp:include>
    <!--End 左侧导航数据-->
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--Start 左侧导航-->
        <jsp:include page="<%=R.GLOBAL_URL.GLOBAL_URL_NAV_COMPONENT%>"></jsp:include>
        <!--End 左侧导航-->

        <!--头部信息-->
        <header class="lyear-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="lyear-aside-toggler">
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                        </div>
                        <span class="navbar-page-title">文章管理</span>
                    </div>

                    <!--Start 右侧主题&用户信息模块-->
                    <jsp:include page="<%=R.GLOBAL_URL.GLOBAL_URL_RIGHT_THEME_USER_COMPONENT%>"></jsp:include>
                    <!--End 右侧主题&用户信息模块-->

                </div>
            </nav>

        </header>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-toolbar clearfix">
                                <div class="pull-right search-bar">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <input type="hidden" name="search_field" id="search-field" value="<%=R.REQUEST.REQUEST_FILED_ARTICLE_TITLE%>">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                                标题 <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <%--TODO: use javascript to update search type data.--%>
                                                <li> <a tabindex="-1" href="javascript:void(0)" data-field="<%=R.REQUEST.REQUEST_FILED_ARTICLE_TITLE%>">标题</a> </li>
                                                <li> <a tabindex="-1" href="javascript:void(0)" data-field="<%=R.REQUEST.REQUEST_FILED_ARTICLE_AUTHOR%>">作者</a> </li>
                                            </ul>
                                        </div>
                                        <input id="id_input_search_snippet" type="text" class="form-control" value="" name="snippet" placeholder="请输入名称">

                                    </div>
                                </div>
                                <div class="toolbar-btn-action">
                                    <a class="btn btn-primary m-r-5" href="${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_EDITORMD_VIEW%>&<%=R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION%>=<%=R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_POST_ARTICLE%>"><i class="mdi mdi-plus"></i> 新增</a>
                                    <a id="id_btn_batch_change_article_status_enable" class="btn btn-success m-r-5"><i class="mdi mdi-check"></i> 启用</a>
                                    <a id="id_btn_batch_change_article_status_disable" class="btn btn-warning m-r-5"><i class="mdi mdi-block-helper"></i> 禁用</a>
                                    <a id="id_btn_batch_delete_article" class="btn btn-danger"><i class="mdi mdi-window-close"></i> 删除</a>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table id="tb_departments" class="table table-bordered">

                                    </table>
                                </div>


                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </main>
        <!--End 页面主要内容-->
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/jconfirm/jquery-confirm.min.js"></script>
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/main.min.js"></script>
<!--左侧导航-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/slide_menu.js"></script>
<!--主题保存-->
<script src="https://cdn.bootcdn.net/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/theme_status.js"></script>
<!--消息提示-->
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap-notify.min.js"></script>
<script src="${pageContext.request.contextPath}/static/light_year_ui/js/loading.js"></script>
<script type="text/javascript">
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
    //搜索类型 搜索片段
    var var_searchType='<%=R.REQUEST.REQUEST_FILED_ARTICLE_TITLE%>',var_snippet='';

    //文章类型数据
    var article_types_data;
    //获取文章类别数据
    $.ajax({
        url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_TYPES%>',
        type: 'get',
        success: function (msg) {
            article_types_data=JSON.parse(msg).<%=R.JSON.JSON_FILED_DATA%>;
        }
    });
    $(function(){
        /*TODO: fix table's checkbox style.*/
        //表格
        $('#tb_departments').bootstrapTable({
            classes: 'table table-bordered table-hover table-striped',
            url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_LIST_JSON%>',
            //url: '${pageContext.request.contextPath}/test.do?method=getArticleList',
            method: 'get',
            dataType : 'json',        // 示例中是跨域的调用,所以涉及到ajax都采用jsonp,
            uniqueId: 'id',
            idField: 'id',             // 每行的唯一标识字段
            //toolbar: '#toolbar',       // 工具按钮容器
            //clickToSelect: true,     // 是否启用点击选中行
            showColumns: false,         // 是否显示所有的列
            showRefresh: false,         // 是否显示刷新按钮

            showToggle: false,        // 是否显示详细视图和列表视图的切换按钮(clickToSelect同时设置为true时点击会报错)

            pagination: true,                    // 是否显示分页
            sortOrder: "desc",                    // 排序方式
            queryParams: function(params) {
                var temp = {
                    limit: params.limit,         // 每页数据量
                    offset: params.offset,       // sql语句起始索引
                    page: (params.offset / params.limit) + 1,
                    sort: '<%=R.REQUEST.REQUEST_FILED_ARTICLE_ID%>',           // 排序的列名
                    sortOrder: params.order,      // 排序方式'asc' 'desc'
                    searchType: var_searchType,
                    snippet: var_snippet
                };
                return temp;
            },                                   // 传递参数
            sidePagination: "server",            // 分页方式：client客户端分页，server服务端分页
            pageNumber: 1,                       // 初始化加载第一页，默认第一页
            pageSize: 10,                        // 每页的记录行数
            pageList: [10, 25, 50, 100],         // 可供选择的每页的行数
            //search: true,                      // 是否显示表格搜索，此搜索是客户端搜索

            //showExport: true,        // 是否显示导出按钮, 导出功能需要导出插件支持(tableexport.min.js)
            //exportDataType: "basic", // 导出数据类型, 'basic':当前页, 'all':所有数据, 'selected':选中的数据

            columns: [
                {field: 'example',checkbox: true},
                {field: '<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_ID%>', title: 'ID', sortable: true},
                {field: '<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE%>', title: '标题'},
                /*TODO: fix long summary no ellipsis.*/
                {field: '<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_SUMMARY%>',
                    title: '摘要',
                    formatter: function (value,row,index) {
                        return '<p style="width: 200px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">'+(row.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_SUMMARY%>===''?'无摘要':row.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_SUMMARY%>)+'</p>';
                    },
                    cellStyle: {
                        css: {
                            'width':'200px'
                        }
                    }
                },
                {field: '<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_READ_COUNT%>',title: '阅读数',sortable: true},
                {field: '<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TYPE%>',title: '分类',
                    formatter: function (value,row,index) {
                        value=article_types_data[row.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TYPE%>-1].<%=R.JSON.JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_NAME%>;
                            return value;
                    }
                },
                {field: '<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_AUTHOR%>',title: '作者'},
                {field: '<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_RELEASE_TIME%>', title: '发布时间'},
                {field: '<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_STATUS%>',title: '状态',
                formatter:function(value, row, index){
                    var value="";
                    if (row.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_STATUS%> == '1') {
                        value = '<span class="badge badge-danger text-primary">禁用</span>';
                    } else if(row.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_STATUS%> == '2') {
                        value = '<span class="badge badge-success text-white">正常</span>';
                    }else {
                        value = '<span class="badge badge-success text-white">未知状态</span>' ;
                    }
                    return value;
                }
                },
                {field: 'operate',title: '操作',formatter: btnGroup,
                    events: {
                    'click .edit-btn': function (event, value, row, index) {
                        editArticle(row);
                    },
                    'click .del-btn': function (event, value, row, index) {
                        let id=[row.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_ID%>];
                        $.confirm({
                            title: '确认删除此文章？',
                            content: '接下来的操作将会删除标题为'+'<strong>'+row.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE%>+'</strong>'+'的文章，你确定删除吗？',
                            autoClose: 'cancelAction|8000',
                            buttons: {
                                deleteUser: {
                                    text: '删除',
                                    btnClass: 'btn-warning',
                                    action: function () {
                                        delArticle(id);
                                    }
                                },
                                cancelAction: {
                                    text: '取消',
                                    action: function () {

                                    }
                                }
                            }
                        });
                    }
                            }
            }],
            onLoadSuccess: function(data){
                $("[data-toggle='tooltip']").tooltip();
            }
        });
        //搜索框回车事件
        $('#id_input_search_snippet').on("keydown",function (event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            // if(e && e.keyCode==27){ // 按 Esc
            //     //要做的事情
            // }
            // if(e && e.keyCode==113){ // 按 F2
            //     //要做的事情
            // }
            if(e && e.keyCode==13){ // enter 键
              var_snippet=$('#id_input_search_snippet').val();
              //刷新表格
              $('#tb_departments').bootstrapTable('refresh');
            }
        });
        // 操作按钮
        function btnGroup ()
        {
            let html =
                '<a class="btn btn-xs btn-default m-r-5 edit-btn" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>' +
                '<a class="btn btn-xs btn-default del-btn" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>';
            return html;
        }
        // 操作方法 - 启用(1)/禁用(0)
        function change_article_status(ids,sign) {
            //显示加载页面
            loading.loading('show');
            $.ajax({
                url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_CHANGE_ARTICLE_STATUS%>',
                type: 'post',
                data: {
                    <%=R.REQUEST.REQUEST_FILED_IDS%>: ids,
                    <%=R.REQUEST.REQUEST_FILED_SIGN%>:sign
        },
            timeout:8000,
                success: function (msg) {
                //隐藏加载动画
                loading.loading('hide');
                switch (msg) {
                    case '<%=R.RESPONSE.RESPONSE_RESULT_CHANGE_ARTICLE_STATUS_FAILED%>':{loading.notify('启用失败!', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');};break;
                    case '<%=R.RESPONSE.RESPONSE_RESULT_CHANGE_ARTICLE_STATUS_SUCCESS%>':{loading.notify('启用成功！','success',5000,'mdi mdi-emoticon-happy', 'top', 'center');};break;
                    default:{loading.notify('启用失败!', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');};break;
                }
                $('#tb_departments').bootstrapTable('refresh');
            },
            error: function () {
                //隐藏加载动画
                loading.loading('hide');
                loading.notify('启用失败!', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
            }
        });
        }
        // 操作方法 - 编辑
        function editArticle(row)
        {
            window.location.href="${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_EDITORMD_VIEW%>&<%=R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION%>=<%=R.REQUEST.REQUEST_FILED_OPEN_EDITOR_INTENTION_EDIT_ARTICLE%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_ID%>="+row.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_ID%>;
        }
        // 操作方法 - 删除
        function delArticle(ids)
        {
           //显示加载页面
           loading.loading('show');
           $.ajax({
               url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_DELETE_ARTICLES%>',
               type: 'post',
               data: {
                    <%=R.REQUEST.REQUEST_FILED_IDS%>: ids
               },
               timeout:8000,
               success: function (msg) {
                   //隐藏加载动画
                   loading.loading('hide');
                    switch (msg) {
                        case '<%=R.RESPONSE.RESPONSE_RESULT_DELETE_ARTICLE_FAILED%>':{loading.notify('删除失败!', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');};break;
                        case '<%=R.RESPONSE.RESPONSE_RESULT_DELETE_ARTICLE_SUCCESS%>':{loading.notify('删除成功！','success',5000,'mdi mdi-emoticon-happy', 'top', 'center');};break;
                        default:{loading.notify('删除失败!', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');};break;
                    }
                   $('#tb_departments').bootstrapTable('refresh');
               },
               error: function () {
                   //隐藏加载动画
                   loading.loading('hide');
                   loading.notify('删除失败!', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
               }
           });

        }
        //批量启用按钮
        $('#id_btn_batch_change_article_status_enable').on('click',function () {
            let ids=[];
            let selected_rows=$('#tb_departments').bootstrapTable('getSelections');
            for(let i=0;i<selected_rows.length;i++){
                ids[i]=selected_rows[i].<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_ID%>;
            }
            $.confirm({
                title: '确认启用？',
                content: '接下来的操作将会启用文章，使得前台用户可见，你确定启用吗？',
                autoClose: 'cancelAction|8000',
                theme: 'supervan',
                buttons: {
                    deleteUser: {
                        text: '启用',
                        action: function () {
                            change_article_status(ids,<%=Article.PASS_STATUS%>)
                        }
                    },
                    cancelAction: {
                        text: '取消',
                        action: function () {

                        }
                    }
                }
            });

        });
        //批量禁用按钮
        $('#id_btn_batch_change_article_status_disable').on('click',function () {
            let ids=[];
            let selected_rows=$('#tb_departments').bootstrapTable('getSelections');
            for(let i=0;i<selected_rows.length;i++){
                ids[i]=selected_rows[i].<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_ID%>;
            }
            $.confirm({
                title: '确认禁用？',
                content: '接下来的操作将会禁用文章，使得前台用户不可见，你确定禁用吗？',
                autoClose: 'cancelAction|8000',
                theme: 'supervan',
                buttons: {
                    deleteUser: {
                        text: '禁用',
                        action: function () {
                            change_article_status(ids,<%=Article.NOT_PASS_STATUS%>)
                        }
                    },
                    cancelAction: {
                        text: '取消',
                        action: function () {

                        }
                    }
                }
            });

        });
        //批量删除按钮
        $('#id_btn_batch_delete_article').on('click',function () {
            let ids=[];
            let selected_rows=$('#tb_departments').bootstrapTable('getSelections');
            for(let i=0;i<selected_rows.length;i++){
                ids[i]=selected_rows[i].<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_ID%>;
            }
            $.confirm({
                title: '确认批量删除文章？',
                content: '接下来的操作将会批量删除文章，你确定删除吗？',
                autoClose: 'cancelAction|8000',
                theme: 'supervan',
                buttons: {
                    deleteUser: {
                        text: '删除',
                        action: function () {
                            delArticle(ids);
                        }
                    },
                    cancelAction: {
                        text: '取消',
                        action: function () {

                        }
                    }
                }
            });

        });


        //搜索框
        $('.search-bar .dropdown-menu a').click(function() {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
            var_searchType=field;
        });
    });
</script>
</body>
</html>
<%-- author:Jason Date: 6/13/2020 10:12 AM--%>