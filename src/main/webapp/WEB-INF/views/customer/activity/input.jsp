<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="newModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">交往记录管理</h4>
			</div>
			<div class="modal-body">
				<form id="newForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="atv_date" id="atv_date">
							<input type="hidden" class="form-control" name="cust_id" value="${cust_id}">
							<input type="hidden" class="form-control" name="atv_id" id="atv_id">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">地点</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="place" id="place"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">概要</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="title" id="title"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">详细信息</label>
						<div class="col-sm-10">
							<textarea rows="3" class="form-control"
								name="description" id="description">
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
<script src="${ctxStatic}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${ctxStatic}/assets/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	var type;

	$("#newBtn").click(function() {
		$("#newForm")[0].reset();
		$("#newModal").modal('show');
		type="add";
	});

	function edit(atv_id){
		$("#newForm")[0].reset();
		$.get("${ctx}/customer/activity/data.json", {
			"atv_id" : atv_id
		}).done(function(result) {
			$("#atv_id").val(result.atv_id);
			$("#atv_date").val(result.atv_date);
			$("#place").val(result.place);
			$("#title").val(result.title);
			$("#description").val(result.description);
		}).fail(function() {
			
		});
		$("#newModal").modal('show');
		type="edit";
	}
	
	$("#saveBtn").click(function(){
		$.post("${ctx}/customer/activity/"+type, $("#newForm").serialize()).done(function(result) {
			if ("success" == result) {
				$("#newModal").modal("hide");
				window.location.reload();
			}
		}).fail(function() {
			Dialog.alert("操作异常");
		});
	}); 
	
	$("#atv_date").datetimepicker({
		language      : "zh-CN",
		weekStart     : 1,
		autoclose     : 1,
		todayHighlight: true,
		format        : "yyyy-mm-dd",
		minView       : 2,
		forceParse    : 0
	});
	
	$("#atv_date").click(function () {
		$("#atv_date").datetimepicker("show");
	});
	
</script>
