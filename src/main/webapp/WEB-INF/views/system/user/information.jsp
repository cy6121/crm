<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>资料修改</title>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content" style="margin-top: -2%">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i><a href="${ctx}/index">首页</a></li>
					<li class="active">个人信息</li>
				</ul>
			</div>
			<div class="page-content">
				<div class="tab-content profile-edit-tab-content">
					<div id="edit-basic" class="tab-pane in active">
						<form class="form-horizontal" id="LoginForm" action=""
							method="post">
							<h4 class="header blue bolder smaller">基本信息</h4>
							<div class="row">
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="name">姓名</label>
										<div class="col-sm-9">
											<div class="clearfix input-icon">
												<input type="text" maxlength="20" id="name"
													class="col-xs-10" value="${curr_user.name}"> <i
													class="icon-user">
												<input type="hidden" id="userid" value="${curr_user.userid}"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="email">邮箱</label>
										<div class="col-sm-9">
											<div class="clearfix input-icon">
												<input type="text" maxlength="30" id="email"
													class="col-xs-10" value="${curr_user.email}"> <i
													class="icon-envelope"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="phone">电话</label>
										<div class="col-sm-9">
											<div class="clearfix input-icon">
												<input type="text" maxlength="11" id="phone"
													class="col-xs-10" value="${curr_user.phone}"> <i
													class="icon-phone"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group clearfix">
										<div class="control-group">
											<label class="col-sm-3 control-label no-padding-right">性别</label>
											<div class="radio">
												<label> <input name="sex" type="radio" class="radio"
													checked> <span class="lbl">${curr_user.sex}</span></label>
											</div>
										</div>
									</div>
								</div>

							</div>
							<h4 class="header blue bolder smaller">修改密码</h4>
							<div class="row">
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="newPassword">新密码</label>
										<div class="col-sm-9">
											<div class="clearfix input-icon">
												<input type="password" maxlength="16" id="newPassword"
													class="col-xs-10"> <i class="icon-lock"></i>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="confirmPassword">确认密码</label>
										<div class="col-sm-9">
											<div class="clearfix input-icon">
												<input type="password" maxlength="16" id="confirmPassword"
													class="col-xs-10"> <i class="icon-lock"></i>
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
			<button class="btn btn-info" type="button" id="changeBtn"
				style="margin-left: 44%">
				<i id="changeIcon" class="icon-ok bigger-110"></i> 修改
			</button>
		</div>

	</div>
	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script src="${ctxStatic}/assets/js/bootbox.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#changeBtn").click(function() {
				check();
			});
		});
		
		var clearPassword = function(){
			$("#newPassword").val('');
			$("#confirmPassword").val('');
		}
		
		var check = function(){
			var name = $.trim($("#name").val());
			var email = $.trim($("#email").val());
			var phone = $.trim($("#phone").val());
			var newPassword = $("#newPassword").val();
			var confirmPassword = $("#confirmPassword").val();
			var email_reg = /^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.){1,4}[a-z]{2,3}$/;
			var phone_reg = /(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
			if(name==""){
				$("#name").tips({
					side : 1,
					msg : '姓名不能为空！',
					bg : '#FF5080',
					time : 3
				});
				return;
			}
			if(!email_reg.test(email)){
				$("#email").tips({
					side : 1,
					msg : '邮箱有误！',
					bg : '#FF5080',
					time : 3
				});
				return;
			}
			if(!phone_reg.test(phone)){
				$("#phone").tips({
					side : 1,
					msg : '电话有误！',
					bg : '#FF5080',
					time : 3
				});
				return;
			}
			if(newPassword!=confirmPassword){
				$("#confirmPassword").tips({
					side : 1,
					msg : '密码不一致！',
					bg : '#FF5080',
					time : 3
				});
				$("#confirmPassword").focus();
				return;
			}
			bootbox.dialog({
				message: "<span class='bigger-110'><strong>确认修改？</strong></span>",
				buttons: 			
				{
					"ok" :
					{
						"label" : "确定",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							var userid = $("#userid").val();
							$("#changeIcon").removeClass("icon-ok");
							$("#changeIcon").addClass("icon-spinner icon-spin");
							$.ajax({
								type : "POST",
								url : "edit",
								dataType : 'json',
								data : {
									userid : userid,
									name : name,
									email : email,
									phone : phone,
									password : newPassword,
									confirmPassword : confirmPassword
								},
								cache : false,
								success : function(data){
									clearPassword();
									$("#changeIcon").removeClass("icon-spinner icon-spin");
									$("#changeIcon").addClass("icon-ok");
									if(data.result=="success"){
										$("#changeBtn").tips({
											side : 1,
											msg : '修改成功!',
											bg : '#87b87f',
											timeout : 2
										});
									}else{
										$("#changeBtn").tips({
											side : 1,
											msg : '修改异常!',
											bg : '#AE81FF',
											timeout : 2
										});
									}
								}
							});
						}
					},
					"cancel" :
					 {
						"label" : "取消",
						"className" : "btn-sm btn-success",
						"callback": function() {
							clearPassword();
						}
					}
				}
			});
		}
	</script>
</body>