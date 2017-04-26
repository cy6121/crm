<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户归档</title>
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
					<li class="active">客户归档</li>
				</ul>
			</div>
			<div class="page-content">
				<div class="tab-content profile-edit-tab-content">
					<div id="edit-basic" class="tab-pane in active">
						<form class="form-horizontal" action="" method="post">
							<h4 class="header blue bolder smaller">服务信息</h4>
							<div class="row">
								
								<div class="profile-user-info profile-user-info-striped">

									<div class="profile-info-row">
										<div class="profile-info-name">编号</div>
										<div class="profile-info-value">
											<span name="sale_id">${cstService.svr_id}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">客户名称</div>
										<div class="profile-info-value">
											<span name="cus_name">${cstService.customer.name}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">服务类型</div>
										<div class="profile-info-value">
											<span name="type">${cstService.type}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">服务概要</div>
										<div class="profile-info-value">
											<span name="title">${cstService.title}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">服务状态</div>
										<div class="profile-info-value">
											<span name="state">已归档</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">服务请求</div>
										<div class="profile-info-value">
											<span name="request">${cstService.request}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">创建人</div>
										<div class="profile-info-value">
											<span name="create_name">${cstService.create.name}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">创建时间</div>
										<div class="profile-info-value">
											<span name="create_date">${cstService.create_date}</span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">分配给</div>
										<div class="profile-info-value">
											<span name="allot_name">${cstService.allot.name}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">分配时间</div>
										<div class="profile-info-value">
											<span name="allot_date">${cstService.allot_date}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">服务处理</div>
										<div class="profile-info-value">
											<span name="allot_date">${cstService.deal}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">处理时间</div>
										<div class="profile-info-value">
											<span name="allot_date">${cstService.deal_date}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">处理结果</div>
										<div class="profile-info-value">
											<span name="allot_date">${cstService.result}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">服务满意度</div>
										<div class="profile-info-value">
											<span name="allot_date">${cstService.satisfy}</span>
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
	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
</body>