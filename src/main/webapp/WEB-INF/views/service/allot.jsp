<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务分配</title>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i>服务管理</li>
					<li class="active">服务分配</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<table>
							<tr>
								<td><input type="text" id="search_cust_name" placeholder="客户名称"/></td>
								<td><input type="text" id="search_title" placeholder="概要"/></td>
								<td><select id="search_type">
										<option value="">请选择服务类型</option>
										<c:if test="${not empty serviceTypes}">
											<c:forEach items="${serviceTypes}" var="type">
												<option value="${type.item}">${type.item}</option>
											</c:forEach>
										</c:if>
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
									<th width="80px">编号</th>
									<th>客户名称</th>
									<th>概要</th>
									<th>服务类型</th>
									<th>创建人</th>
									<th>创建日期</th>
									<th>分配给</th>
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


	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script src="${ctxStatic}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${ctxStatic}/assets/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
	
	function dispatch(svr_id) {
		var allot_id = $("#allot_id-"+svr_id).val();
		if (allot_id=="") {
			Dialog.alert("请选择分配给谁!");
			return;
		}
		var url = "${ctx}/service/allot/dispatch"
		var args = {"svr_id":svr_id,"allot_id":allot_id};
		$.post(url,args).done(function (result) {
			if (result=="success") {
				Dialog.alert("分配成功");
				dataTable.ajax.reload();
			}
		}).fail(function () {
			Dialog.alert("分配异常");
		});
	}	
	
	function del(svr_id) {
		Dialog.confirm('警告:您确定要删除?',function (){
			var url = "${ctx}/service/del"
			var args = {"svr_id":svr_id};
			$.post(url,args).done(function (result) {
				if (result=="success") {
					dataTable.ajax.reload();
				}
			}).fail(function () {
				Dialog.alert("删除异常");
			});
		})
	}
	
	$(function() {
		dataTable = $("#dataTable").DataTable({
			"processing" : true,
			"serverSide" : true, //服务端处理
			"ordering" : false,//不排序
			"searching":false,//不使用自带的搜索
			"order":[[1,'desc']],//默认排序方式
            "lengthMenu":[10,25,50,100],//每页显示数据条数菜单
			"ajax" : {
				url : "${ctx}/service/datas.json", //获取数据的URL
				type : "get",//获取数据的方式
				data :function(data){
					data.cust_name = $("#search_cust_name").val();
					data.title = $("#search_title").val();
					data.type = $("#search_type").val();
					data.state = '1';
				}
			},
			"columns" : [ //返回的JSON中的对象和列的对应关系
					{"data" : "svr_id"},
					{"data" : "customer.name"},
					{"data" : "title"},
					{"data" : "type"},
					{"data" : "create.name"},
					{"data" : "create_date"},
					{"data" : function(row){
						var select = "<select id='allot_id-"+row.svr_id+"'><option value=''>请选择</option>"+
						"<c:if test='${not empty users}'><c:forEach items='${users}' var='user'>"+
						"<option value='${user.userid}'>${user.name}</option></c:forEach></c:if></select>";
						var btn = "<button type='button' class='btn btn-xs btn-info' onclick='dispatch("+row.svr_id+")'>分配</button>";
						return select + btn;
					}},
					{"data" : function(row) {
						return "<div class='pull-left action-buttons'><a href='javascript:;' onclick='del("+row.svr_id+")' style='text-decoration: none;' class='red'><i class='icon-trash bigger-110'></i></a> </div>";
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