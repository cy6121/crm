<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户信息管理</title>
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
					<li><i class="icon-home home-icon"></i>客户管理</li>
					<li class="active">客户信息管理</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<table>
							<tr>
								<td><input type="text" id="search_cust_name" placeholder="客户名称"/></td>
								<td><input type="text" id="search_manager_name" placeholder="客户经理"/></td>
								<td><select id="search_state">
										<option value="">状态</option>
										<option value="1">正常</option>
										<option value="2">流失</option>
									</select>
								</td>
								<td><button id="searchBtn" class="btn btn-purple btn-sm pull-left">搜索</button></td>
							</tr>
						</table>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<table id="dataTable"
							class="table table-striped table-bordered table-hover dataTable">
							<thead>
								<tr>
									<th width="80px">客户编号</th>
									<th>客户名称</th>
									<th>地区</th>
									<th>客户经理</th>
									<th>客户等级</th>
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
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>


	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script src="${ctxStatic}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${ctxStatic}/assets/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
		
		$(function() {
			dataTable = $("#dataTable").DataTable({
				"processing" : true,
				"serverSide" : true, //服务端处理
				"ordering" : false,//不排序
				"searching":false,//不使用自带的搜索
				"order":[[1,'desc']],//默认排序方式
	            "lengthMenu":[10,25,50,100],//每页显示数据条数菜单
				"ajax" : {
					url : "${ctx}/customer/datas.json", //获取数据的URL
					type : "get",//获取数据的方式
					data :function(data){
						data.cust_name = $("#search_cust_name").val();
						data.manager_name = $("#search_manager_name").val();
						data.state = $("#search_state").val();
					}
				},
				"columns" : [ //返回的JSON中的对象和列的对应关系
						{"data" : "cust_id"},
						{"data" : "name"},
						{"data" : "region"},
						{"data" : "manager.name"},
						{"data" : "level"},
						{"data" : function(row){
							if(row.state=="1"){
								return "<span class='label label-success'>正常</span>";
							}else if(row.state=="2"){
								return "<span class='label label-danger'>流失</span>";
							}
						}},
						{"data" : function(row) {
							return "<div class='pull-left action-buttons'><a href='${ctx}/customer/edit?cust_id="+row.cust_id+"' style='text-decoration: none;' class='green'><i class='icon-pencil bigger-110'></i></a> <a href='${ctx}/customer/contact?cust_id="+row.cust_id+"&name="+row.name+"' style='text-decoration: none;' class='blue'><i class='icon-group bigger-110'></i></a> <a href='${ctx}/customer/activity?cust_id="+row.cust_id+"&name="+row.name+"' style='text-decoration: none;' class='blue'><i class='icon-exchange bigger-110'></i></a> <a href='${ctx}/customer/order?cust_id="+row.cust_id+"&name="+row.name+"' style='text-decoration: none;' class='blue'><i class='icon-calendar bigger-110'></i></a> </div>";
						}}],
				"language" : {
					"lengthMenu":"每页显示 _MENU_ 条记录",
	                "search":"搜索(客户名称或者联系人):",
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

			 //自定义搜索
	        $("#searchBtn").click(function(){
	        	dataTable.draw(); // DataTables会自动的执行查询
	        });

			
		});
	</script>
</body>