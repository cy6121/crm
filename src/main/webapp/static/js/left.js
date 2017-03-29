$(function() {
	//标题名称必须和子菜单名称相同
	var title = $("title").html();
	//父级菜单下子菜单的样式
	$("#"+title+"").addClass("active").siblings("li").removeClass("active");
	//父级菜单的样式
	$("#"+title+"").parents("li").addClass("open").addClass("active").siblings("li").removeClass("open").removeClass("active");
});