<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="shiro" uri="http://shiro.pandawork.net/tags" %>
<html>
<head>
    <title>欢迎界面</title>
    <link rel="stylesheet" href="/css/welcome/welcome.css" />
    <jsp:include flush="true" page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
</head>
<body>
    <jsp:include flush="true" page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
<%--    <div class="container-head">
        <div class="row">
            <nav class="navbar navbar-default navbar-static-top admin-nav J_admin_nav">
                <a class="left-toggle pull-left logo-pic" href="javascript:;"></a>
                <a class="pull-left logo-text menu-list-logo" href="javascript:;">
                    &nbsp;正大国际医院<br />&nbsp;CRM客户关系管理系统
                </a>
                <ul class="nav navbar-nav margin-left" id="header-bar">
                    <li class="list">
                        <a id="logoMenu0" class="menu-logo" href="/admin"></a>
                        <a id="Menu0" class="menu-list J_layer_1_menu " data-menu-id="0" href="/admin">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;</a>
                    </li>
                    <shiro:checkPermission name="Admin:Client">
                        <li class="list">
                            <a id="logoMenu1" class="menu-logo" href="/admin/client/basic"></a>
                            <a id="Menu1" class="menu-list J_layer_1_menu " data-menu-id="1" href="/admin/client/basic">&nbsp;&nbsp;患者管理</a>
                            <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                                <shiro:checkPermission name="Admin:Client:Basic:List">
                                    <li><a class="J_menu" href="/admin/client/basic">基本信息管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:Client:Member:List">
                                    <li><a class="J_menu" href="/admin/client/member">会员管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:Client:Visit:List">
                                    <li><a class="J_menu" href="/admin/client/visit">来访管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:Client:Points:List">
                                    <li><a class="J_menu" href="/admin/client/points">积分管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:Client:Quest:List">
                                    <li><a class="J_menu" href="/admin/client/quest">问卷管理</a></li>
                                </shiro:checkPermission>
                            </ul>
                        </li>
                    </shiro:checkPermission>

                    <shiro:checkPermission name="Admin:Profile">
                        <li class="list">
                            <a id="logoMenu2" class="menu-logo" href="/admin/profile/label/list"></a>
                            <a id="Menu2" class="menu-list J_layer_1_menu" data-menu-id="2"
                               href="/admin/profile/label/list">&nbsp;&nbsp;客户画像</a>
                            <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                                <shiro:checkPermission name="Admin:Profile:Label:List">
                                    <li><a class="J_menu" href="/admin/profile/label/list">标签管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:Profile:Portrayal:List">
                                    <li><a class="J_menu" href="/admin/profile/portrayal/list">画像功能</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:Profile:Action:List">
                                    <li><a class="J_menu" href="/admin/profile/action/list">行为分析</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:Profile:Statistics">
                                    <li><a class="J_menu" href="/admin/profile/statistics/chart">统计功能</a></li>
                                </shiro:checkPermission>
                            </ul>
                        </li>
                    </shiro:checkPermission>

                    <shiro:checkPermission name="Admin:E-CRB">
                        <li class="list">
                            <a id="logoMenu3" class="menu-logo" href="/admin/event/prepare/list"></a>
                            <a id="Menu3" class="menu-list J_layer_1_menu" data-menu-id="3"
                               href="/admin/event/prepare/list">&nbsp;&nbsp;客户关怀</a>
                            <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                                <shiro:checkPermission name="Admin:E-CRB:Event:Prepare:List">
                                    <li><a class="J_menu" href="/admin/event/prepare/list">待开展活动</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:E-CRB:Event:Processing:List">
                                    <li><a class="J_menu" href="/admin//event/processing/list">进行中活动</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:E-CRB:Event:Achived:List">
                                    <li><a class="J_menu" href="/admin/event/archived/list">已归档活动</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:E-CRB:Template:List">
                                    <li><a class="J_menu" href="/admin/event/template/list">模板管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:E-CRB:Prepare:Notice:List">
                                    <li><a class="J_menu" href="/admin/event/prepareNotice/list">待办活动通知</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:E-CRB:Prepare:Affair:List">
                                    <li><a class="J_menu" href="/admin/event/affair/prepare/list">待办事项</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:E-CRB:Prepare:Quest:List">
                                    <li><a class="J_menu" href="/admin/event/quest/prepare/list">待办问卷</a></li>
                                </shiro:checkPermission>
                            </ul>
                        </li>
                    </shiro:checkPermission>

                    <shiro:checkPermission name="Admin:SAdmin">
                        <li class="list">
                            <a id="logoMenu4" class="menu-logo" href="/admin/party/security/group/list"></a>
                            <a id="Menu4" class="menu-list J_layer_1_menu" data-menu-id="3"
                               href="/admin/party/security/group/list">&nbsp;&nbsp;系统管理</a>
                            <ul class="dropdown-menu arrow" aria-labelledby="dLabel">
                                <shiro:checkPermission name="Admin:SAdmin:Party:Security:Group:List">
                                    <li><a class="J_menu" href="/admin/party/security/group/list">角色管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:SAdmin:Party:Security:Permission:List">
                                    <li><a class="J_menu" href="/admin/party/security/permission/list">权限管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:SAdmin:User:Management:Employee:List">
                                    <li><a class="J_menu" href="/admin/party/group/employee/list">用户管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:SAdmin:Party:Member:Group:List">
                                    <li><a class="J_menu" href="/admin/party/member/group/list">会员组管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:SAdmin:Party:Dictionary:List">
                                    <li><a class="J_menu" href="/admin/party/dictionary/list">字典值管理</a></li>
                                </shiro:checkPermission>
                                <shiro:checkPermission name="Admin:SAdmin:Party:PointsConvert:List">
                                    <li><a class="J_menu" href="/admin/party/pointsConvert/list">积分兑换规则管理</a></li>
                                </shiro:checkPermission>
                            </ul>
                        </li>
                    </shiro:checkPermission>
                </ul>
                <ul class="nav navbar-nav hello-administrator pull-right">
                    <li>
                        <a class="menu-list J_adminInfo admin-hello" href="javascript:;">你好，${web_user_login_name}！<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu arrow ul-box" aria-labelledby="dLabel">
                            <li><a href="/admin/personal/information"><i class="fa fa-user"></i>&nbsp;修改个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="/admin/logout"><i class="fa fa-sign-out"></i>&nbsp;退出登录</a></li>
                        </ul>
                    </li>
                    <li>
                        <img class="pull-right img-responsive administrator" src="/img/admin.png" alt="管理员图片"
                             title="管理员图片">
                    </li>
                </ul>
            </nav>
        </div>
    </div>--%>
<div class="page clearfix ">
    <div class="bg">
        <div class="col-sm-12">
            <ol class="breadcrumb">
                <%--<li><a href="#"><i class="fa fa-home"></i>&nbsp;首页</a></li>--%>
            </ol>
        </div>
        <div class="col-sm-12 margin-top--10 ">
            <h1 class="bg-box">
                <p class="small-font">欢迎进入</p>
                <p class="big-font">正大国际医院CRM</p>
            </h1>
        </div>
    </div>
</div>
    <%--<jsp:include flush="true" page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>--%>
<script type="text/javascript" src="/js/login/welcome.js"></script>
</body>

</html>