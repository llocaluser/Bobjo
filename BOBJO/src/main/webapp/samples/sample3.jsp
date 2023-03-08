<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="to insert page" onclick="location.href='./SampleTest1.sa'">
	<hr>
	<c:forEach var="dto" items="${list }">
		${dto.sampleId }<br>
	</c:forEach>
</body>
</html>