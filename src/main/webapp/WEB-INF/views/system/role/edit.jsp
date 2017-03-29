<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="editRoleModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">编辑用户</h4>
			</div>
			<div class="modal-body">
				<form id="editRoleForm" class="form-horizontal">
					<input type="hidden" name="roleid" id="roleid">
					<div class="form-group">
						<label class="col-sm-2 control-label">角色名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="rolename"
								id="rolename">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">描述</label>
						<div class="col-sm-10">
							<textarea rows="3" maxlength="255" class="form-control"
								name="description" id="description">
								</textarea>
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
		$("#editRoleForm")[0].reset();
		var roleid = $(this).attr("data-id");
		$.get("role.json", {
			"roleid" : roleid
		}).done(function(result) {
			$("#roleid").val(result.roleid);
			$("#rolename").val(result.rolename);
			$("#description").val(result.description);
			if (result.state == "1") {
				$("#ok")[0].checked = true;
			} else {
				$("#disable")[0].checked = true;
			}
		}).fail(function() {
			alert("修改异常");
		});

		$("#editRoleModal").modal("show");
	});

	$("#editBtn").click(function() {

		$.post("edit", $("#editRoleForm").serialize()).done(function(result) {
			if (result == "success") {
				$("#editRoleModal").modal("hide");
				roleTable.ajax.reload();
			}
		}).fail(function() {
			alert("修改用户异常");
		});

	});
</script>