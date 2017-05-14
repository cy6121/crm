<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="confirmModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">确认流失</h4>
			</div>
			<div class="modal-body">
				<form id="confirmForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">编号</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="drain_id" id="Drain_id" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">客户名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="cus_name" id="Cus_name" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">客户经理</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="manager_name" id="Manager_name" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">最后一次下单时间</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="last_order_date" id="Last_order_date" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">暂缓措施</label>
						<div class="col-sm-9">
							<textarea rows="3" class="form-control" name="delay" id="Delay" readonly="readonly"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">流失原因</label>
						<div class="col-sm-9">
							<textarea rows="3" class="form-control" name="reason" id="reason"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="confirmBtn" class="btn btn-primary">保存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	function confirm(drain_id,manager_id){
		
		$("#confirmForm")[0].reset();
		$.get("${ctx}/customer/drain/data.json", {
			"drain_id" : drain_id
		}).done(function(result) {
			$("#Drain_id").val(result.drain_id);
			$("#Cus_name").val(result.customer.name);
			$("#Manager_name").val(result.customer.manager.name);
			$("#Last_order_date").val(result.last_order_date);
			$("#Delay").val(result.delay);
		}).fail(function() {
			
		});
		
		$("#confirmModal").modal("show");
	}
	
	$("#confirmBtn").click(function() {
		var args = {"drain_id":$("#Drain_id").val(),"reason":$("#reason").val(),"state":"2"};
		
		$.post("${ctx}/customer/drain/edit", args).done(function(result) {
			if (result == "success") {
				$("#confirmModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("修改异常!");
		});
	});
</script>