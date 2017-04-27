<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar" id="sidebar">
	<ul class="nav nav-list">
		<li class="active"><a href="javascript:;"> <i class="icon-dashboard"></i>
				<span class="menu-text"> 控制台 </span>
		</a></li>
		<c:forEach var="menu" items="${menuList}">
			<li>
				<a href="javascript:;" class="dropdown-toggle">
					<i class="${menu.icon}"></i>
					<span class="menu-text">${menu.name}</span>
					<i class="arrow icon-angle-down"></i>
				</a>
				<ul class="submenu">
					<c:forEach var="submenu" items="${submenuList}">
						<c:if test="${submenu.pId==menu.id}">
							<li id="${submenu.name}">
								<a href="${ctx}/${submenu.url}">
									<i class="${submenu.icon}"></i>
									<span>${submenu.name}</span>
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</c:forEach>
	</ul>
</div>
