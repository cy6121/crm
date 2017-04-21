<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="editModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">编辑数据字典</h4>
			</div>
			<div class="modal-body">
				<form id="editForm" class="form-horizontal">
					<input type="hidden" name="prodId" id="prodId">
					<div class="form-group">
						<label class="col-sm-2 control-label">名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name" id="name">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">型号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="type" id="type"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">等级/批次</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="batch" id="batch"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">单位</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="unit" id="unit">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">单价</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="price" id="price"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
							<textarea rows="3" maxlength="255" class="form-control"
								name="memo" id="memo">
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
		var prodId = $(this).attr("data-id");
		$.get("${ctx}/dict/product/data.json", {
			"prodId" : prodId
		}).done(function(result) {
			$("#prodId").val(result.prodId);
			$("#name").val(result.name);
			$("#type").val(result.type);
			$("#batch").val(result.batch);
			$("#unit").val(result.unit);
			$("#price").val(result.price);
			$("#memo").val(result.memo);
		}).fail(function() {
			Dialog.alert("修改异常");
		});

		$("#editModal").modal("show");
	});

	$("#editBtn").click(function() {

		$.post("${ctx}/dict/product/edit", $("#editForm").serialize()).done(function(result) {
			if (result == "success") {
				$("#editModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("修改异常!");
		});

	});
</script>