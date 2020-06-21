<%@ page import="utils.R" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="lyear-sidebar" style="position: fixed;">
    <!-- 热门文章 -->
    <aside class="widget widget-hot-posts">
        <div class="widget-title">热门文章</div>
        <ul class="hot-articles">


        </ul>
    </aside>

    <!-- 归档 -->
    <aside class="widget">
        <div class="widget-title">分类</div>
        <ul class="article_type_bar">

        </ul>
    </aside>

    <!-- 标签 -->
    <aside class="widget widget-tag-cloud">
        <div class="widget-title">标签</div>
        <div class="tag-cloud">
            <a href="#" class="badge badge-light">php</a>
            <a href="#" class="badge badge-primary">苹果</a>
            <a href="#" class="badge badge-danger">比特币</a>
            <a href="#" class="badge badge-light">linux</a>
            <a href="#" class="badge badge-light">前端</a>
            <a href="#" class="badge badge-light">vue</a>
        </div>
    </aside>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_front_ui/js/jquery.min.js"></script>
<script>
    $(function () {
        //初始化请求热门文章
        requestHotArticles();
        //初始化请求分类专栏数据
        requestArticleTypeBar();
    });
    //请求分类专栏数据
    function requestArticleTypeBar(){
        // 获取文章类别
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_TYPES%>',
            timeout: 8000,
            success: function (msg) {
                try{
                    let article_type_data=JSON.parse(msg).<%=R.JSON.JSON_FILED_DATA%>;
                    for(let article_type_temp of article_type_data){
                        let url='${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_START_ARTICLE_TYPE_SEARCH%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_ID%>='+article_type_temp.<%=R.JSON.JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_ID%>;
                        $('.article_type_bar').append('<li><a class="article_type_bar_item" href="'+(article_type_temp.<%=R.JSON.JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_COUNT%>>0?url:'#')+'">'+article_type_temp.<%=R.JSON.JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_NAME%>+'</a> ('+article_type_temp.<%=R.JSON.JSON_FILED_ARTICLE_TYPE_FILED_ARTICLE_TYPE_COUNT%>+')</li>');
                    }

                }catch (e) {
                    $('.article_type_bar').append('<p>还没有分类专栏哦~</p>');
                }

            },
            error: function () {
                $('.article_type_bar').append('<p>还没有分类专栏哦~</p>');
            }
        });
    }
    //请求热门文章
    function requestHotArticles(){
        $.ajax({
            url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_GET_ARTICLE_LIST_JSON%>',
            type:"post",
            data: {
                limit : 3,//单页显示数目
                offset: 0,//起始索引
                page: 1,//初始页码
                sort: '<%=R.REQUEST.REQUEST_FILED_ARTICLE_READ_COUNT%>', // 排序的列名 ---暂无作用
                sortOrder: 'desc',      // 排序方式'asc' 'desc'
                searchType: '<%=R.REQUEST.REQUEST_FILED_ARTICLE_TYPE%>',//前台文章默认检索方式
                snippet: ''//默认检索全部类型
            },
            timeout:8000,
            success:function(msg){
                try{
                    let article_list_data=JSON.parse(msg);
                    if(article_list_data.<%=R.JSON.JSON_FILED_TABLE_PAGINATION_ROWS%>.length<=0){
                        //添加无热门文章提示语
                        $('.hot-articles').append('<p>还没有热门文章~</p>');
                    }else{
                        //添加数据
                        for(let article_temp of article_list_data.<%=R.JSON.JSON_FILED_TABLE_PAGINATION_ROWS%>){
                            $('.hot-articles').append('<li><a href="${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.FRONT_STAGE_SERVLET.FRONT_STAGE_SERVLET_METHOD_TO_ARTICLE_DETAIL_VIEW%>&<%=R.REQUEST.REQUEST_FILED_ARTICLE_UUID%>='+article_temp.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_UUID%>+'">'+article_temp.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_TITLE%>+'</a> <span>'+article_temp.<%=R.JSON.JSON_FILED_ARTICLE_FILED_ARTICLE_RELEASE_TIME%>+'</span></li>');
                        }
                    }

                }catch (e) {

                    //添加无热门文章提示语
                    $('.hot-articles').append('<p>还没有热门文章~</p>');
                }

            },
            error: function () {

                //添加无热门文章提示语
                $('.hot-articles').append('<p>还没有热门文章~</p>');
            }
        });
    }
</script>
<%-- author:Jason Date: 6/18/2020 10:37 PM--%>