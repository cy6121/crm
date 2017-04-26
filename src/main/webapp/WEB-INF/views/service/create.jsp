<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务管理</title>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content" style="margin-top: -2%">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i>服务管理</li>
					<li class="active">服务创建</li>
				</ul>
			</div>
			<div class="page-content">
				<div class="tab-content profile-edit-tab-content">
					<div id="edit-basic" class="tab-pane in active">
					<h4 class="header blue bolder smaller">服务创建</h4>
						<form class="form-horizontal" id="newForm">
							<div class="row">
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">客户名称</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="name" class="col-xs-10" >
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">服务类型</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<select name="type" class="col-xs-10">
													<option value="">请选择</option>
													<c:if test="${not empty serviceTypes}">
														<c:forEach items="${serviceTypes}" var="type">
															<option value="${type.item}">${type.item}</option>
														</c:forEach>
													</c:if>
												</select>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">概要</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="title" class="col-xs-10">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">创建人</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="create_name" class="col-xs-10" value="${curr_user.name}" readonly="readonly">
												<input type="hidden" name="create_id" value="${curr_user.userid}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">服务请求</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<textarea rows="3" class="form-control" name="request"></textarea>
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
		<div class="clearfix form-actions">
			<button class="btn btn-info" type="button" onclick="save()"
				style="margin-left: 44%">
				<i id="changeIcon" class="icon-ok bigger-110"></i> 保存
			</button>
		</div>

	</div>
	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script type="text/javascript">
		function save() {
			
			$.post("${ctx}/service/create",$("#newForm").serialize()).done(function(result){
				if (result=="success") {
					$("#newForm")[0].reset();
					Dialog.alert("新建成功!");
				}else if (result=="NotFound") {
					Dialog.alert("客户不存在!");
				}
			}).fail(function(){
				Dialog.alert("操作异常!");
			});
		}
		
	</script>
</body>