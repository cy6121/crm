<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<link rel="stylesheet"
	href="${ctxStatic}/assets/css/dataTables.bootstrap.min.css" />
	<script type="text/javascript">
		var userTable;
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i><a href="${ctx}/index">首页</a></li>
					<li class="active">用户管理</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<div class="col-sm-2">用户列表</div>
						<div class="col-sm-10">
							<button id="addNewUser" class="btn btn-success btn-xs pull-right">新增</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="userTable"
							class="table table-striped table-bordered table-hover dataTable">
							<thead>
								<tr>
									<th>ID</th>
									<th>用户名</th>
									<th>姓名</th>
									<th>电话</th>
									<th>邮箱</th>
									<th>角色</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>
	
	<%@ include file="user_add.jsp" %>
	<%@ include file="user_edit.jsp" %>

	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script src="${ctxStatic}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${ctxStatic}/assets/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			userTable = $("#userTable").DataTable({
				"processing":true,
				"serverSide":true, //服务端处理
				"scrollY":"400px",
				"searchDelay": 1500,//搜索延迟
	            "order":[[0,'asc']],//默认排序方式
	            "lengthMenu":[10,25,50,100],//每页显示数据条数菜单
	            "ajax":{
	                url:"${ctx}/system/user/users.json", //获取数据的URL
	                type:"get" //获取数据的方式
	            },
	            "columns":[  //返回的JSON中的对象和列的对应关系
	                {"data":"userid","name":"userid"},
	                {"data":"username","name":"username"},
	                {"data":"name","name":"name"},
	                {"data":"phone","name":"phone"},
	                {"data":"email","name":"email"},
	                {"data":function(row){
	                	var roleName="";
	                	for(var index = 0;index < row.roleList.length;index++){
	                		var role = row.roleList[index];
	                        roleName = roleName + role.rolename + "&nbsp&nbsp";
	                	}
	                	return roleName;
	                },"name":"rolename"},
	                {"data":function(row){
	                	if(row.state == "1"){
	                		return "<span class='label label-success'>正常</span>";
	                	}else{
	                		return "<span class='label label-danger'>禁用</span>";
	                	}
	                },"name":"state"},
	                {"data":function(row){
	                    return "<a href='javascript:;' style='text-decoration: none;' class='green' data-id='"+row.userid+"'><i class='icon-pencil bigger-110'></i></a> <a href='javascript:;' style='text-decoration: none;' class='red' data-id='"+row.userid+"'><i class='icon-trash bigger-110'></i></a>";
	                }}
	            ],
	            "columnDefs":[ //具体列的定义
	                {
	                    "targets":[0],
	                    "visible":false
	                },
	                {
	                    "targets":[5,6,7],
	                    "orderable":false
	                }
	            ],
	            "language":{
	                "lengthMenu":"每页显示 _MENU_ 条记录",
	                "search":"搜索(姓名或者电话):",
	                "info": "从  _START_ 到  _END_ 共  _TOTAL_ 条记录",
	                "processing":"加载中...",
	                "zeroRecords":"没有检索到数据",
	                "infoEmpty": "暂无数据",
	                "infoFiltered":"(从 _MAX_ 条数据中检索)",
	                "paginate": {
	                    "first":      "首页",
	                    "last":       "末页",
	                    "next":       "下一页",
	                    "previous":   "上一页"
	                }
	            }
			});
	        
	      	//删除用户
	        $(document).delegate(".red","click",function(){
	        	var userid = $(this).attr("data-id");
	        	Dialog.confirm('警告:您确定要删除该用户?',function(){
	        		$.post("${ctx}/system/user/del",{"userid":userid}).done(function(result){
	                    if("success" == result) {
	                        userTable.ajax.reload();
	                    }
	                }).fail(function(){
	                	Dialog.alert("删除出现异常");
	                });
	        	});
	        });
	      	
		});
	</script>
</body>