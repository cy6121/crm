package com.swpu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.swpu.entity.User;
import com.swpu.util.Const;

/** 
* @author  cy
* @createDate 2017年4月8日 下午10:26:55 
* @version 1.0 
* @describe  
*/
public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String path = request.getServletPath();
		if (path.matches(Const.NO_INTERCEPTOR_PATH)) {
			return true;
		}
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		if (user!=null) {//判断用户是否登录或者过期
			return true;
		}else{
			response.sendRedirect(request.getContextPath()+"/login");
		}
		
		return false;
	}
}
