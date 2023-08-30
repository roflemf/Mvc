<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h4>1부터 100까지의 홀수 누적합</h4>
<c:set var="sum" value="0" /> <%-- c:set ; JSTL 변수 설정 태그. sum 변수에 0으로 초기화--%>

<c:forEach var="i" begin="1" end="100" step="2">

 <c:set var="sum" value="${sum+i}" /> <%--누적합 --%>
</c:forEach>
누적합=<c:out value="${sum}" />
<hr>

<h4>구구단:7단</h4>
<%-- 
문제) c:forEach JSTL반복문을 사용해서 7단을 구해보자
--%>

 
<c:forEach var="i" begin="1" end="9" step="1"> <%--step="1" 증가값 생략 가능 --%>
 <li>7x${i}=${7*i}</li>   <%--li; 수직정렬 태그, <br>도 사용가능 --%>
</c:forEach>
