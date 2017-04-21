<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<link rel="stylesheet"
	href="${ctxStatic}/assets/css/dataTables.bootstrap.min.css" />
	<script type="text/javascript">
		var dataTable;
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i>系统管理</li>
					<li class="active">角色管理</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<div class="col-sm-2">角色列表</div>
						<div class="col-sm-10">
							<button id="newBtn" class="btn btn-success btn-xs pull-right">新增</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="dataTable"
							class="table table-striped table-bordered table-hover dataTable">
							<thead>
								<tr>
									<th>ID</th>
									<th>角色</th>
									<th>描述</th>
									<th>操作权限</th>
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
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="add.jsp" %>
	
	<%@ include file="edit.jsp" %>
	
	<%@ include file="../authorization/authorization.jsp" %>

	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script src="${ctxStatic}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${ctxStatic}/assets/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		
		$(function() {
			dataTable = $("#dataTable").DataTable({
				"processing":true,
				"serverSide":true, //服务端处理
				"scrollY":"400px",
				"info":false,//不显示左下角信息
				"ordering":false,//不排序
				"paging":false,	//不分页
				"searching":false,
	            "ajax":{
	                url:"${ctx}/system/role/datas.json", //获取数据的URL
	                type:"get" //获取数据的方式
	            },
	            "columns":[  //返回的JSON中的对象和列的对应关系
	                {"data":"roleid"},
	                {"data":"rolename"},
	                {"data":"description"},
	                {"data":function(row){
	                	return "<a href='javascript:;' style='text-decoration: none;' onclick='menuAssignment("+row.roleid+",1)'>操作权限分配</a>";
	                }},
	                {"data":function(row){
	                    return "<div class='pull-left action-buttons'><a href='javascript:;' style='text-decoration: none;' class='green' data-id='"+row.roleid+"'><i class='icon-pencil bigger-110'></i></a> <a href='javascript:;' style='text-decoration: none;' class='red' data-id='"+row.roleid+"'><i class='icon-trash bigger-110'></i></a></div>";
	                }}
	            ],
	            "columnDefs":[//具体列的定义
	                {
	                    "targets":[0],
	                    "visible":false
	                }],
	            "language":{
	                "processing":"加载中...",
	                "zeroRecords":"没有检索到数据"
	            }
			});
			
	      	//删除用户
	        $(document).delegate(".red","click",function(){
	        	var roleid = $(this).attr("data-id");
	        	Dialog.confirm('警告:您确定要删除?',function(){
	        		$.post("${ctx}/system/role/del",{"roleid":roleid}).done(function(result){
	                    if("success" == result) {
	                        dataTable.ajax.reload();
	                    }
	                }).fail(function(){
	                	Dialog.alert("删除出现异常");
	                });
	        	});
	        });
	      	
		});
	</script>
</body>