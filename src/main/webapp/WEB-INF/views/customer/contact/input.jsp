<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="newModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">联系人管理</h4>
			</div>
			<div class="modal-body">
				<form id="newForm" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name" id="name">
							<input type="hidden" class="form-control" name="cust_id" value="${cust_id}">
							<input type="hidden" class="form-control" id="contact_id" name="contact_id">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">职位</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="postion" name="postion"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">办公电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="tel" name="tel"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">手机</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="mobile" name="mobile"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">性别</label>
						<div class="col-sm-10">
							<div class="radio">
								<label> <input type="radio" class="radio" name="sex"
									value="男" id="man"><span class="lbl">男</span>
								</label> <label> <input type="radio" class="radio" name="sex"
									value="女" id="woman"><span class="lbl">女</span>
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
							<textarea rows="3" maxlength="255" class="form-control"
								id="memo" name="memo">
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
	var type;

	$("#newBtn").click(function() {
		$("#newForm")[0].reset();
		$("#newModal").modal('show');
		type="add";
	});

	$("#saveBtn").click(function(){
		$.post("${ctx}/customer/contact/"+type, $("#newForm").serialize()).done(function(result) {
			if ("success" == result) {
				$("#newModal").modal("hide");
				window.location.reload();
			}
		}).fail(function() {
			Dialog.alert("操作异常");
		});
	}); 
	
	function edit(contact_id){
		$("#newForm")[0].reset();
		$.get("${ctx}/customer/contact/data.json", {
			"contact_id" : contact_id
		}).done(function(result) {
			$("#contact_id").val(result.contact_id);
			$("#source").val(result.source);
			$("#name").val(result.name);
			$("#postion").val(result.postion);
			$("#tel").val(result.tel);
			$("#mobile").val(result.mobile);
			$("#memo").val(result.memo);
			if(result.sex=="男"){
				$("#man")[0].checked = true;
			}else if(result.sex=="女"){
				$("#woman")[0].checked = true;
			}
		}).fail(function() {
			
		});
		$("#newModal").modal('show');
		type = "edit";
	}

</script>
