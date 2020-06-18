<%@ page import="utils.R" %>
<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>欢迎登陆|TF-MIS</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <meta name="keywords" content="TF-MIS">
    <meta name="description" content="TF-MIS">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/light_year_ui/css/style.min.css" rel="stylesheet">
    <script>

    </script>
    <style>
        body {
            display: -webkit-box;
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
            height: 100%;
        }
        .login-box {
            display: table;
            table-layout: fixed;
            overflow: hidden;
            max-width: 700px;
        }
        .login-left {
            display: table-cell;
            position: relative;
            margin-bottom: 0;
            border-width: 0;
            padding: 45px;
        }
        .login-left .form-group:last-child {
            margin-bottom: 0px;
        }
        .login-right {
            display: table-cell;
            position: relative;
            margin-bottom: 0;
            border-width: 0;
            padding: 45px;
            width: 50%;
            max-width: 50%;
            background: #67b26f!important;
            background: -moz-linear-gradient(45deg,#67b26f 0,#4ca2cd 100%)!important;
            background: -webkit-linear-gradient(45deg,#67b26f 0,#4ca2cd 100%)!important;
            background: linear-gradient(45deg,#003dde 0,#1dacf3 100%)!important;
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#67b26f', endColorstr='#4ca2cd', GradientType=1 )!important;
        }
        .login-box .has-feedback.feedback-left .form-control {
            padding-left: 38px;
            padding-right: 12px;
        }
        .login-box .has-feedback.feedback-left .form-control-feedback {
            left: 0;
            right: auto;
            width: 38px;
            height: 38px;
            line-height: 38px;
            z-index: 4;
            color: #dcdcdc;
        }
        .login-box .has-feedback.feedback-left.row .form-control-feedback {
            left: 15px;
        }
        @media (max-width: 576px) {
            .login-right {
                display: none;
            }
        }
    </style>
</head>

<body style="background-color: #0b2e13;background-image: url(https://desk-fd.zol-img.com.cn/t_s1920x1080c5/g2/M00/0B/09/ChMlWl7PToyIJGrjACisdEP2MKYAAPjaQFW9LIAKKyM250.jpg);background-size: cover;">
<div class="bg-translucent p-10">
    <div class="login-box bg-white clearfix">
        <div class="login-left">
            <form id="id_login_form" action="#!" method="post">
                <div class="form-group has-feedback feedback-left">
                    <input type="text" placeholder="请输入您的用户名" class="form-control" name="<%=R.REQUEST.REQUEST_FIELD_USER_LOGIN%>" id="id_login_input_text_user_login" />
                    <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <input type="password" placeholder="请输入密码" class="form-control" id="id_login_input_text_user_pass" name="<%=R.REQUEST.REQUEST_FIELD_USER_PASS%>" />
                    <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left row">
                    <div class="col-xs-7">
                        <input type="text" id="id_login_input_text_login_captcha" name="<%=R.REQUEST.REQUEST_FIELD_CAPTCHA%>" class="form-control" placeholder="验证码">
                        <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="col-xs-5">
                        <img src="${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.LOGIN_SERVLET.LOGIN_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.LOGIN_SERVLET.LOGIN_SERVLET_METHOD_TO_GET_CAPTCHA%>" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'&d='+Math.random();" title="点击刷新" alt="captcha">
                    </div>
                </div>
                <div class="form-group">
                    <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="<%=R.REQUEST.REQUEST_FIELD_USER_ROLE%>" value="<%=User.COMMON_USER%>" checked><span>普通用户</span>
                    </label>
                    <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="<%=R.REQUEST.REQUEST_FIELD_USER_ROLE%>" value="<%=User.ADMIN_USER%>"><span>管理员</span>
                    </label>
                </div>
                <div class="form-group">
                    <label class="lyear-checkbox checkbox-inline checkbox-primary m-t-10">
                        <input type="checkbox" disabled><span>5天内自动登录</span>
                    </label>
                    <label class="lyear-checkbox checkbox-inline checkbox-primary m-t-10">
                        <a class="btn-link" href="#">注册</a>
                    </label>
                </div>
                <div class="form-group">
                    <button class="btn btn-block btn-primary"  id="id_log_in_btn" style="border-radius: 20px" type="button">立即登录</button>
                </div>
            </form>
        </div>
        <div class="login-right">
            <p><a href="/"><img src="http://storage.lking.top/logo_panel.png" class="m-b-md m-t-xs" alt="logo"></a></p>
            <p class="text-white m-tb-15">TF-MIS,一个小型信息管理系统。</p>
            <p class="text-white">Copyright © 2020 <a href="https://www.lking.top">听风随笔</a>. All right reserved</p>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/light_year_ui/js/bootstrap.min.js"></script>
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
    $('#id_log_in_btn').on('click',function () {
        if($('#id_login_input_text_user_login').val()===''||$('#id_login_input_text_user_pass').val()===''||$('#id_login_input_text_login_captcha').val()===''){
            if($('#id_login_input_text_user_login').val()===''||$('#id_login_input_text_user_pass').val()===''){
                loading.notify('用户名或密码不可以为空！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
            }else{
                loading.notify('请输入验证码！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
            }
            $('#id_login_input_text_login_captcha').val('');
            $('#captcha').click();
        }else{
            //显示遮罩
            loading.loading('show');
            $.ajax({
                url: '${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.LOGIN_SERVLET.LOGIN_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.LOGIN_SERVLET.LOGIN_SERVLET_METHOD_TO_LOGIN%>&t='+new Date().getTime(),
                type: 'post',
                data: $('#id_login_form').serialize(),
                timeout: 8000,
                success: function (msg) {
                    loading.loading('hide');
                    switch (msg) {
                        case 'common_success':{window.location.href='${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.SYSTEM_SERVLET.SYSTEM_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.SYSTEM_SERVLET.SYSTEM_SERVLET_METHOD_TO_COMMON_USER_VIEW%>';};break;
                        case 'admin_success':{window.location.href='${pageContext.request.contextPath}<%=R.GLOBAL_SERVLET_INFO.SYSTEM_SERVLET.SYSTEM_SERVLET_URL_PATTERN%>?<%=R.REQUEST.REQUEST_METHOD%>=<%=R.GLOBAL_SERVLET_INFO.SYSTEM_SERVLET.SYSTEM_SERVLET_METHOD_TO_ADMIN_USER_VIEW%>';};break;
                        case 'account_error':{loading.notify('用户名或密码错误！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');$('#id_login_input_text_login_captcha').val('');$('#captcha').click();$('#id_login_input_text_user_pass').val('')};break;
                        case 'captcha_error':{loading.notify('验证码错误！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');$('#id_login_input_text_login_captcha').val('');$('#captcha').click();};break;
                        // case 'password_error':{loading.notify('密码错误！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');$('#id_login_input_text_login_captcha').val('');$('#captcha').click();};break;
                        case 'unknown_error':{loading.notify('请检查网络！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');$('#id_login_input_text_login_captcha').val('');$('#captcha').click();};break;
                        default:{loading.notify('请检查网络！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');$('#id_login_input_text_login_captcha').val('');$('#captcha').click();};break;
                    }
                },
                error: function () {
                    loading.loading('hide');
                    loading.notify('响应超时，请检查网络！', 'danger', 3000, 'mdi mdi-emoticon-sad', 'top', 'center');
                    $('#id_login_input_text_login_captcha').val('');
                    $('#captcha').click();
                }
            });

        }




    });
</script>
</body>
</html>
<%-- author:Jason Date: 6/10/2020 5:09 PM--%>