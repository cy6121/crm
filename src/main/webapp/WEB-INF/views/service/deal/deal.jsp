<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="dealModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">服务处理</h4>
			</div>
			<div class="modal-body">
				<form id="dealForm" class="form-horizontal">
					<input type="hidden" name="sale_id" id="sale_id">
					<div class="form-group">
						<label class="col-sm-3 control-label">编号</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="svr_id" id="svr_id" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">客户名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="cus_name" id="cus_name" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">概要</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="title" id="title" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">分配给</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="allot_name" id="allot_name" readonly="readonly"/>
							<input type="hidden" id="allot_id">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">服务请求</label>
						<div class="col-sm-9">
							<textarea rows="3" class="form-control" name="request" id="request" readonly="readonly"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">服务处理</label>
						<div class="col-sm-9">
							<textarea rows="3" class="form-control" name="deal" id="deal"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="dealBtn" class="btn btn-primary">保存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	function deal(svr_id){
		$("#dealForm")[0].reset();
		$.get("${ctx}/service/data.json", {
			"svr_id" : svr_id
		}).done(function(result) {
			$("#svr_id").val(result.svr_id);
			$("#cus_name").val(result.customer.name);
			$("#title").val(result.title);
			$("#allot_id").val(result.allot.userid);
			$("#allot_name").val(result.allot.name);
			$("#request").val(result.request);
		}).fail(function() {
			
		});
		
		$("#dealModal").modal("show");
	}
	
	$("#dealBtn").click(function() {
		
		if(${curr_user.userid}!=$("#allot_id").val()){
			Dialog.alert("你没有权限执行处理该请求");
			$("#dealModal").modal("hide");
			return;
		}
		
		var args = {"svr_id":$("#svr_id").val(),"deal":$("#deal").val()};
		
		$.post("${ctx}/service/deal/deal", args).done(function(result) {
			if (result == "success") {
				$("#dealModal").modal("hide");
				dataTable.ajax.reload();
			}
		}).fail(function() {
			Dialog.alert("修改异常!");
		});
	});
</script>