<%@ page  contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //post로 전달되는 한글 안깨지게
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<form method="post" action="EL_04.jsp">
	<label for="addr">주소</label> <%--"label for 속성명 addr "=  "input 태그 id 속성명 "이면  
	마우스 조작이 불편하신 분들이 입력필드 외에 주소 라벨만 선택해도 입력필드 선택효과가 발생 --%>
	<input type="text" name = "addr" id="addr" size="36" value="${param.addr}" >
	<input type="submit" value="전송" >
	<hr>
	<h3 style="color:orange;">입력하신 주소는 <span style="color:red;">${param.addr}</span> 입니다.</h3>
</form>
</body>
</html>