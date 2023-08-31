package net.daum.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MFrontController extends HttpServlet {
	
	/* get or post 양쪽 방식 모두 실행할 때는
	 *  service()메서드를 오버라이딩을 해서 호출한다.
	 */

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestUri= request.getRequestURI();// /Mvc/*.daum을 구함
		String contextPath = request.getContextPath();// /Mvc 컨텍스트 패스 경로 구함
		String command = requestUri.substring(contextPath.length()); // /Mvc 이후의 /*.daum을 구함
		
		ActionForward forward = null;
		Action action = null;
		
		Properties prop = new Properties();//키,값 쌍으로 저장하는  사전적인 자료구조 컬렉션 클래스
		FileInputStream fis = new FileInputStream(request.getRealPath(
				"/WEB-INF/classes/daum.properties"));
		//getRealPath()메서드는 톰캣 WAT서버에 의해 변경된 실제 프로젝트 하위의 /WEB-INF/classes 경로의 daum.properties 파일을 읽어들임
		//실제경로 : E:\20230511_java\Web_WorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Mvc\WEB-INF\classes
		 prop.load(fis); //프로퍼티 파일 로드
		 fis.close(); // 입력스트림 닫기
		 
		 String value = prop.getProperty(command); //키에 대한 값을 구함
		 //값으로 execute|net.daum.controller.실제 컨트롤러 클래스명
		
		 if(value.substring(0, 7).equals("execute")) {//0이상 7미만 사이의 문자를 구해 그것이 execute와 같다면
			 try {
				 StringTokenizer st = new StringTokenizer(value, "|");//|를 기준으로 문자 분리
				 String url_01=st.nextToken(); //첫번째로 분리된(파싱된)문자 execute구함
				 String url_02=st.nextToken(); //두번째로 분리된 문자 net.daum.controller.실제컨트롤러 클래스명을 구함
				 Class url = Class.forName(url_02);//실제 컨트롤러 클래스 로드
				 
				 action = (Action)url.newInstance(); //객체화하여 명시적 다운캐스팅
				 
				 try{
					 forward=action.extecute(request, response);
					 //실제 자손에서 오버라이딩한 메서드 execute()호출
				 }catch (Exception e) {e.printStackTrace();}
			 }catch(ClassNotFoundException e){//해당 클래스명을 찾지 못했을 때 발생하는 예외 처리
				 e.printStackTrace();
			 }catch(InstantiationException e) {//추상클래스나 인터페이스가 인스턴스(객체)를 하고자 할때(객체 생성하고자 할떄); 추상클래스나 인터페이스는 객체를 만들지못함
				 e.printStackTrace();
			 }catch(IllegalAccessException e) {// 클래스 접근을 못할때
				 e.printStackTrace();
			 }
		 }//if
		 
		 if(forward != null) {
			 if(forward.isRedirect()==true) {//==true 생략가능
				 response.sendRedirect(forward.getPath());//레코드 저장, 수정, 삭제 후에 새로운 매핑 주소로 이동할때 사용한다. 
				 //이런 경우는 request.setAttribute(키이름, 값)에 의해 키에 저장된 값을 유지하지 못한다.
				 //이유는 기존 매핑주소를 잃어버리기 때문이다. 하지만 로그인 인증할떄 사용하는 session.setAttribute(세션 키이름, 값)은 유지해서 로그인 된 상태를 가질 수 있다. 
			 }else {
				 RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				 dis.forward(request, response);//기존 매핑주소 유지하고, request or session에 의해 저장된 키이름, 값도 유지
			 }//if else
		 }//if
		 
		 
		 //실행후 http://localhost:7996/Mvc/mem_login.daum 뒤 주소 수정해서 실행
	}
}
