<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.pandawork.net/tags" %>
<html>
<head>
    <title>进行中活动列表</title>
    <jsp:include flush="true" page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
</head>
<body>
<jsp:include flush="true" page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
<div class="page clearfix">
    <div class="holder">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li>
                            <a href="/admin"><i class="fa fa-home"></i>&nbsp;首页</a>
                        </li>
                        <li>
                            <a href="/admin/event/prepare/list">活动管理</a>
                        </li>
                        <li class="active">通知处理</li>
                    </ol>
                    <input type="hidden" class="clientId" value="${clientId}">
                </div>
                <shiro:checkPermission name="Admin:E-CRB:Event:Processing:BatchNotice">
                <div class="col-sm-12 ">
                    <div class="col-sm-12 margin-bottom-10 margin-top--10 padding-left">
                        <a href="#" class="btn btn-success btn-radius-no J_inform" data-toggle="modal" data-target="#addDialog">
                            <i class="fa fa-plus"></i>&nbsp;批量通知</a>
                    </div>
                </div>
                </shiro:checkPermission>
                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" class="J_selectAll"></th>
                                        <th>活动名称</th>
                                        <th>活动类别</th>
                                        <th>活动级别</th>
                                        <th>本期开始时间</th>
                                        <th>通知内容</th>
                                    </tr>
                                    </thead>
                                    <tbody id="J_template">
                                    </tbody>
                                </table>
                            </div>
                            <div class="pull-left record">
                                共<span class="J_record"></span>条记录
                            </div>
                            <div class="pull-right">
                                <ul id="pageLimit"></ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-12 margin-bottom-30 margin-top--10">
                    <div class="form-horizontal J_detailForm">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>待办通知详情</h4>
                            </div>
                            <div class="panel-body">
                                <input type="hidden" name="eventRecordNoticeId" class="eventRecordNoticeId" value="${eventRecordNoticeId}">
                                <input type="hidden" name="id" class="eventTermId" value="${event.id}">
                                <input type="hidden" name="clientId" class="clientId" value="${clientId}">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><span class="requires"></span>活动名称</label>
                                        <div class="col-sm-6">
                                            <input class="w200" type="text" name="name" value="${event.name}" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">活动级别</label>
                                        <div class="col-sm-6">
                                            <input class="w200" type="text" name="level" value="${event.levelValue}" readonly="readonly"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">活动时间</label>
                                        <div class="col-sm-6">
                                            <input readonly="readonly" name="startDate" class="w200" type="text"
                                                   value="<fmt:formatDate value="${event.eventStartDate}" type="date"></fmt:formatDate>"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">循环粒度</label>
                                        <div class="col-sm-6">
                                            <input readonly="readonly" name="pollingTime" class="w200" type="text"
                                                   <c:if test="${event.pollingTime == 1}">value="年"</c:if>
                                                   <c:if test="${event.pollingTime == 2}">value="月"</c:if>
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">是否关联积分</label>
                                        <div class="col-sm-6">
                                            <input readonly="readonly" name="isPointsRelated" class="w200" type="text"
                                                   <c:if test="${event.isPointsRelated == 0}">value="否"</c:if>
                                                   <c:if test="${event.isPointsRelated == 1}">value="是"</c:if>
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">活动类型</label>
                                        <div class="col-sm-6">
                                            <input readonly="readonly" name="type" class="w200" type="text" value="${event.typeValue}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">提醒时间</label>
                                        <div class="col-sm-4">
                                            <input readonly="readonly" name="remindTime" class="w200" type="text" value="活动前"/>
                                        </div>
                                        <div class="col-sm-3">
                                            <input class="w50 J_date" type="text" readonly="readonly" name="time" value="${event.remindTime}">&nbsp;日
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">到</label>
                                        <div class="col-sm-6">
                                            <input class="w200" name="endDate" type="text" readonly="readonly"
                                                   value="<fmt:formatDate value="${event.eventStartDate}" type="date"></fmt:formatDate>"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">本期开始时间</label>
                                        <div class="col-sm-6">
                                            <input class="w200" name="startDate" type="text" readonly="readonly"
                                                   value="<fmt:formatDate value="${event.startDate}" type="date"></fmt:formatDate>"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">活动人员</label>
                                        <div class="col-sm-6">
                                            <input readonly="readonly" name="memberGroupId" class="w200" type="text" value="${event.memberGroupName}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-12">
                                    <h4>活动内容</h4>
                                    <hr>
                                    <textarea readonly="readonly" name="content" class="col-sm-12 h100">${event.content}</textarea>
                                </div>
                                <div class="form-group col-sm-12">
                                    <h4>通知内容</h4>
                                    <hr>
                                    <textarea readonly="readonly" name="noticeContent" class="col-sm-12 h100">${event.noticeContent}</textarea>
                                </div>
                                <form class="form-group col-sm-12 J_detailForm">
                                    <h4>处理内容</h4>
                                    <hr>
                                    <input name="id" hidden="hidden" value="${eventRecordNoticeId}" />
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">本期状态</label>
                                        <div class="col-sm-6">
                                            <select name="eventParticipantStatus" class="w200 form-control participantStatus">
                                                <option value="1">已完成</option>
                                                <option value="0">未完成</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">日期</label>
                                        <div class="col-sm-6">
                                            <input class="Wdate w200" type="text" name="createdTime" id="createdTime" onclick="WdatePicker()" readonly="readonly" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">检查项选择</label>
                                        <div class="col-sm-6">
                                            <select name="checkItemId" class="w200 form-control checkItemId">
                                                <option value="">---请选择---</option>
                                                <c:if test="${checkItems.size() > 0}">
                                                    <c:forEach var="checkItem" items="${checkItems}" >
                                                        <option value="${checkItem.id}">${checkItem.name}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group  checkResult">
                                        <label class="col-sm-3 control-label">结果</label>
                                        <div class="col-sm-6">
                                            <textarea name="checkItemResult" class="col-sm-12 h100 checkItemResult" ></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-4">
                                        <div class="btn-toolbar">
                                            <button class="btn-success btn J_submit btn-radius-no" type="button"><i class="fa fa-save"></i>&nbsp;确定</button>
                                            <button class="btn-default btn J_reset" type="reset"><i class="fa fa-undo"></i>&nbsp;重置</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<input class="hidId" type="hidden"></input>

<!-- 批量通知对话框 -->
<div class="modal fade" id="informDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">结果记录</h4>
            </div>
            <div class="modal-body">
                <form action="" class="form-horizontal J_editForm">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">状态</label>
                        <div class="col-sm-6">
                            <select id="editable-select1" class="form-control J_selectName w200" name="status">
                                <option value="1">未通知</option>
                                <option value="2">已通知</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注</label>
                        <div class="col-sm-6">
                            <textarea name="comment" class="form-control J_editRemInput" cols="30" rows="5"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success J_delAllDlg" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 选择为空对话框 -->
<div class="modal fade" id="delTipDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>请至少选择一个通知项!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 操作失败对话框 -->
<div class="modal fade" id="modalDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>操作失败，请重新操作!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>
<script src="/js/e-crb/activities-management/activities-management-ing/activities-management-ing-inform.js"></script>
</body>
</html>