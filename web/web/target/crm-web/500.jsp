<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>500</title>
    <jsp:include page="/WEB-INF/views/admin/common/head.jsp" />
    <link rel="stylesheet" type="text/css" href="${staticWebsite}css/admin/error/error.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<div id="page-content" class="clearfix">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p class="text-right page-text message">
                    500!
                </p>
            </div>
            <div class="col-md-6">
                <p class="text-left page-text">
                    <span class="text-danger" style="font-size:4em;">Oops!</span>
                </p>

                <p class="text-left"> 您所请求的网页出现了些问题！我们正在努力修复中,请耐心等候。</p>

                <p class="text-left"> ${eMsg}</p>
                <p class="text-left">请点击这里返回<a href='#'>首页</a> ，或者继续浏览其他页面。</p>
            </div>
        </div>
    </div> <!-- container -->
    <div class="bottom">
        <div class="col-md-12 foot">
            <ul class="list-unstyled list-inline pull-left">
                <li>pandawork © 2015</li>
            </ul>
        </div>
    </div>
</div> <!-- page-content -->

</body>
</html>
<%
    String url = request.getAttribute("javax.servlet.error.request_uri") +
            (request.getQueryString() == null ? "" : ("?" + request.getQueryString()));
    String referer = request.getHeader("Referer");
    String ip = com.pandawork.core.common.util.IpUtil.getClientIP(request);
    String requestMethod = request.getMethod();
    String message = "500|" + url + "|" + referer + "|" + ip + "|" + requestMethod;
    com.pandawork.core.common.log.LogClerk.monitorLog.debug(message);
%>