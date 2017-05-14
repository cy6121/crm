<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售机会管理</title>
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
					<li><i class="icon-home home-icon"></i>营销管理</li>
					<li class="active">销售机会管理</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<div class="col-sm-2">销售机会列表</div>
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
									<th>客户名称</th>
									<th>概要</th>
									<th>联系人</th>
									<th>联系人电话</th>
									<th>创建人</th>
									<th>创建时间</th>
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

	<%@ include file="add.jsp"%>
	
	<%@ include file="edit.jsp"%>
	
	<%@ include file="dispatch.jsp"%>

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
					url : "${ctx}/sale/chance/datas.json", //获取数据的URL
					type : "get"//获取数据的方式
				},
				"columns" : [ //返回的JSON中的对象和列的对应关系
						{"data" : "sale_id"},
						{"data" : "cus_name"},
						{"data" : "title"},
						{"data" : "contact"},
						{"data" : "tel"},
						{"data" : "create.name"},
						{"data" : "create_date"},
						{"data" : function(row) {
							return "<div class='pull-left action-buttons'><a href='javascript:;' style='text-decoration: none;' class='green' data-id='"+row.sale_id+"'><i class='icon-pencil bigger-110'></i></a> <a href='javascript:;' title='指派' style='text-decoration: none;' class='blue' data-id='"+row.sale_id+"'><i class='icon-external-link bigger-110'></i></a> <a href='javascript:;' style='text-decoration: none;' class='red' data-id='"+row.sale_id+"'><i class='icon-trash bigger-110'></i></a></div>";
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

			//删除用户
			$(document).delegate(".red", "click", function() {
				var sale_id = $(this).attr("data-id");
				
				$.get("${ctx}/sale/chance/data.json", {
					"sale_id" : sale_id
				}).done(function(result) {
					if(result.state!="1"){
						Dialog.alert("只能删除未分配的销售机会!");
						return;
					}
					if(${curr_user.userid}!=result.create.userid){
						Dialog.alert("该销售机会创建人才能删除!");
						return;
					}
					
					Dialog.confirm('警告:您确定要删除?', function() {
						$.post("${ctx}/sale/chance/del", {
							"sale_id" : sale_id
						}).done(function(result) {
							if ("success" == result) {
								dataTable.ajax.reload();
							}
						}).fail(function() {
							Dialog.alert("删除出现异常");
						});
					});
				}).fail(function() {
				});
				
			});

		});
	</script>
</body>