<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存信息</title>
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
					<li><i class="icon-home home-icon"></i>基础数据</li>
					<li class="active">库存信息</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<div class="col-sm-2">库存列表</div>
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
									<th width="60px">编号</th>
									<th>产品</th>
									<th>仓库</th>
									<th>货位</th>
									<th>件数</th>
									<th>备注</th>
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

	<%@ include file="add.jsp"%>
	
	<%@ include file="edit.jsp"%>

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
				"order":[[0,'desc']],//默认排序方式
	            "lengthMenu":[10,25,50,100],//每页显示数据条数菜单
	            "searchDelay": 1500,//搜索延迟
				"ajax" : {
					url : "${ctx}/dict/storage/datas.json", //获取数据的URL
					type : "get"//获取数据的方式
				},
				"columns" : [ //返回的JSON中的对象和列的对应关系
						{"data" : "stkId"},
						{"data" : "product.name"},
						{"data" : "warehouse"},
						{"data" : "stkWare"},
						{"data" : "stkCount"},
						{"data" : "memo"},
						{"data" : function(row) {
							return "<div class='pull-left action-buttons'><a href='javascript:;' style='text-decoration: none;' class='green' data-id='"+row.stkId+"'><i class='icon-pencil bigger-110'></i></a> <a href='javascript:;' style='text-decoration: none;' class='red' data-id='"+row.stkId+"'><i class='icon-trash bigger-110'></i></a></div>";
							}
						}],
				"language" : {
					"lengthMenu":"每页显示 _MENU_ 条记录",
	                "search":"搜索(产品或者仓库):",
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
			$(document).delegate(".red", "click", function() {
				var stkId = $(this).attr("data-id");
				Dialog.confirm('警告:您确定要删除?', function() {
					$.post("${ctx}/dict/storage/del", {
						"stkId" : stkId
					}).done(function(result) {
						if ("success" == result) {
							dataTable.ajax.reload();
						}
					}).fail(function() {
						Dialog.alert("删除出现异常");
					});
				});
			});

		});
	</script>
</body>