<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户信息管理</title>
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
					<li><i class="icon-home home-icon"></i>客户信息管理</li>
					<li class="active">客户信息</li>
					<li class="active">历史订单</li>
				</ul>
			</div>
			<div class="page-content">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">
					<div class="row">
						<div class="col-sm-12">客户名称 : ${cust_name}</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<table id="dataTable"
							class="table table-striped table-bordered table-hover dataTable">
							<thead>
								<tr>
									<th class="sorting_disabled">订单编号</th>
									<th class="sorting_disabled">日期</th>
									<th class="sorting_disabled">送货地址</th>
									<th class="sorting_disabled">状态</th>
									<th class="sorting_disabled">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${orderList}" var="order">
									<tr>
										<td>${order.odr_id}</td>
										<td>${order.odr_date}</td>
										<td>${order.address}</td>
										<td>
											<script type="text/javascript">
												switch ('${order.state}') {
													case '1':
														document.write('已付款');
														break;
													case '2':
														document.write('未付款');
														break;
												}
											</script>
										<td>
											<div class='pull-left action-buttons'>
												<a href='${ctx}/customer/order/detail?odr_id=${order.odr_id}' style='text-decoration: none;' class='blue'><i class='icon-zoom-in bigger-110'></i></a>
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

	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script src="${ctxStatic}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${ctxStatic}/assets/js/dataTables.bootstrap.min.js"></script>
</body>