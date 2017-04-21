<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="newModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">新建销售机会</h4>
			</div>
			<div class="modal-body">
				<form id="newForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">机会来源</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="source"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">客户名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="cus_name" required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">成功机率(%)</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="rate" placeholder="填入数字，0~100"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">概要</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="title">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系人</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="contact">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系人电话</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="tel">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">创建人</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="create_name" value="${curr_user.name}" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">创建时间</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="create_date" id="create_date" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">机会描述</label>
						<div class="col-sm-9">
							<textarea rows="3" class="form-control"
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
	</div>
</div>

<script type="text/javascript">
	$("#newBtn").click(function() {
		$("#newForm")[0].reset();
		$("#create_date").val(new Date().toLocaleDateString());
		$("#newModal").modal('show');
	});

	$("#saveBtn").click(function(){
		$.post("${ctx}/sale/chance/add", $("#newForm").serialize()).done(function(result) {
			if ("success" == result) {
				$("#newModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("添加时出现异常");
		});
	});
</script>
