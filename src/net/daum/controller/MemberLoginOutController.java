package net.daum.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLoginOutController implements Action {

	@Override
	public ActionForward extecute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();//세션 객체 생성
		
		session.invalidate();//세션 만료=>로그아웃
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location='mem_login.daum';");
		out.println("</script>");
		
		return null;
	}

}
