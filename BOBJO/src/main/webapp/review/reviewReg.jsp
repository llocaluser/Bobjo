<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		align-items: center;
	}
</style>


</head>
<body >

	<div style="border: 1px solid black;width:25rem; display: flex;">
	<form action="./ReviewReg.rv" method="post" enctype="multipart/form-data">
		<input type="text" name="store_no" value="${store_no }" hidden>
		<div style="border: 1px solid black;
		 width:25rem;">
		<div>
		
		리뷰 내용 <input type="text" name="content"> <br>
		</div>
		<div>
		<div style="border: 1px solid black; width: 100%">
		점수 <select name="score">
			<c:forEach var="i" begin="0" end="5">
				<option name="score" value="${i}">${i}</option>
				<c:if test="${i ne 5}">
					<option name="score" value="${i + 0.5}">${i + 0.5}</option>
				</c:if>
			</c:forEach>
		</select><br>
			</div>
			<div style="border: 1px solid black;">
		리뷰 이미지 <input type="file" name="review_img"><br>
		</div>
		</div>
		<input type="submit" value="리뷰 등록">
		</div>
	</form>
	</div>

</body>
</html>