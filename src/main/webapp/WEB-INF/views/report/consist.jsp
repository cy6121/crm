<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户构成分析</title>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<link rel="stylesheet"
	href="${ctxStatic}/assets/css/dataTables.bootstrap.min.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i>统计报表</li>
					<li class="active">客户构成分析</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<table>
						<tr>
							<td>类型：</td>
							<td><select id="search_type">
									<option value="客户等级" selected="selected">按客户等级</option>
									<option value="客户信用度">按客户信用度</option>
									<option value="客户满意度">按客户满意度</option>
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
									<th>编号</th>
									<th>类型</th>
									<th>客户数量</th>
								</tr>
							</thead>
							<tbody>
								<tr>
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
			"scrollY" : "400px",
			"info" : false,//不显示左下角信息
			"ordering" : false,//不排序
			"paging" : false, //不分页
			"searching" : false,
			"ajax" : {
				url : "${ctx}/report/consist/datas.json", //获取数据的URL
				type : "get", //获取数据的方式
				data :function(data){
					data.type = $("#search_type").val();
				}
			},
			"columns" : [ //返回的JSON中的对象和列的对应关系
					{"data" : null},
					{"data" : "item"},
					{"data" : "count"}
					],
			"language" : {
				"processing" : "加载中...",
				"zeroRecords" : "没有检索到数据"
			},
			"drawCallback" : function() { // 序号列
            	var api = this.api();
            	var startIndex = api.context[0]._iDisplayStart; // 获取本页开始的条数
            	api.column(0).nodes().each(function(cell, i) {
            	cell.innerHTML = startIndex + i + 1;
            	});
        	}
		});
		
		 //自定义搜索
        $("#searchBtn").click(function(){
        	dataTable.draw(); // DataTables会自动的执行查询
        });

	});
	</script>
</body>