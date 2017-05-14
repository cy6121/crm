<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户流失管理</title>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
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
					<li class="active">客户流失管理</li>
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
										<option value="">请选择状态</option>
										<option value="1">暂缓流失</option>
										<option value="2">确认流失</option>
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
									<th width="80px">流失编号</th>
									<th width="80px">客户名称</th>
									<th width="80px">客户经理</th>
									<th>上次下单时间</th>
									<th>确认流失时间</th>
									<th width="100px">暂缓措施</th>
									<th width="100px">流失原因</th>
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

	<%@ include file="delay.jsp" %>
	
	<%@ include file="confirm.jsp" %>

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
					url : "${ctx}/customer/drain/datas.json", //获取数据的URL
					type : "get",//获取数据的方式
					data :function(data){
						data.cust_name = $("#search_cust_name").val();
						data.manager_name = $("#search_manager_name").val();
						data.state = $("#search_state").val();
					}
				},
				"columns" : [ //返回的JSON中的对象和列的对应关系
						{"data" : "drain_id"},
						{"data" : "customer.name"},
						{"data" : "customer.manager.name"},
						{"data" : "last_order_date"},
						{"data" : "lost_date"},
						{"data" : "delay"},
						{"data" : "reason"},
						{"data" : function(row){
							if(row.state=="1"){
								return "<span class='label label-warning'>暂缓流失</span>";
							}else if(row.state=="2"){
								return "<span class='label label-danger'>确认流失</span>";
							}
						}},
						{"data" : function(row) {
							if (row.state=="1") {
								return "<div class='pull-left action-buttons'><a href='javascript:;' onclick='delay("+row.drain_id+")' title='暂缓流失' style='text-decoration: none;' class='green'><i class='icon-edit bigger-110'></i></a> <a href='javascript:;' onclick='confirm("+row.drain_id+")' title='确认流失' style='text-decoration: none;' class='blue'><i class='icon-check bigger-110'></i></a> </div>";
							}else{
								return "";
							}
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