<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../ReservationAction.re" method="post">
<input type="hidden" name="store_no" value="1">
<input type="hidden" name="menu_no" value="1,2,3,4">
<input type="hidden" name="menu_amount" value="1,2,2,5">
<input type="hidden" name="price" value="1000">
<input type="submit" value="예약하기">
</form>
</body>
</html>