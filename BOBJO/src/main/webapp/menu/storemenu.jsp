<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
	rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="./css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="./css/responsive.css" rel="stylesheet" />

<!--                 수정                              -->
<style type="text/css">
.global-navigation li {
	background-color: #fff;
	border-bottom: 1px solid #d8d8d8;
	float: left;
	display: block;
	width: 188px;
	height: 65px;
	margin: 0;
	padding: 0;
	border: 0;
	padding: 18px 0 15px;
	color: #333;
	vertical-align: baseline;
	border-bottom: 7px solid #e51f00;
	font: inherit;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	line-height: 1.33;
}

.container {
	*zoom: 1;
	width: 940px;
	margin: 0 auto;
}

.row {
	*zoom: 1;
}

ol, ul {
	list-style: none;
}

.map_container {
	height: 350px;
	width: 500PX;
}

.contact_form-container {
	height: 350px;
	width: 500PX;
}

.map_container .contact_form-container {
	float: center;
}

.icon-list li {
	text-indent: -28px;
	margin-left: 28px;
	margin-bottom: 8px;
}

.icon-list li [class*="icon"] {
	margin-right: 10px;
}

.icon-list li:last-child {
	margin-bottom: 0;
}

.icon-list.-space {
	margin-bottom: 10px;
}

.icon-list .michelin-pc {
	display: inline-block;
	margin-left: 0;
	border-radius: 2px;
	background-color: #ad001e;
	text-indent: 0;
}

.icon-list .michelin-pc__url {
	text-decoration: none;
}

.icon-list .michelin-pc__container, .icon-list .michelin-pc__container--non-img
	{
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
}

.icon-list .michelin-pc__container {
	padding: 3px 8px 3px 0;
}

.icon-list .michelin-pc__container--non-img {
	padding: 3px 8px;
}

.icon-list .michelin-pc__box {
	width: 54px;
	text-align: center;
}

.icon-list .michelin-pc__img {
	height: 16px;
	vertical-align: middle;
}

.icon-list .michelin-pc__text {
	color: #fff;
	font-size: 10px;
	line-height: 1.4;
	word-wrap: break-word;
}

.menu-icon {
	background: url('../img/storenum.png') 0 -2224px;
	display: inline-block;
	vertical-align: middle;
	vertical-align: auto;
	zoom: 1;
	display: inline;
	height: 18px;
	width: 18px;
}

.icon-list li {
	text-indent: -28px;
	margin-left: 28px;
	margin-bottom: 8px;
}

.contact_form-container {
	display: flex;
}

.offset-lg-2 col-md-10 offset-md-1 {
	display: list-item;
}

btn1 {
	background: yellow;
	color: yellow;
}
</style>

<!--                 수정                              -->

</head>

<body class="sub_page">
	<div class="hero_area">
		<!-- header section strats -->
		<div class="brand_box">
			<a class="navbar-brand" href="../mainContent/index.html"> <span>BobJo!
			</span>
			</a>
		</div>
		<!-- end header section -->
	</div>

	<!-- nav section -->

	<section class="nav_section">
		<div class="container">
			<div class="custom_nav2">
				<nav class="navbar navbar-expand custom_nav-container ">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<div class="d-flex  flex-column flex-lg-row align-items-center">
							<ul class="navbar-nav  ">
								<li class="nav-item active"><a class="nav-link"
									href="../mainContent/index.html"> <span class="sr-only">(current)</span></a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="../mainContent/about.html"> </a></li>
								<li class="nav-item"><a class="nav-link"
									href="../mainContent/fruit.html"> </a></li>
								<li class="nav-item"><a class="nav-link"
									href="../mainContent/testimonial.html"></a></li>
								<li class="nav-item"><a class="nav-link"
									href="../mainContent/contact.html"></a></li>


							</ul>



						</div>
					</div>
				</nav>
			</div>
		</div>
	</section>

	<!-- end nav section -->


	<!-- contact section -->

	<section class="contact_section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="offset-lg-2 col-md-10 offset-md-1">
					<div class="heading_container">
						<hr>
						<h2>가게이름</h2>
					</div>
				</div>
			</div>

			<div class="layout_padding2-top">
				<div class="row">
					<div class="col-lg-4 offset-lg-2 col-md-5 offset-md-1">
						<form action="">
							<div class="contact_form-container">
								<div>
									<div class="-item-rect -item-right -col6of12">
										<ul class="icon-list -space sentence">
											<li><span class="menu-icon"></span> 가게주메뉴 카테고리</li>

											<li><span class="price-icon"></span> 가격대</li>

											<li><span class="tel-icon"></span> 가게전화번호</li>

											<li><span class="hours-icon"></span>영업시간 Dinner: 17:00 -
												22:30 Saturday &amp; Sunday &amp; Holiday Lunch: 11:30 -
												16:00 , Dinner: 17:00 - 22:30</li>

											<li><span class="location-icon"></span> 주소 <br>상세주소</li>
										</ul>
									</div>
									<div>
										<button name="btn1">
											<a href="##"> 예약하기 
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-6 px-0">
						<div class="map_container">
							<div class="map-responsive">
								<iframe
									src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&q=
									서울"
									width="600" height="300" frameborder="0"
									style="border: 0; width: 100%; height: 100%" allowfullscreen></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end contact section -->

	<!--   중간 머릿말   -->
	<div class="global-navigation">
		<div class="container">
			<ul>
				<li class="-current"><a
					href="./StoreInfo.st?store_no=${dto.store_no }">가게상세정보</a></li>
				<li class="-current"><a href="./StoreMenu.me">메뉴</a></li>
				<li class="-current"><a href="#">사진</a></li>
				<li class="-current"><a href="#">리뷰</a></li>
			</ul>

		</div>
	</div>

	<br>
	<br>
	<!--   중간 머릿말   -->

	<!-- 내용넣기 시작  -->

	<div class="contents pale-colored">
		<div class="container">
			<div class="main -left price-jpy">
				<div id="restaurantdetail" class="cassette triple-spacing"
					itemscope="" itemtype="http://schema.org/Restaurant">
					<div class="-in">
						<br>
						<h2 class="jumbo spacing-and-a-half -item-left">추천 메뉴</h2>
					</div>
					<table class="table sentence">
						<colgroup>
							<col width="30%">
							<col width="70%">
						</colgroup>
						<tbody>
							<tr>
								<td><a> <img src="./img/pasta.jpg" width="100%"
										height="100%">
								</a></td>
								<td>
									<div class="-item-right -col6of12 -in-vertical">

										<div class="row">
											<div class="-item-right -col8of16">
												<div class="right-spacing">
													<div class="spacing">
														<h3 class="huge abit-spacing">메뉴명</h3>
													</div>
												</div>
											</div>
										</div>

										<div class="row -wide-bottom">
											<div class="-item-left -col3of12">
												<div class="panel -light-silver -in">
													<ul class="spacing-list small">
														<li><b class="b">메뉴설명 : ㄴㅁㅇㄻㄴㅇㄹ</b></li>
														<li><b class="b">카테고리 : ㄴㅁㅇㄻㄴㅇㄹㄴㅁㅇㄹ</b></li>
														<li><b class="b">가격 : ㄴㅁㅇㄻㄴㅇㄹ</b></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td><a> <img src="./img/sushi.jpg" width="100%"
										height="100%">
								</a></td>
								<td>
									<div class="-item-right -col6of12 -in-vertical">

										<div class="row">
											<div class="-item-right -col8of16">
												<div class="right-spacing">
													<div class="spacing">
														<h3 class="huge abit-spacing">메뉴명</h3>
													</div>
												</div>
											</div>
										</div>

										<div class="row -wide-bottom">
											<div class="-item-left -col3of12">
												<div class="panel -light-silver -in">
													<ul class="spacing-list small">
														<li><b class="b">메뉴설명 : ㄴㅁㅇㄻㄴㅇㄹ</b></li>
														<li><b class="b">카테고리 : ㄴㅁㅇㄻㄴㅇㄹㄴㅁㅇㄹ</b></li>
														<li><b class="b">가격 : ㄴㅁㅇㄻㄴㅇㄹ</b></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- /cassette -->

			</div>
		</div>
	</div>


	<!-- 내용넣기 끝  -->

	<!-- info section -->

	<section class="info_section layout_padding">
		<div class="container">
			<div class="info_logo">
				<h2>bob jo!</h2>
			</div>
			<div class="info_contact">
				<div class="row">
					<div class="col-md-4">
						<a href=""> <img src="../images/location.png" alt=""> <span>
								Passages of Lorem Ipsum available </span>
						</a>
					</div>
					<div class="col-md-4">
						<a href=""> <img src="../images/call.png" alt=""> <span>
								Call : +012334567890 </span>
						</a>
					</div>
					<div class="col-md-4">
						<a href=""> <img src="../images/mail.png" alt=""> <span>
								bobjo@gmail.com </span>
						</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-lg-9">
					<div class="info_form">
						<form action="">
							<input type="text" placeholder="Enter your email">
							<button>subscribe</button>
						</form>
					</div>
				</div>
				<div class="col-md-4 col-lg-3">
					<div class="info_social">
						<div>
							<a href=""> <img src="../images/facebook-logo-button.png"
								alt="">
							</a>
						</div>
						<div>
							<a href=""> <img src="../images/twitter-logo-button.png"
								alt="">
							</a>
						</div>
						<div>
							<a href=""> <img src="../images/linkedin.png" alt="">
							</a>
						</div>
						<div>
							<a href=""> <img src="../images/instagram.png" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>

	<!-- end info section -->


	<!-- footer section -->
	<section class="container-fluid footer_section">
		<p>
			&copy; <span id="displayYear"></span> All Rights Reserved By <a
				href="https://html.design/">Free Html Templates</a>
		</p>
	</section>
	<!-- footer section -->


	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/custom.js"></script>

</body>

</html>