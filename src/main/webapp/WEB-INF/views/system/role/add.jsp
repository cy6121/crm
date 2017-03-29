<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="newRoleModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加角色</h4>
			</div>
			<div class="modal-body">
				<form id="newRoleForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">角色名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="rolename">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">描述</label>
						<div class="col-sm-10">
							<textarea rows="3" maxlength="255" class="form-control"
								name="description">
								</textarea>
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
	$("#addNewRole").click(function() {
		$("#newRoleForm")[0].reset();
		$("#newRoleModal").modal('show');
	});
	$("#saveBtn").click(function() {
		$.post("addRole", $("#newRoleForm").serialize()).done(function(result) {
			if ("success" == result) {
				$("#newRoleModal").modal("hide");
				roleTable.ajax.reload();
			}
		}).fail(function() {
			alert("添加时出现异常");
		});
	});
</script>