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
					<input type="hidden" name="dictId" id="dictId">
					<div class="form-group">
						<label class="col-sm-2 control-label">类型</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="type"
								id="type">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">条目</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="item"
								id="item">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">值</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="value"
								id="value">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">是否可更改</label>
						<div class="col-sm-10">
							<div class="radio">
								<label> <input type="radio" class="radio" name="editable"
									value="1" id="ok"><span class="lbl">是</span>
								</label> <label> <input type="radio" class="radio" name="editable"
									value="0" id="disable"><span class="lbl">否</span>
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
		var dictId = $(this).attr("data-id");
		$.get("${ctx}/dict/data/data.json", {
			"dictId" : dictId
		}).done(function(result) {
			$("#dictId").val(result.dictId);
			$("#type").val(result.type);
			$("#item").val(result.item);
			$("#value").val(result.value);
			if (result.editable == "1") {
				$("#ok")[0].checked = true;
			} else {
				$("#disable")[0].checked = true;
			}
		}).fail(function() {
			Dialog.alert("修改异常");
		});

		$("#editModal").modal("show");
	});

	$("#editBtn").click(function() {

		$.post("${ctx}/dict/data/edit", $("#editForm").serialize()).done(function(result) {
			if (result == "success") {
				$("#editModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("修改异常!");
		});

	});
</script>