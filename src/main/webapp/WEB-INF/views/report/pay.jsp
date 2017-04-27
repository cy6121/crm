<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户贡献分析</title>
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
					<li class="active">客户贡献分析</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<table>
						<tr>
							<td><input type="text" id="search_cust_name" placeholder="客户名称"/></td>
							<td>日期：</td>
							<td><input type="text" id="search_date_1"/></td>
							<td>&nbsp;-&nbsp;</td>
							<td><input type="text" id="search_date_2"/></td>
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
									<th>客户</th>
									<th>金额(元)</th>
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
	<script src="${ctxStatic}/assets/js/bootstrap-datetimepicker.js"></script>
	<script src="${ctxStatic}/assets/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript">
	$(function() {
		dataTable = $("#dataTable").DataTable({
			"processing" : true,
			"serverSide" : true, //服务端处理
			"ordering" : false,//不排序
			"searching":false,//不使用自带的搜索
			"order":[[0,'desc']],//默认排序方式
            "lengthMenu":[10,25,50,100],//每页显示数据条数菜单
			"ajax" : {
				url : "${ctx}/report/pay/datas.json", //获取数据的URL
				type : "get", //获取数据的方式
				data :function(data){
					data.cust_name = $("#search_cust_name").val();
					data.date_1 = $("#search_date_1").val();
					data.date_2 = $("#search_date_2").val();
				}
			},
			"columns" : [ //返回的JSON中的对象和列的对应关系
					{"data" : null},
					{"data" : "name"},
					{"data" : "price"}
					],
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
		 
        $("#search_date_1").datetimepicker({
			language      : "zh-CN",
			weekStart     : 1,
			autoclose     : 1,
			todayHighlight: true,
			format        : "yyyy-mm-dd",
			minView       : 2,
			forceParse    : 0
		});
		
		$("#search_date_1").click(function () {
			$("#search_date_1").datetimepicker("show");
		});

		$("#search_date_2").datetimepicker({
			language      : "zh-CN",
			weekStart     : 1,
			autoclose     : 1,
			todayHighlight: true,
			format        : "yyyy-mm-dd",
			minView       : 2,
			forceParse    : 0
		});
		
		$("#search_date_2").click(function () {
			$("#search_date_2").datetimepicker("show");
		});
	});
	</script>
</body>