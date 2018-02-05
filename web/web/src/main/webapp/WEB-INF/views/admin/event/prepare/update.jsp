<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>修改活动</title>
    <link rel="stylesheet" type="text/css" href="/css/e-crb/activities-management/activities-management-will/activities-management-will.css">
    <jsp:include flush="true" page="/WEB-INF/views/admin/common/head.jsp"></jsp:include>
    <script type="text/javascript">
        $(function(){
            $("#huodongleibie").hide();
            $("#huodongrenyuan").hide();
        });
    </script>


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
                        <li class="active">待开展活动修改</li>
                    </ol>
                </div>
                <div class="col-sm-12 margin-bottom-30 margin-top--10">
                    <form class="form-horizontal J_form" action="" method="">
                        <%--<div class="alert alert-success J_tip" role="alert">刷新成功!</div>--%>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>活动修改</h4>
                                <div class="col-sm-2 col-sm-offset-11">
                                    <div class="btn-toolbar">
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <!-- 隐藏input存放模板id -->
                                <input type="hidden" name="pollingTime" class="J_pollingTimeIpt" value="">
                                <input type="hidden" name="memberGroupId" class="J_memberGroupIdIpt" value="">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><span class="requires">*</span>活动名称</label>
                                        <div class="col-sm-6">
                                            <input class="w200 J_name" type="text" value="" name="name"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><span class="requires">*</span>活动时间从</label>
                                        <div class="col-sm-6">
                                            <input id="startDate" name="startDate" readonly="readonly" class="Wdate w200 J_startDate" type="text" onclick="WdatePicker()"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"><span class="requires">*</span>活动级别</label>
                                        <div class="col-sm-6">
                                            <select name="level" class="w200 form-control J_level">
                                                <option value="1">一级</option>
                                                <option value="2">二级</option>
                                                <option value="3">三级</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group J_polling">
                                        <label class="col-sm-5 control-label"><span class="requires">*</span>循环粒度</label>
                                        <div class="col-sm-6">
                                            <select name="pollingTime" class="w200 form-control J_pollingTime">
                                                <option value="1">年</option>
                                                <option value="2">月</option>
                                                <option value="3">无</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group" id="huodongleibie">
                                        <label class="col-sm-3 control-label"><span class="requires">*</span>活动类型</label>
                                        <div class="col-sm-6">
                                            <select name="type" class="w200 form-control J_activitiesType">
                                                <option value="1">会员关怀型</option>
                                                <option value="2">营销型</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"><span class="requires">*</span>提醒时间</label>
                                        <div class="col-sm-9">
                                            <label class="col-sm-3 control-label">活动前</label>
                                            <div class="col-sm-9">
                                                <input class="w45 J_date" type="text" name="remindTime" value="">&nbsp;日
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"><span class="requires">*</span>到</label>
                                        <div class="col-sm-6">
                                            <input id="end" class="Wdate w200 J_endDate" type="text" name="endDate" readonly="readonly" onfocus="WdatePicker()"/>
                                        </div>
                                    </div>
                                    <div class="form-group J_group" id="huodongrenyuan">
                                        <label class="col-sm-3 control-label"><span class="requires">*</span>活动人员</label>
                                        <div class="col-sm-6">
                                            <select name="memberGroupId" class="w200 form-control J_memberGroupId">
                                                <c:forEach var="list" items="${memberList}">
                                                    <option value="${list.id}">${list.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-4">
                                        <div class="btn-toolbar">
                                            <a href="#" class="btn-default btn J_checkItemBtn" data-toggle="modal" data-target="#checkDialog"><i class="fa fa-plus"></i>&nbsp;修改关联检查项</a>
                                            <a href="#" class="btn-default btn J_pointsItemBtn" data-toggle="modal" data-target="#pointsDialog"><i class="fa fa-plus"></i>&nbsp;修改关联积分</a>
                                        </div>
                                    </div>
                                </div>

                                <br/>

                                <c:if test="${event.approvalStatus == 3 }">
                                    <div class="form-group col-sm-12" id="cc">
                                        <h4>审批驳回</h4>
                                        <hr>
                                        <div id="shenpixinxi">
                                            <p>${event.approvalComment}</p>
                                        </div>
                                    </div>
                                </c:if>
                                    <div class="form-group col-sm-12" id="aa" <c:if test='${checkItemListForEvent==null || fn:length(checkItemListForEvent) <= 0}'>style="display:none;"</c:if>>
                                        <h4>检查项</h4>
                                        <hr>
                                        <div id="jianchaxiang">
                                            <c:forEach var="checkItem" items="${checkItemListForEvent}">
                                                <p>${checkItem.name}:${checkItem.content}</p>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-12" id="bb" <c:if test='${pointsItemListForEvent==null || fn:length(pointsItemListForEvent) <= 0}'>style="display:none;"</c:if>>
                                        <h4>积分项</h4>
                                        <hr>
                                        <div id="jifenxiang">
                                            <c:forEach var="pointsItem" items="${pointsItemListForEvent}">
                                                <p> ${pointsItem.name}:${pointsItem.pointsValue}</p>
                                            </c:forEach>
                                        </div>
                                    </div>

                                <div class="form-group col-sm-12">
                                    <h4>活动内容</h4>
                                    <hr>
                                    <textarea class="col-sm-12 h100 J_content" name=""></textarea>

                                    <div class="J_files inline">
                                        <label class="margin-top-10">附件：</label>
                                        <c:if test="${eventAttachmentName.length() > 0}">
                                           ${eventAttachmentName}
                                        </c:if>
                                        <c:if test="${eventAttachmentName == ''}">无</c:if>
                                    </div>

                                    <label>
                                        <input class="btn margin-top-10 J_file" type="file" size="15"  maxlength="100" name="attachment">
                                        <input type="text" hidden="hidden" class="attachment" value="" name="attachment">
                                    </label>

                                </div>
                                <div class="form-group col-sm-12">
                                    <h4>通知内容</h4>
                                    <hr>
                                    <textarea class="col-sm-12 h100 J_noticeContent"></textarea>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-4">
                                        <div class="btn-toolbar">
                                            <a href="#" class="btn-success btn J_submit" type="button"><i class="fa fa-save"></i>&nbsp;提交审核</a>
                                            <button class="btn btn-default J_cancel" type="reset"><i class="fa fa-undo"></i>&nbsp;重置</button>
                                            <a href="/admin/event/prepare/list" class="btn-default btn" type="button"><i class="fa fa-undo"></i>&nbsp;返回</a>
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
<!-- 关联检查项对话框 -->
<!-- 0 -->
<input type="hidden" class="J_zero" value="0">
<div class="modal fade" id="checkDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <span class="h4">检查项</span>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered J_addTable">
                        <thead>
                        <tr>
                            <th>全选&nbsp;&nbsp;<input name="selectAll" type="checkbox" class="J_selectAll"></th>
                            <th>名称</th>
                            <th>内容</th>
                        </tr>
                        </thead>
                        <tbody class="J_tbody" id="J_checkTbody">
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <div class="right">
                    <a href="#" class="btn btn-success J_add" data-toggle="modal" data-target="#addDialog"><i class="fa fa-plus"></i>&nbsp;添加</a>
                    <a href="#" class="btn btn-danger J_del"><i class="fa fa-times" ></i>&nbsp;删除</a>
                    <button type="button" class="btn btn-success " data-dismiss="modal" id="forjianchaxianshi">确定</button>
                    <%--<a href="#" class="btn btn-success J_yes"  data-dismiss="modal"><i class="fa fa-check"></i>&nbsp;确认</a>--%>
                    <a href="#" class="btn btn-default J_reset" data-dismiss="modal"><i class="fa fa-undo"></i>&nbsp;取消</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加检查项对话框 -->
<div class="modal fade" id="addDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加关联检查项</h4>
            </div>
            <div class="modal-body">
                <form action="" class="form-horizontal J_addForm">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">名称<span class="requires">&nbsp;*</span></label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control J_checkItemName" name="checkItemName" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">内容<span class="requires">&nbsp;*</span></label>
                        <div class="col-sm-6">
                            <select class="select J_checkItemContent col-sm-12" name="checkItemContent">
                                <option value="-1">----请选择----</option>
                                <c:forEach var="list" items="${checkItemList}">
                                    <option value="${list.id}">${list.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success J_addDlg">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 关联积分对话框 -->
<div class="modal fade" id="pointsDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <span class="h4">积分项</span>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered J_addPointsTable">
                        <thead>
                        <tr>
                            <th>全选&nbsp;&nbsp;<input name="selectAll" type="checkbox" class="J_selectAllPoints"></th>
                            <th>名称</th>
                            <th>内容</th>
                        </tr>
                        </thead>
                        <tbody class="J_tbodyPoints" id = "J_pointsTbody">
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <div class="right">
                    <a href="#" class="btn btn-success J_addPoints" data-toggle="modal" data-target="#addPointsDialog"><i class="fa fa-plus"></i>&nbsp;添加</a>
                    <a href="#" class="btn btn-danger J_delPoints"><i class="fa fa-times" ></i>&nbsp;删除</a>
                    <button type="button" class="btn btn-success " data-dismiss="modal" id="forjifenxianshi">确定</button>
                    <%--<a href="#" class="btn btn-success J_yesPoints" data-dismiss="modal"><i class="fa fa-check"></i>&nbsp;确认</a>--%>
                    <a href="#" class="btn btn-default J_resetPoints" data-dismiss="modal"><i class="fa fa-undo"></i>&nbsp;取消</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加积分项对话框 -->
<div class="modal fade" id="addPointsDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加关联积分项</h4>
            </div>
            <div class="modal-body">
                <form action="" class="form-horizontal J_addPointsForm">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">积分项<span class="requires">&nbsp;*</span></label>
                        <div class="col-sm-6">
                            <select class="select J_pointsItemName col-sm-12" name="checkItemName">
                                <option value="-1">----请选择----</option>
                                <c:forEach var="list" items="${pointsItemList}">
                                    <option value="${list.id}">${list.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">积分值<span class="requires">&nbsp;*</span></label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control J_pointsItemContent" name="checkItemContent">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success J_addPointsDlg">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除对话框 -->
<div class="modal fade" id="delDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index:10000;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>确定删除所选用药项吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-success J_delDlg">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除选择为空对话框 -->
<div class="modal fade" id="delTipDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>请至少选择一个删除项!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<%--<input type="hidden" id="roleName" name="roleName" value="${roleName}" />--%>
<input type="text" id="realMemberGroupId" name="realMemberGroupId" value="${realMemberGroupId}" />
<input type="text" id="realType" name="realType" value="${realType}" />

<script src="/js/tool/calendar/WdatePicker.js"></script>
<script src="/js/e-crb/activities-management/activities-management-will/activities-management-will-edit.js"></script>
</body>
</html>