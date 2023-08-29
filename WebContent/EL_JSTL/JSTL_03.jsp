<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="fruit" value="${param.name }" /> <%--파라미터 이름 name에 실려온 값을 fruit JSTL 변수에 저장
*.jsp?name=값 형태의 주소창에 노출된느 get방식으로 전달해야 --%>

파라미터 이름 name 에 실려온 값:
<c:if test="${!empty fruit}">
 <c:out value="${fruit}" />
</c:if>
<hr>

<c:choose>
 <c:when test="${fruit == 'apple'}">
 <c:out value="${fruit}" /> : 사과
</c:when>
 <c:when test="${fruit == 'grape' }">
 <c:out value="${fruit}" /> : 포도
</c:when>
 <c:otherwise>해당사항없음.</c:otherwise>
 </c:choose>
 <!-- JSTL c:choose 다중조건문; 자바의 switch~case문과 같은 기능
 	  switch~case의 default문과 같은 기능을 하는 것은 c:otherwise문이다. -->
 	  
 	  
 <!-- 입력방법 ;http://localhost:7996/Mvc/EL_JSTL/JSTL_03.jsp?name=apple -->
 
