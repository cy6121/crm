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
				</ul>
			</div>
			<div class="page-content">
				<div class="tab-content profile-edit-tab-content">
					<div id="edit-basic" class="tab-pane in active">
					<h4 class="header blue bolder smaller">客户信息</h4>
						<form class="form-horizontal" id="custForm">
							<div class="row">
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">客户名称</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="name" readonly="readonly"
													class="col-xs-10" value="${customer.name}">
												<input type="hidden" name="cust_id"
													class="col-xs-10" value="${customer.cust_id}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">地区</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<select name="region" class="col-xs-10">
													<option value="${customer.region}">${customer.region}</option>
													<c:if test="${not empty regionList}">
														<c:forEach items="${regionList}" var="region">
															<option value="${region.item}">${region.item}</option>
														</c:forEach>
													</c:if>
												</select>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">客户经理</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="manager_name" readonly="readonly"
													class="col-xs-10" value="${customer.manager.name}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">客户等级</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<select name="level" class="col-xs-10">
													<option value="${customer.level}">${customer.level}</option>
													<c:if test="${not empty levelList}">
														<c:forEach items="${levelList}" var="level">
															<option value="${level.item}">${level.item}</option>
														</c:forEach>
													</c:if>
												</select>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">客户满意度</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<select name="satisfy" class="col-xs-10">
													<option value="${customer.satisfy}">${customer.satisfy}</option>
													<c:if test="${not empty satisfyList}">
														<c:forEach items="${satisfyList}" var="satisfy">
															<option value="${satisfy.item}">${satisfy.item}</option>
														</c:forEach>
													</c:if>
												</select>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">客户信用度</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<select name="credit" class="col-xs-10">
													<option value="${customer.credit}">${customer.credit}</option>
													<c:if test="${not empty creditList}">
														<c:forEach items="${creditList}" var="credit">
															<option value="${credit.item}">${credit.item}</option>
														</c:forEach>
													</c:if>
												</select>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">地址</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="address"
													class="col-xs-10" value="${customer.address}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">邮政编码</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="zip"
													class="col-xs-10" value="${customer.zip}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">电话</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="tel"
													class="col-xs-10" value="${customer.tel}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">传真</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="fax"
													class="col-xs-10" value="${customer.fax}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">网址</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="website"
													class="col-xs-10" value="${customer.website}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">注册号</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="licence_no" placeholder="注册号或统一社会信用代码"
													class="col-xs-10" value="${customer.website}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">法人</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="chieftain"
													class="col-xs-10" value="${customer.chieftain}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">注册资金(万元)</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="bankroll"
													class="col-xs-10" value="${customer.bankroll}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">年营业额</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="turnover"
													class="col-xs-10" value="${customer.turnover}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">开户银行</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="bank"
													class="col-xs-10" value="${customer.bank}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-6 col-sm-12 col-xs-12 no-padding-left">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">银行账户</label>
										<div class="col-sm-9">
											<div class="clearfix">
												<input type="text" name="bank_account"
													class="col-xs-10" value="${customer.bank_account}">
											</div>
										</div>
									</div>
								</div>
								
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix form-actions">
			<button class="btn btn-info" type="button" onclick="save()"
				style="margin-left: 44%">
				<i id="changeIcon" class="icon-ok bigger-110"></i> 保存
			</button>
		</div>

	</div>
	<script src="${ctxStatic}/assets/js/bootstrap.min.js"></script>
	<script src="${ctxStatic}/assets/js/ace.min.js"></script>
	<script src="${ctxStatic}/js/left.js"></script>
	<script type="text/javascript">
		function save() {
			if (${customer.state}!="1") {
				Dialog.alert("只能修改状态正常的客户!");
				return;
			}
			
			$.post("${ctx}/customer/edit",$("#custForm").serialize()).done(function(result){
				if (result=="success") {
					Dialog.alert("修改成功!");
				}
			}).fail(function(){
				Dialog.alert("修改异常!");
			});
		}
		
	</script>
</body>