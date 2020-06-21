<%@ page import="utils.R" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<aside class="lyear-layout-sidebar">

    <!-- logo -->
    <div id="logo" class="sidebar-header">
        <a href="${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.SYSTEM_SERVLET.SYSTEM_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.SYSTEM_SERVLET.SYSTEM_SERVLET_METHOD_TO_ADMIN_USER_VIEW%>"><img src="http://storage.lking.top/logo-sidebar.png" title="TF-MIS" alt="TF-MIS" width="200px" height="70px" /></a>
    </div>
    <div class="lyear-layout-sidebar-scroll">

        <nav class="sidebar-main">

        </nav>

        <div class="sidebar-footer">
            <p class="copyright">Copyright &copy; 2020. <a target="_blank" href="https://www.lking.top">听风随笔</a> All rights reserved.</p>
        </div>
    </div>

</aside>
<%-- author:Jason Date: 6/10/2020 7:34 PM--%>