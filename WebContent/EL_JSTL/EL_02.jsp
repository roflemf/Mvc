<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
 <H2>기존 유즈빈 액션태그,표현식과 EL 즉, 표현언어 비교실습</H2>
 <jsp:useBean id = "user" class="net.daum.vo.UserVO" scope="page" />
 <%--jsp유즈빈 액션태그를 사용해서 UserVO빈클래스의 객체명 user를 생성 --%>
 <jsp:setProperty name="user" property="firstName" value="홈" />
 <%--값 저장 액션태그. firstName변수에 value속성값 홈 저장
 	자바코드로 표현시; use.setFirstName("홈"); --%>
 <jsp:setProperty name="user" property="lastName"  value="길동"/>
 
 성:<jsp:getProperty name="user" property="firstName" /> 
 <%--값반환 액션태그  / 자바코드; user.getFirstName();--%>
 <br>
 이름:<%=user.getLastName() %>
 <hr>
 성:${user.firstName }<br>
 이름:${user.lastName }<hr>
 <%--표현언어인 EL로 출력. 
 	자바코드; user.getFirstName() --%>
</body>
</html>