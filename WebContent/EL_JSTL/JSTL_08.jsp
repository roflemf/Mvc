<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
 <c:if test="true"> <%--jstl c:if 조건문 c:else문은 X --%>
  <c:out value="${'무조건 실행' }" /> <%-- c:out; JSTL 출력문 --%>
 </c:if>
 <hr>
 
 <c:if test="${param.name=='king' }"> <%-- 파라미터 name에 king이 담겨져 전달되면 다음문장 실행 --%>
  name 파라미터 값은 '${param.name}' 입니다. <hr>
 </c:if>
 
 <c:if test="${param.age> 20 }">
 당신 나이는 20세 초과입니다 <hr>
 </c:if>
 
 <%-- c:choose c:when c:otherwise = switch ~case (java 다중 선택문)
 	  c:otherwise ; 해당 사항이 없을 때 실행되는 default문--%>
 	  
 <c:choose>
  <c:when test="${param.name== 'king'}">
  당신의 이름은 '${param.name }' 입니다.<hr>
  </c:when>
  <c:when test="${param.age > 20 && param.age <40}">
 당신은 20세 초과, 40세미만입니다.<hr>
  </c:when>
  <c:otherwise> 당신은 'king'이 아니고, 20세 이상도 아닙니다 </c:otherwise>
 </c:choose>
 
 
 <!-- http://localhost:7996/Mvc/EL_JSTL/JSTL_08.jsp?name=king&age=25 -->
 
 
</body>
</html>