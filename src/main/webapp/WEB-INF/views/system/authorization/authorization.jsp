<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<div class="modal fade" id="RoleMenuModal">
	<div class="modal-dialog">
		<div class="modal-content" style="width:300px;left: 22%;top: 100px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">菜单权限</h4>
			</div>
			<div class="modal-body">
				<div id="RoleMenu">
					<ul id="menuTree" class="tree" style="overflow:auto;"></ul>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" id="MenuBtn" class="btn btn-primary">保存</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	var zMenuTree;
	var zroleId;
	var zType;
	var setting = {
		isSimpleData:true,//数据是否采用简单Array格式，默认false
		treeNodeKey: "id",
		treeNodeParentKey: "pId",
		showLine:true,
		checkable:true
	};

	function menuAssignment(roleid,type){
		zroleId = roleid;
		if (type === 1) {
			zType = "menu";
		}
		var url = "${ctx}/system/role/auth?type="+zType;
		var postData = {"roleid":zroleId,"type":zType};
		$.get(url,postData).done(function(data){
			var zTreeNodes = data.menuList;
			zMenuTree = $("#menuTree").zTree(setting,zTreeNodes);
		});
		
		$("#RoleMenuModal").modal("show");
		
	};
	
	$("#MenuBtn").click(function() {
		var url = "${ctx}/system/role/auth";
		var nodes = zMenuTree.getCheckedNodes();
		var tempNode;
		var ids = "";
		for (var index = 0; index < nodes.length; index++) {
			tempNode = nodes[index];
			if (index!=nodes.length-1) {
				ids += tempNode.id+",";
			}else{
				ids += tempNode.id;
			}
		}
		var postData = {"roleid":zroleId,"ids":ids,"type":zType};
		$.post(url, postData).done(function(result) {
			if (result == "success") {
				$("#RoleMenuModal").modal("hide");
			}
		}).fail(function() {
			Dialog.alert("修改异常!");
		});

	});
</script>