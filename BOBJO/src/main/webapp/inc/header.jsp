<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="fontawesome/css/all.min.css"> --> <!-- https://fontawesome.com/ -->
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<!-- https://fonts.google.com/ -->
<!-- <link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/templatemo-video-catalog.css"> -->
<link rel="stylesheet" href="./css/header.css">
</head>
<body>
	<div class="header">
	<div class="container left">
	<div>
	<a  href="./Main.me">
		<img style="width: 80px;" src="./img/Logo1.png">
	</a>
	</div>
	<div>
	<a  href="./Main.me">
		<img style="width: 200px;" src="./img/BOBJO!1.png">
	</a>
	</div>
	</div>
	<div class="container right">
		<c:if test="${sessionScope.m_id == null }">
		<div class="login_box">
			<a href="./MemberLogin.me"
				style="display: inline;">
				로그인
			</a>
		</div>
		<div class="login_box">
			<a href="./MemberJoin.me"
				style="display: inline;">
				회원가입
			</a>
		</div>
		</c:if>
		<c:if test="${sessionScope.m_id != null }">
		<div class="container right">
		<div class="login_box">
			<a href="./MemberLogoutAction.me"
				style="display: inline;">로그아웃</a>
		</div>
		<div class="login_box">
			<c:if test="${sessionScope.m_id eq 'admin' }">
			<a href="./AdminMyPage.ad" style="display: inline;">마이페이지</a>
			</c:if>
			<c:if test="${sessionScope.m_id ne 'admin' }">
			<a href="./MemberMypage.me" style="display: inline;">마이페이지</a>
			</c:if>
		</div>
		</div>
		</c:if>
		
	</div>
	</div>
</body>
</html>