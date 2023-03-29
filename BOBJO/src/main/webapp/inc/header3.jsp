<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>BobJo!</title>

<!-- slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="../css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="../css/responsive.css" rel="stylesheet" />

<!--                 수정                              -->
<style type="text/css">
 .brand_box{
 display: flex;
 justify-content: space-between;
 }
 .headerOption{
 color: black;
 border: 2px ridge black;
 background: white;
 border-radius: 5px; 
 padding: 5px 10px;
 }
 .login_box {
 margin: 10px 20px;
 }
</style>


<!--                 수정                              -->

</head>

<body class="sub_page">
  <!-- header section -->
  <div class="hero_area">
    <div class="brand_box">
    <div>
      <a  href="./Main.me">
        <span>
          <img style="width: 140px;padding-top: 0;margin: 0 100px" alt="" src="./img/Logo1.png">
        </span>
      </a>
    </div>
    <div>
      <a  href="./Main.me">
        <span>
         <img style="width: 380px" alt="" src="./img/BOBJO!1.png">
        </span>
      </a>
      </div>

      <c:if test="${sessionScope.m_id == null }">
      <div style="display: flex; margin: 0 100px; ">
      <div class="login_box" >
      <a class="headerOption" href="./MemberLogin.me">
				로그인
			</a>
      </div>
      <div class="login_box">
      <a class="headerOption" href="./MemberJoin.me">
				회원가입
			</a>
		</div>
		</div>
		</c:if>
		<c:if test="${sessionScope.m_id != null }">
      <div style="display: flex; margin: 0 100px; ">
		 <div class="login_box" >
      <a class="headerOption" href="./MemberLogoutAction.me">
				로그아웃
			</a>
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
  <!-- header section -->
  </body>

</html>