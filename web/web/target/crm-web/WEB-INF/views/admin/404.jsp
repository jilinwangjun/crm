<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>404</title>
    <jsp:include page="common/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="${staticWebsite}css/admin/error/error.css">
</head>
<body>
<jsp:include page="common/header.jsp"/>
<div id="page-content" class="clearfix">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p class="text-right page-text message">
                    404!
                </p>
            </div>
            <div class="col-md-6">
                <p class="text-left page-text">
                    <span class="text-info" style="font-size:4em;">Uh-oh</span>
                </p>

                <p class="text-left"> 我们无法找到您所请求的页面！</p>

                <p class="text-left">请点击这里返回<a href='${website}admin'>首页</a> ，或者继续浏览其他页面。</p>
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

    String scheme = request.getScheme();    //协议类型
    String domain = request.getServerName(); //获取域名
    String contextPath = request.getContextPath();    //获取contextPath
    String serverPort = Integer.toString(request.getServerPort());    //主机端口
    String servletPath = request.getServletPath();
    String uri = scheme + "://" + domain + ":" + serverPort + contextPath + servletPath;

    String referer = request.getHeader("Referer");
    String ip = com.pandawork.core.common.util.IpUtil.getClientIP(request);
    String requestMethod = request.getMethod();
    String message = "404|" + uri + "|" + referer + "|" + ip + "|" + requestMethod;
    com.pandawork.core.common.log.LogClerk.monitorLog.debug(message);
%>
