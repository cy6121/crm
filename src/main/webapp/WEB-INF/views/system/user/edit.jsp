<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="editModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">编辑库存</h4>
			</div>
			<div class="modal-body">
				<form id="editForm" class="form-horizontal">
					<input type="hidden" name="userid" id="userid">
					<div class="form-group">
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="username"
								id="username">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name" id="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">联系电话</label>
						<div class="col-sm-10">
							<input type="text" maxlength="11" class="form-control"
								name="phone" id="phone">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" name="email" id="email">
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
						<label class="col-sm-2 control-label">状态</label>
						<div class="col-sm-10">
							<div class="radio">
								<label> <input type="radio" class="radio" name="state"
									value="1" id="ok"><span class="lbl">正常</span>
								</label> <label> <input type="radio" class="radio" name="state"
									value="0" id="disable"><span class="lbl">禁用</span>
								</label>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="editBtn" class="btn btn-primary">保存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	//显示编辑用户
	$(document).delegate(".green", "click", function() {
		$("#editForm")[0].reset();
		var userid = $(this).attr("data-id");
		$.get("${ctx}/system/user/data.json", {
			"userid" : userid
		}).done(function(result) {
			$("#userid").val(result.userid);
			$("#username").val(result.username);
			$("#name").val(result.name);
			$("#phone").val(result.phone);
			$("#email").val(result.email);

			$("input[name='role']").each(function() {
				var roleList = result.roleList;
				for (var index = 0; index < roleList.length; index++) {
					var role = roleList[index];
					if ($(this).val() == role.roleid) {
						$(this)[0].checked = true;
					}
				}
			});
			if (result.state == "1") {
				$("#ok")[0].checked = true;
			} else {
				$("#disable")[0].checked = true;
			}
		}).fail(function() {

		});

		$("#editModal").modal("show");
	});

	$("#editBtn").click(function() {

		$.post("${ctx}/system/user/edit", $("#editForm").serialize()).done(function(result) {
			if (result == "success") {
				$("#editModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("修改异常!");
		});

	});
</script>