<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="editModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">编辑销售机会</h4>
			</div>
			<div class="modal-body">
				<form id="editForm" class="form-horizontal">
					<input type="hidden" name="sale_id" id="sale_id">
					<div class="form-group">
						<label class="col-sm-3 control-label">机会来源</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="source" id="source"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">客户名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="cus_name" id="cus_name"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">成功机率(%)</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="rate" id="rate" placeholder="填入数字，0~100"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">概要</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="title" id="title">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系人</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="contact" id="contact">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系人电话</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="tel" id="tel">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">创建人</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="create_name" id="create_name" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">创建时间</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="create_date" id="createDate" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">机会描述</label>
						<div class="col-sm-9">
							<textarea rows="3" class="form-control" name="description" id="description"></textarea>
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
	var state;//开发状态(1为未分配)
	//显示编辑用户
	$(document).delegate(".green", "click", function() {
		$("#editForm")[0].reset();
		var sale_id = $(this).attr("data-id");
		
		$.get("${ctx}/sale/chance/data.json", {
			"sale_id" : sale_id
		}).done(function(result) {
			$("#sale_id").val(result.sale_id);
			$("#source").val(result.source);
			$("#cus_name").val(result.cus_name);
			$("#rate").val(result.rate);
			$("#title").val(result.title);
			$("#contact").val(result.contact);
			$("#tel").val(result.tel);
			$("#create_name").val(result.create.name);
			$("#createDate").val(result.create_date);
			$("#description").val(result.description);
			state=result.state;
		}).fail(function() {
			Dialog.alert("修改异常");
		});
		
		$("#editModal").modal("show");
	});

	$("#editBtn").click(function() {
		
		if(state=="1"){
			$.post("${ctx}/sale/chance/edit", $("#editForm").serialize()).done(function(result) {
				if (result == "success") {
					$("#editModal").modal("hide");
					dataTable.ajax.reload();
				}
			}).fail(function() {
				Dialog.alert("修改异常!");
			});
		}else{
			Dialog.alert("只能修改未分配的销售机会!");
		}

	});
</script>