<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户信息管理</title>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i>客户信息管理</li>
					<li class="active">客户信息</li>
					<li class="active">交往记录</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<div class="col-sm-8">客户名称 : ${cust_name}</div>
						<div class="col-sm-4">
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
									<th class="sorting_disabled">时间</th>
									<th class="sorting_disabled">地点</th>
									<th class="sorting_disabled">概要</th>
									<th class="sorting_disabled">详细信息</th>
									<th class="sorting_disabled">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${activityList}" var="activity">
									<tr>
										<td>${activity.atv_date}</td>
										<td>${activity.place}</td>
										<td>${activity.title}</td>
										<td>${activity.description}</td>
										<td>
											<div class='pull-left action-buttons'>
												<a href='javascript:;' style='text-decoration: none;' class='green' onclick="edit(${activity.atv_id})"><i class='icon-pencil bigger-110'></i></a>
											    <a href='javascript:;' style='text-decoration: none;' class='red' onclick="del(${activity.atv_id})"><i class='icon-trash bigger-110'></i></a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="input.jsp"%>
	
	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script src="${ctxStatic}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${ctxStatic}/assets/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">
	
	function del(atv_id){
		Dialog.confirm('警告:您确定要删除?', function() {
			$.post("${ctx}/customer/activity/del", {
				"atv_id" : atv_id
			}).done(function(result) {
				if ("success" == result) {
					window.location.reload();
				}
			}).fail(function() {
				Dialog.alert("删除出现异常");
			});
		});
	}
	</script>
</body>