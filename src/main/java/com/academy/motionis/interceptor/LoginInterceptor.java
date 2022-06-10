package com.academy.motionis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.academy.motionis.model.LoginDTO;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		if (!request.getServletPath().contains("/resources")
				&&!request.getServletPath().equals("/") 
				&& !request.getServletPath().equals("/index.do")
				&& !request.getServletPath().equals("/login.do")
				&& !request.getServletPath().equals("/addUserForm.do")

				&& !request.getServletPath().equals("/addUser.do")
				&& !request.getServletPath().equals("/addUserForm.do")
				&& !request.getServletPath().equals("/selectTeacherList.do")
			) {
			
			HttpSession session = request.getSession(false);
			if (session == null || session.getAttribute("SESSION_USER") == null) {
				// 미로그인 - 로그인 페이지로 리다이렉트
				response.sendRedirect(request.getContextPath() + "/") ;
				return false;
			}
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
