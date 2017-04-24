<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户信息管理</title>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<%@ include file="/WEB-INF/views/include/left.jsp"%>
	<div class="app-content" style="margin-top: -2%">
		<div class="app-content-body">
			<div class="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i>客户信息管理</li>
					<li class="active">客户信息</li>
					<li class="active">历史订单</li>
					<li class="active">订单明细</li>
				</ul>
			</div>
			<div class="page-content">
				<div class="tab-content profile-edit-tab-content">
					<div id="edit-basic" class="tab-pane in active">
						<form class="form-horizontal" action="" method="post">
							<h4 class="header blue bolder smaller">订单明细</h4>
							<div class="row">
								
								<div class="profile-user-info profile-user-info-striped">

									<div class="profile-info-row">
										<div class="profile-info-name">订单编号</div>
										<div class="profile-info-value">
											<span name="odr_id">${order.odr_id}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">日期</div>
										<div class="profile-info-value">
											<span name="odr_date">${order.odr_date}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">收货地址</div>
										<div class="profile-info-value">
											<span name="address">${order.address}</span>
										</div>
									</div>
									
									<div class="profile-info-row">
										<div class="profile-info-name">状态</div>
										<div class="profile-info-value">
											<span name="state">
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
											</span>
										</div>
									</div>
									
								</div>
								
							</div>
							
							<c:if test="${not empty order.items}">
								<h4 class="header blue bolder smaller"></h4>
								<div class="row">
								<div class="col-sm-12">
									<table id="dataTable"
										class="table table-striped table-bordered table-hover dataTable">
										<thead>
											<tr>
												<th class="sorting_disabled">商品</th>
												<th class="sorting_disabled">数量</th>
												<th class="sorting_disabled">单位</th>
												<th class="sorting_disabled">单价(元)</th>
												<th class="sorting_disabled">金额(元)</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${order.items}" var="item">
												<tr>
													<td>${item.product.name}</td>
													<td>${item.count}</td>
													<td>${item.product.unit}</td>
													<td>${item.product.price}</td>
													<td>${item.price}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								
								</div>
							</c:if>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
</body>