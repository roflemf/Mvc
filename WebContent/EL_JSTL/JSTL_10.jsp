<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="price" value="10000" />
<fmt:formatNumber value="${price}" type="number" var="numberType" />
<%--fmt:formatNumber; JSTL 숫자양식 / type 속성 기본값; number(숫자형식: 세자리수 , 로 표현)--%>

숫자형식 : <c:out value="${numberType}" />
<hr>
통화형식 : <fmt:formatNumber value="${price}" type="currency" currencySymbol="$ "/>
<%-- type="currency"; 통화형식/ currencySymbol; 통화기호 표시 --%>
<hr>

패턴형식 : <fmt:formatNumber value="${price}" pattern="000000.00" />
<%-- pattern속성에 지정한 형태로 출력 --%>