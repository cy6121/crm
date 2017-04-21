<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="dispatchModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">指派销售机会</h4>
			</div>
			<div class="modal-body">
				<form id="dispatchForm" class="form-horizontal">
					<input type="hidden" name="sale_id" id="Sale_id">
					<div class="form-group">
						<label class="col-sm-3 control-label">机会来源</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="source" id="Source" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">客户名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="cus_name" id="Cus_name" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">成功机率(%)</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="rate" id="Rate" placeholder="填入数字，0~100" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">概要</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="title" id="Title" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系人</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="contact" id="Contact" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">联系人电话</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="tel" id="Tel" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">创建人</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="create_name" id="Create_name" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">创建时间</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="create_date" id="Create_date" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">机会描述</label>
						<div class="col-sm-9">
							<textarea rows="3" class="form-control" name="description" id="Description" readonly="readonly"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">指派给</label>
						<div class="col-sm-9">
							<select class="form-control" name="allot_id" id="allot_id">
								<option value="">请选择</option>
								<c:if test="${not empty userList}">
									<c:forEach items="${userList}" var="user">
										<option value="${user.userid}">${user.name}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">指派时间</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="allot_date" id="allot_date" readonly="readonly">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="dispatchBtn" class="btn btn-primary">保存</button>
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
	$(document).delegate(".blue", "click", function() {
		$("#dispatchForm")[0].reset();
		
		$("#allot_date").val(new Date().toLocaleDateString());
		var sale_id = $(this).attr("data-id");
		
		$.get("${ctx}/sale/chance/data.json", {
			"sale_id" : sale_id
		}).done(function(result) {
			$("#Sale_id").val(result.sale_id);
			$("#Source").val(result.source);
			$("#Cus_name").val(result.cus_name);
			$("#Rate").val(result.rate);
			$("#Title").val(result.title);
			$("#Contact").val(result.contact);
			$("#Tel").val(result.tel);
			$("#Create_name").val(result.create.name);
			$("#Create_date").val(result.create_date);
			state=result.state;
		}).fail(function() {
			Dialog.alert("网络异常");
		});
		
		$("#dispatchModal").modal("show");
	});

	$("#dispatchBtn").click(function() {
		if ($("#allot_id").val()=="") {
			Dialog.alert("请选择指派给谁?");
			return;
		} 
		if(state=="1"){
			var args = {"allot_id":$("#allot_id").val(),"sale_id":$("#Sale_id").val(),"allot_date":$("#allot_date").val()}
			$.post("${ctx}/sale/chance/dispatch", args).done(function(result) {
				if (result == "success") {
					$("#dispatchModal").modal("hide");
					dataTable.ajax.reload();
				}
			}).fail(function() {
				Dialog.alert("指派异常!");
			});
		}else{
			Dialog.alert("只能指派未分配的销售机会!");
		}

	});
</script>