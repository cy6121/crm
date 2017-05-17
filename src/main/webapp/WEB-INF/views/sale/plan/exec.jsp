<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户开发计划</title>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content" style="margin-top: -2%">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i>客户开发计划</li>
					<li class="active">执行计划</li>
				</ul>
			</div>
			<div class="page-content">
				<div class="tab-content profile-edit-tab-content">
					<div id="edit-basic" class="tab-pane in active">
						<form class="form-horizontal" action="" method="post">
							<h4 class="header blue bolder smaller">销售机会信息</h4>
							<div class="row">
								
								<div class="profile-user-info profile-user-info-striped">

									<div class="profile-info-row">
										<div class="profile-info-name">编号</div>
										<div class="profile-info-value">
											<span name="sale_id">${saleChance.sale_id}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">机会来源</div>
										<div class="profile-info-value">
											<span name="source">${saleChance.source}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">客户名称</div>
										<div class="profile-info-value">
											<span name="cus_name">${saleChance.cus_name}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">摘要</div>
										<div class="profile-info-value">
											<span name="title">${saleChance.title}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">成功概率(%)</div>
										<div class="profile-info-value">
											<span name="rate">${saleChance.rate}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">联系人</div>
										<div class="profile-info-value">
											<span name="contact">${saleChance.contact}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">联系人电话</div>
										<div class="profile-info-value">
											<span name="tel">${saleChance.tel}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">机会描述</div>
										<div class="profile-info-value">
											<span name="description"> ${saleChance.description}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">创建人</div>
										<div class="profile-info-value">
											<span name="create_name">${saleChance.create.name}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">创建时间</div>
										<div class="profile-info-value">
											<span name="create_date">${saleChance.create_date}</span>
										</div>
									</div>

									<div class="profile-info-row">
										<div class="profile-info-name">指派给</div>
										<div class="profile-info-value">
											<span name="allot_name">${saleChance.allot.name}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">指派时间</div>
										<div class="profile-info-value">
											<span name="allot_date">${saleChance.allot_date}</span>
										</div>
									</div>
									
								</div>
								
							</div>
							
							<c:if test="${not empty planList}">
								<h4 class="header blue bolder smaller">执行计划项</h4>
								<div class="row">
								<c:forEach items="${planList}" var="plan">
									<div class="col-md-4 col-sm-12 col-xs-12 no-padding-left">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="newPassword">计划时间</label>
											<div class="col-sm-9">
												<div class="clearfix input-icon">
													<input type="text" value="${plan.plan_date}" readonly="readonly"
														class="col-xs-10"> 
													<i class="icon-calendar"></i>
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-md-4 col-sm-12 col-xs-12 no-padding-left">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="confirmPassword">计划内容</label>
											<div class="col-sm-9">
												<div class="clearfix">
													<input type="text" value="${plan.plan_todo}" readonly="readonly" class="col-xs-10">
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-md-4 col-sm-12 col-xs-12 no-padding-left">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="confirmPassword">执行结果</label>
											<div class="col-sm-9">
												<div class="clearfix">
													<input type="text" id="plan_result-${plan.plan_id}" value="${plan.plan_result}" class="col-xs-10">
													<div class="pull-right action-buttons">
														<a href='javascript:;' style="text-decoration: none;" class="green" onclick="editPlan(${plan.plan_id})"><i class="icon-ok bigger-110"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								
								</c:forEach>
								</div>
							</c:if>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix form-actions">
			<button class="btn btn-info" type="button" id="finishBtn"
				style="margin-left: 40%">
				<i id="changeIcon" class="icon-ok bigger-110"></i> 开发成功
			</button>
			<button class="btn" type=reset id="stopBtn"
				style="margin-left: 2%">
				<i id="changeIcon" class="icon-bolt bigger-110"></i> 终止开发
			</button>
		</div>
	</div>
	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script type="text/javascript">
	
	function editPlan(plan_id){
		if (${saleChance.allot.userid}!=${curr_user.userid}) {
			Dialog.alert("你没有权限执行该请求");
			return;
		}
		
		var url = "${ctx}/sale/plan/edit";
		var agrs = {"plan_id":plan_id,"plan_result":$("#plan_result-"+plan_id).val(),"type":"exec"};
		$.post(url,agrs).done(function(result){
			if (result=="success") {
				Dialog.alert("修改成功!");
			}else {
				Dialog.alert("修改失败!");
			}
		}).fail(function(){
			Dialog.alert("修改异常!");
		});  
	}
	
	$(function(){
		$("#finishBtn").click(function() {
			if (${saleChance.allot.userid}!=${curr_user.userid}) {
				Dialog.alert("你没有权限执行该请求");
				return;
			}
			
			var url = "${ctx}/sale/chance/finish";
			var args = {"sale_id" : "${saleChance.sale_id}","cus_name":"${saleChance.cus_name}",
						"contact":"${saleChance.contact}","tel":"${saleChance.tel}",
						"allot_id": "${saleChance.allot.userid}","state":"3"};
			
			$.post(url, args).done(function(result) {
				if ("success" == result) {
					window.location.href="${ctx}/sale/chance/${saleChance.sale_id}";
				}
			}).fail(function() {
				Dialog.alert("修改异常");
			});
		});
		
		$("#stopBtn").click(function() {
			if (${saleChance.allot.userid}!=${curr_user.userid}) {
				Dialog.alert("你没有权限执行该请求");
				return;
			}
			
			$.post("${ctx}/sale/chance/stop", {
				"sale_id" : ${saleChance.sale_id}
			}).done(function(result) {
				if ("success" == result) {
					window.location.href="${ctx}/sale/chance/detail?sale_id=${saleChance.sale_id}";
				}
			}).fail(function() {
				Dialog.alert("修改异常");
			});
		});
	});
	
	</script>
</body>