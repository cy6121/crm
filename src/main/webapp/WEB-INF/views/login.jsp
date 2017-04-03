<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<%@ include file="include/top.jsp" %>
</head>
<body>
	<section class="dialog-login" style="margin-top: 10%">
		<div class="login-container">
			<div class="panel">
				<p class="panel-heading no-collapse">
					<i class="icon-leaf green"></i><span>&nbsp;CRM</span>
				</p>
				<div class="panel-body center">
					<form class="form-horizontal" id="loginForm">
						<div class="form-group has-success">
							<label class="col-sm-2 control-label no-padding-right"
								for="username">用户名</label>
							<div class="col-sm-10">
								<div class="clearfix input-icon">
									<input type="text" id="username" class="col-xs-10"> <i
										class="icon-user"></i> <span class="help-inline align-middle">
									</span>
								</div>
							</div>
						</div>
						<div class="form-group has-error">
							<label class="col-sm-2 control-label no-padding-right"
								for="password">密码</label>
							<div class="col-sm-10">
								<div class="clearfix input-icon">
									<input type="password" id="password" class="col-xs-10">
									<i class="icon-lock"></i> <span
										class="help-inline align-middle"> </span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-10">
								<button type="button" class="pull-left btn btn-primary"
									id="loginBtn" style="margin-left: 25%">
									<i class="icon-key"></i>登录
								</button>
								<button type="button" class="pull-right btn btn-primary"
									id="resetBtn">
									<i class="icon-reply"></i>重置
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>


	</section>
	
	<script type="text/javascript">
		//检查输入信息
		var check = function() {
			var flag = false;
			var username = $("#username").val();
			var password = $("#password").val();
			if (username == "") {
				$("#username").tips({
					side : 2,
					msg : '用户名输入有误',
					bg : '#AE81FF',
					time : 3
				});
				$("#username").focus();
				return flag;
			} else {
				$("#username").val($.trim(username));
			}
			if (password == "") {
				$("#password").tips({
					side : 2,
					msg : '密码输入有误',
					bg : '#AE81FF',
					time : 3
				});
				$("#password").focus();
				return flag;
			} else {
				$("#password").val($.trim(password));
			}
			return !flag;
		}

		var login = function() {
			var username = $("#username").val();
			var password = $("#password").val();
			$.ajax({
				type : "POST",
				url : '${ctx}/login',
				data : {
					username : username,
					password : password
				},
				dataType : 'json',
				cache : false,
				success : function(data) {
					if ("success" == data.result) {
						window.location.href = '${ctx}/index';
						return;
					} else if ("userError" == data.result) {
						$("#username").tips({
							side : 1,
							msg : '用户名或者密码错误',
							bg : '#FF5080',
							time : 5
						});
						$("#username").focus();
					} else if ("disable" == data.result) {
						$("#username").tips({
							side : 1,
							msg : '该用户已被禁用',
							bg : '#FF5080',
							time : 5
						});
						$("#username").focus();
					}
				}
			});
		}

		$(function() {
			$("#loginBtn").click(function() {
				if (check()) {
					login();
				}
			});
			$("#resetBtn").click(function() {
				$("#username").val('');
				$("#password").val('');
			});
		});
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#loginBtn").trigger("click");
			}
		});
	</script>
</body>
</html>