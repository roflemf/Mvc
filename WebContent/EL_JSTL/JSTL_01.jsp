<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--jstl 코어 태그립 추가, 
JSTL(JSP Standard Tag Library): 사용자 정의 표준 태그
(예약어처럼 사용, 외부 라이브러리가 있어야함. cf)EL;외부라이브러리 필요X )
서블릿 mv 포함 스프링 프레임워크에서 뷰페이지 문법으로 많이 사용됌.
스프링 부트 이후부터는 타임리프(ThymeLeaf)라는 뷰페이지 템플릿을 제공중.
뷰페이지 문법으로 JSTL 과 EL 을 사용하면 기존의 JSP스크립트 요소인 선언문, 스크립트릿, 표현식보다 가독성 좋아지고 코드가 간결해짐--%>

<jsp:useBean id="user" class="net.daum.vo.UserVO" />
<jsp:setProperty name="user" property="firstName" value="세종" />
<jsp:setProperty name="user" property="lastName" value="대왕님" />

<H3>기존 jsp 스크립트 요소로 성과 이름 가져오기</H3>
성:<% if(user.getFirstName() != null){ %>
	<input type="text" name="firstName" size="5" value="<%=user.getFirstName()%>" >
<% } %>
이름: <% if(user.getLastName()!= null) { %>
	<input type="text" name="lastName" size="8" value="<%=user.getLastName()%>" >
<% } %>
<hr>

<h3>JSTL과 EL을 사용해서 성,이름 가져오기</h3>
<form>
성 : <c:if test="${!empty user.firstName}"> <%--c:if JSTL 조건문. test 속성값으로  EL이 사용됌--%>
	 <input type="text" name="firstName" size="4" value="${user.firstName}" >
	</c:if>
이름 : <c:if test="${!empty user.lastName }">
	  <input type="text" name="lastName" size="8" value="${user.lastName }">
	  </c:if>
	  
	  <%--${user.firstName}; property 접근법(EL); setter, getter 따로 두지 않고 직접 접근 및 출력  --%>
</form>