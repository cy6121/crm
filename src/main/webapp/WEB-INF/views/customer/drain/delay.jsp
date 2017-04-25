<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="delayModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">暂缓流失</h4>
			</div>
			<div class="modal-body">
				<form id="delayForm" class="form-horizontal">
					<input type="hidden" name="sale_id" id="sale_id">
					<div class="form-group">
						<label class="col-sm-3 control-label">编号</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="drain_id" id="drain_id" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">客户名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="cus_name" id="cus_name" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">客户经理</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="manager_name" id="manager_name" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">最后一次下单时间</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="last_order_date" id="last_order_date" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">暂缓措施</label>
						<div class="col-sm-9">
							<textarea rows="3" class="form-control" name="delay" id="delay"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="delayBtn" class="btn btn-primary">保存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	function delay(drain_id){
		$("#delayForm")[0].reset();
		$.get("${ctx}/customer/drain/data.json", {
			"drain_id" : drain_id
		}).done(function(result) {
			$("#drain_id").val(result.drain_id);
			$("#cus_name").val(result.customer.name);
			$("#manager_name").val(result.customer.manager.name);
			$("#last_order_date").val(result.last_order_date);
		}).fail(function() {
			
		});
		
		$("#delayModal").modal("show");
	}
	
	$("#delayBtn").click(function() {
		var args = {"drain_id":$("#drain_id").val(),"delay":$("#delay").val(),"state":"1"};
		
		$.post("${ctx}/customer/drain/edit", args).done(function(result) {
			if (result == "success") {
				$("#delayModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("修改异常!");
		});
	});
</script>