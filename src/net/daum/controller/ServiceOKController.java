package net.daum.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.daum.dao.TestDAOImpl;
import net.daum.vo.TestVO;

/**
 * Servlet implementation class ServiceOKController
 */
@WebServlet("/service_ok")
public class ServiceOKController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/*post 방식일때는 doPost()메서드를 오버라이딩 해서 호출 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");//브라우저에 출력되는 문자와 태그, 언어코딩 타입 설정
		PrintWriter out = response.getWriter();//출력스트림 객체 설정
		request.setCharacterEncoding("UTF-8");//post로 전송되는 한글 안깨지게
		
		String title = request.getParameter("title");
		String cont = request.getParameter("content");
		
		out.println("글제목 :<strong>" +title+"</strong><hr>");
		out.println("내용 :<strong>" +cont+"</strong><hr>");
		out.println("<a href='service_write'>입력</a>");
		
		TestVO t = new TestVO();
		t.setTitle(title); t.setContent(cont);
		
		TestDAOImpl tdao = new TestDAOImpl();
		int re = tdao.testInsert(t); //저장
		
		if(re==1) {
			out.println("<script>");
			out.println("alert('저장에 성공했습니다');");
			out.println("location='service_List';");//목록보기로 이동
			out.println("</script>");
		}
		
		out.close();//출력 스트림 닫기
        /*		sw.jsp에서실행 --*/
	}

}
