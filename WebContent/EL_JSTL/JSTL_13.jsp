<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>

<c:set var="country" value="${param.country}"/> <%--value="${'korea'}"로 설정시; korea가 default country로 설정 --%>

<c:if test="${country !=null}" > <%--!empty country 도 사용가능 --%>
 국가명 : <c:out value="${country}" />
</c:if>

<hr>

<c:choose>
 <c:when test="${country == 'korea'}">${country}의 겨울은 춥다</c:when>
 <c:when test="${country == 'canada'}">${country}의 겨울은 더 춥다</c:when>
 <c:otherwise>해당하는 나라가 없다</c:otherwise>
</c:choose>
</body>
</html>