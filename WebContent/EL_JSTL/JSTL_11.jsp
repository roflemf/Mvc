<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="now" value="<%=new java.util.Date() %>" />
<fmt:formatDate value="${now}" type="date" dateStyle="full" /><hr>
<%--fmt:formatData; 날짜정보 출력/ type="date";날짜값 (기본값) / dateStyle="full"; full형태의 날짜 --%>

<fmt:formatDate value="${now}" type="date" dateStyle="short" /><hr>
<%--short ; 간단형태의 날짜값 출력 --%>

<fmt:formatDate value="${now}" type="time" /><hr>
<%--time; 시간값 출력 --%>

<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"  />
<%--both; 날짜 & 시간값 출력 / timeStyle="full" ; full형태의 시간값 출력 --%>




