<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="newUserModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加用户</h4>
			</div>
			<div class="modal-body">
				<form id="newUserForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="username">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">联系电话</label>
						<div class="col-sm-10">
							<input type="text" maxlength="11" class="form-control"
								name="phone">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password"
								value="123456"> <span class="help-block">默认密码为：123456</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" name="email">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">角色</label>
						<div class="col-sm-10">
							<div class="checkbox">
								<c:forEach var="role" items="${roleList}">
									<label> <input type="checkbox" class="checkbox"
										name="role" value="${role.roleid}"><span class="lbl">${role.rolename}</span></label>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">性别</label>
						<div class="col-sm-10">
							<div class="radio">
								<label> <input type="radio" class="radio" name="sex"
									value="男" checked><span class="lbl">男</span>
								</label> <label> <input type="radio" class="radio" name="sex"
									value="女"><span class="lbl">女</span>
								</label>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="saveBtn" class="btn btn-primary">保存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	//添加新用户
	$("#addNewUser").click(function() {
		$("#newUserForm")[0].reset();
		$("#newUserModal").modal('show');
	});
	$("#saveBtn").click(function() {
		$.post("addUser", $("#newUserForm").serialize()).done(function(result) {
			if ("success" == result) {
				$("#newUserModal").modal("hide");
				userTable.ajax.reload();
			}
		}).fail(function() {
			alert("添加时出现异常");
		});

	});
</script>