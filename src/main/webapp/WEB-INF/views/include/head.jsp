<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<header class="navbar navbar-default">
	<div class="navbar-header pull-left" data-toggle="class:off-screen"
		data-target=".sidebar">
		<a href="#" class="navbar-brand">
			<button class="hidden-xs">
				<i class="icon-home"></i>
			</button>
			<button class="visible-xs-inline">
				<i class="icon-align-justify"></i>
			</button>
			<span>客户关系管理系统</span>
		</a>
	</div>
	<div class="navbar-header pull-right" role="navigation">
		<ul class="nav top-nav">
			<li class="light-blue no-border-right"><a data-toggle="dropdown"
				href="#" class="dropdown-toggle"> <img class="nav-user-photo"
					src="${ctxStatic}/assets/images/avatars/administrator.png"
					alt="Jason's Photo" /> <span class="user-info"><small
						class="block">欢迎您</small>${curr_user.name}</span> <i
					class="icon-caret-down"></i>
			</a>
				<ul
					class="dropdown-menu dropdown-yellow dropdown-caret caret-right user-menu">
					<li><a href="${ctx}/system/user/information"><i class="icon-user"></i>个人信息</a></li>
					<li class="divider"></li>
					<li><a href="${ctx}/logout"><i class="icon-off"></i>退出</a></li>
				</ul></li>
		</ul>
	</div>
</header>
