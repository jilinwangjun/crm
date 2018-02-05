<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>模板添加</title>
    <link rel="stylesheet" type="text/css" href="/css/e-crb/template-management/template-management.css">
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
                            <a href="/admin/event/prepare/list">客户关怀</a>
                        </li>
                        <li class="active">模板管理</li>
                    </ol>
                </div>
                <div class="col-sm-12 margin-bottom-30 margin-top--10">
                    <form class="form-horizontal J_form" action="" method="" enctype="multipart/form-data">
                        <%--<div class="alert alert-success J_tip" role="alert">刷新成功!</div>--%>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>修改模板</h4>
                            </div>
                            <div class="panel-body">
                                <!-- 隐藏input存放模板id，编辑页有，添加页没有 -->
                                <input type="hidden" name="templateId" value="${templateId}">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><span class="requires">*</span>活动名称</label>
                                        <div class="col-sm-5">
                                            <input class="w180 J_name" type="text" value="${template.name}" name="name" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">活动级别</label>
                                        <div class="col-sm-5">
                                            <select name="level" class="w180 form-control">
                                                <option <c:if test='${template.level == 0}'>selected="selected"</c:if> value="0">---请选择---</option>
                                                <option <c:if test='${template.level == 1}'>selected="selected"</c:if> value="1">一级</option>
                                                <option <c:if test='${template.level == 2}'>selected="selected"</c:if> value="2">二级</option>
                                                <option <c:if test='${template.level == 3}'>selected="selected"</c:if> value="3">三级</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">活动时间</label>
                                        <div class="col-sm-5">
                                            <input id="start" name="startDate" readonly="readonly" class="Wdate w180 J_startDate" type="text" onclick="WdatePicker({minDate: '%y-%M-%d'})"
                                                   value="<fmt:formatDate value="${template.startDate}" type="date"></fmt:formatDate>"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">是否关联积分</label>
                                        <div class="col-sm-5">
                                            <select name="isPointsRelated" class="w180 form-control">
                                                <option <c:if test='${template.isPointsRelated == 0}'>selected="selected"</c:if> value="0">否</option>
                                                <option <c:if test='${template.isPointsRelated == 1}'>selected="selected"</c:if> value="1">是</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group J_hide">
                                        <label class="col-sm-5 control-label">循环粒度</label>
                                        <div class="col-sm-5">
                                            <select name="pollingTime" class="w180 form-control J_pollingTime">
                                                <option <c:if test='${template.pollingTime == null}'>selected="selected"</c:if> value="">---请选择---</option>
                                                <option <c:if test='${template.pollingTime == 1}'>selected="selected"</c:if> value="1">年</option>
                                                <option <c:if test='${template.pollingTime == 2}'>selected="selected"</c:if> value="2">月</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">活动类型</label>
                                        <div class="col-sm-5">
                                            <select name="type" class="w180 form-control J_type">
                                                <option <c:if test='${template.type == 0}'>selected="selected"</c:if> value="0">---请选择---</option>
                                                <option <c:if test='${template.type == 1}'>selected="selected"</c:if> value="2">会员关怀型</option>
                                                <option <c:if test='${template.type == 2}'>selected="selected"</c:if> value="1">营销型</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">提醒时间</label>
                                        <div class="col-sm-9">
                                            <label class="col-sm-3 control-label">活动前</label>
                                            <div class="col-sm-9">
                                                <input class="w30 J_date" type="text" name="remindTime" value="${template.remindTime}">&nbsp;日
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">到</label>
                                        <div class="col-sm-5">
                                            <input id="end" class="Wdate w180 J_endDate" type="text" name="endDate" readonly="readonly" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start\')}'})"
                                                   value="<fmt:formatDate value="${template.endDate}" type="date"></fmt:formatDate>"
                                            />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">是否关联检查项</label>
                                        <div class="col-sm-5">
                                            <select name="isCheckItemRelated" class="w180 form-control">
                                                <option <c:if test='${template.isCheckItemRelated == 0}'>selected="selected"</c:if> value="0">否</option>
                                                <option <c:if test='${template.isCheckItemRelated == 1}'>selected="selected"</c:if> value="1">是</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group J_hide">
                                        <label class="col-sm-3 control-label">活动人员</label>
                                        <div class="col-sm-5">
                                            <select name="memberGroupId" class="w180 form-control J_memberGroupId">
                                                <c:forEach var="list" items="${memberGroupList}">
                                                    <c:if test='${template.memberGroupId == null}'>
                                                        <option value="" selected ="selected" >---请选择---</option>
                                                    </c:if>
                                                    <c:if test='${template.memberGroupId != null}'>
                                                        <option  <c:if test='${template.memberGroupId == list.id}'>selected="selected"</c:if> value="${list.id}">${list.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-12">
                                    <h4>活动内容</h4>
                                    <hr>
                                    <textarea class="col-sm-12 h100 J_content"></textarea>
                                    <div class="J_files inline">
                                        <label class="margin-top-10">附件：</label>
                                        <c:if test="${eventAttachmentName.length() > 0}">
                                            ${eventAttachmentName}
                                        </c:if>
                                        <c:if test="${eventAttachmentName == ''}">无</c:if>
                                    </div>
                                    <label>
                                        <input class="btn margin-top-10 J_file" type="file" size="15"  maxlength="100" name="">
                                        <input type="text" hidden="hidden" class="attachment" value="" name="attachment">
                                    </label>
                                </div>
                                <div class="form-group col-sm-12">
                                    <h4>通知内容</h4>
                                    <hr>
                                    <textarea class="col-sm-12 h100 J_noticeContent">${template.noticeContent}</textarea>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-4">
                                        <div class="btn-toolbar">
                                            <button class="btn-success btn J_edit" type="button"><i class="fa fa-save"></i>&nbsp;保存为模板</button>
                                            <button class="btn-default btn J_reset" type="reset"><i class="fa fa-undo"></i>&nbsp;重置</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include flush="true" page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>
<!-- 活动名称重复对话框 -->
<div class="modal fade" id="modalDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>该活动名称已存在，请重新填写!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 操作失败对话框 -->
<div class="modal fade" id="errorDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
<!-- 文件格式错误对话框 -->
<div class="modal fade" id="fileDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>文件格式错误，请重新操作!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 文件大小错误对话框 -->
<div class="modal fade" id="fileSizeDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>上传文件大小不能超过500M，请重新操作!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<script src="/js/tool/calendar/WdatePicker.js"></script>
<script src="/js/e-crb/template-management/template-management-add.js"></script>
</body>
</html>