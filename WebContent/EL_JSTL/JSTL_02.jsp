<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:out value="JSTL 출력문" />


<c:set var="msg" value="${'안녕하세요' }" /> 
<%--JSTL msg 변수에 안녕하세요 라는 문자 저장 --%>

<%--나이 set --%>
<c:set var="age" scope="page">
 ${28}
</c:set>
<%--나이 set --%>

<hr>
<c:out value="${msg}" /> <%-- jstl msg 변수값 출력--%>
<br>
나이 : <c:out value="${age}" />
<hr>

<c:remove var="age" scope="page" /> <%-- c:remove jstl문으로 age변수를 제거 --%>
나이:${age}
<hr>

<c:catch var = "errmsg">
 예외 발생전
 <%=10/0 %> <%--정수숫자10을 0으로 나누면 예외가 발생 --%>
 예외 발생후
</c:catch> <%-- JSTL c:catch 태그; 예외처리 --%>
:<c:out value="${errmsg}" />
<hr>