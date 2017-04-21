<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="editModal">
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
				<form id="editForm" class="form-horizontal">
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
		var roleid = $(this).attr("data-id");
		$.get("${ctx}/system/role/data.json", {
			"roleid" : roleid
		}).done(function(result) {
			$("#roleid").val(result.roleid);
			$("#rolename").val(result.rolename);
			$("#description").val(result.description);
		}).fail(function() {
			Dialog.alert("修改异常");
		});

		$("#editModal").modal("show");
	});

	$("#editBtn").click(function() {

		$.post("${ctx}/system/role/edit", $("#editForm").serialize()).done(function(result) {
			if (result == "success") {
				$("#editModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("修改异常!");
		});

	});
</script>