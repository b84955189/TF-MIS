<%@ page import="utils.R" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    var menu_list = [{
        id: '1',
        name: '后台首页',
        url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.SYSTEM_SERVLET.SYSTEM_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.SYSTEM_SERVLET.SYSTEM_SERVLET_METHOD_TO_ADMIN_USER_VIEW%>',
        pid: 0,
        icon: 'mdi mdi-home',
        is_out: 0,
        is_home: 1,
    },
    //     {
    //     id: '2',
    //     name: 'UI 元素',
    //     url: '#',
    //     pid: 0,
    //     icon: 'mdi mdi-palette',
    //     is_out: 0,
    //     is_home: 0,
    // }
    // , {
    //     id: '3',
    //     name: '按钮',
    //     url: 'lyear_ui_buttons.html',
    //     pid: 2,
    //     icon: '',
    //     is_out: 0,
    //     is_home: 0,
    // }, {
    //     id: '4',
    //     name: '卡片',
    //     url: 'lyear_ui_cards.html',
    //     pid: 2,
    //     icon: '',
    //     is_out: 0,
    //     is_home: 0,
    // }, {
    //     id: '5',
    //     name: '格栅',
    //     url: 'lyear_ui_grid.html',
    //     pid: 2,
    //     icon: '',
    //     is_out: 0,
    //     is_home: 0,
    // }
         {
        id: '6',
        name: '创作中心',
        url: '#',
        pid: 0,
        icon: 'mdi mdi-book-open-page-variant',
        is_out: 0,
        is_home: 0,
    }, {
        id: '7',
        name: '文章管理',
        url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.ARTICLE_SERVLET.ARTICLE_SERVLET_METHOD_TO_ARTICLE_MANAGEMENT_VIEW%>',
        pid: 6,
        icon: '',
        is_out: 0,
        is_home: 0,
    }
    //     {
    //     id: '8',
    //     name: '一级菜单',
    //     url: '#!',
    //     pid: 6,
    //     icon: '',
    //     is_out: 0,
    //     is_home: 0,
    // }, {
    //     id: '9',
    //     name: '二级菜单',
    //     url: '#!',
    //     pid: 8,
    //     icon: '',
    //     is_out: 0,
    //     is_home: 0,
    // }, {
    //     id: '10',
    //     name: '二级菜单',
    //     url: '#!',
    //     pid: 8,
    //     icon: '',
    //     is_out: 0
    // }, {
    //     id: '11',
    //     name: '三级菜单',
    //     url: '#!',
    //     pid: 10,
    //     icon: '',
    //     is_out: 0,
    //     is_home: 0,
    // }, {
    //     id: '12',
    //     name: '三级菜单',
    //     url: '#!',
    //     pid: 10,
    //     icon: '',
    //     is_out: 0,
    //     is_home: 0,
    // }
    ];
</script>
<%-- author:Jason Date: 6/11/2020 2:57 PM--%>