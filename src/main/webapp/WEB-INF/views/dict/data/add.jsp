<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="newModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加数据字典</h4>
			</div>
			<div class="modal-body">
				<form id="newForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">类别</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="type">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">条目</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="item" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">值</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="value" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="saveBtn" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#newBtn").click(function() {
		$("#newForm")[0].reset();
		$("#newModal").modal('show');
	});

	$("#saveBtn").click(function(){
		$.post("${ctx}/dict/data/add", $("#newForm").serialize()).done(function(result) {
			if ("success" == result) {
				$("#newModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("添加时出现异常");
		});
	});
</script>
