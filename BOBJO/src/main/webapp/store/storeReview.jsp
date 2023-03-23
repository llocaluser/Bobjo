<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
a {
	color: black;
}

.row-col4 {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-around;
}

.global-navigation li {
	background-color: #fff;
	border-bottom: 1px solid #d8d8d8;
	float: left;
	display: block;
	width: 25%;
	height: 80px;
	margin: 0;
	padding: 0;
	border: 0;
	padding: 18px 0 15px;
	color: black;
	vertical-align: baseline;
	font-size: 24px;
	font-weight: bold;
	text-align: center;
}

.global-navigation li:hover {
	color: blue;
	background: beige;
	border-bottom: 7px solid #e51f00;
}

li.-current {
	color: blue;
	background: beige;
	border-bottom: 7px solid #e51f00;
}

.main -left price-jpy {
	background: beige;
}

#h2 {
	font-size: 3rem;
}

.container {
	*zoom: 1;
	width: 1250px;
	margin: 0 auto;
	margin-left: 16.666667%;
}

table tr {
	background: beige;
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

.menu-icon, .price-icon, .tel-icon, .hours-icon, .location-icon {
	width: 20px;
	height: 20px;
}

.contact_form-container {
	display: flex;
}

.offset-lg-2 col-md-10 offset-md-1 {
	display: list-item;
}

button.btn1:hover {
	color: blue;
	background: beige;
	font: bold;
	font-size: 20px;
}

button.btn1 {
	font: bold;
	font-size: 20px;
	margin-left: 40px
}

</style>

<!--                 수정                              -->

</head>

<body class="sub_page">
	<div class="hero_area">
		<!-- header section strats -->
		<div class="brand_box">
			<a class="navbar-brand" href="./Main.me"> 
			<span>BobJo! </span>
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
						<h2 id="h2">${dto.store_name }</h2>
					</div>
				</div>
			</div>

			<div class="layout_padding2-top">
				<div class="row">
					<div class="col-lg-4 offset-lg-2 col-md-5 offset-md-1">
							<div class="contact_form-container">
								<div>
									<div class="-item-rect -item-right -col6of12">
										<ul class="icon-list -space sentence">
											<li><span><img src="./img/blackbell.png" class="menu-icon"></span> ${dto.store_category }</li>

											<li><span ><img src="./img/money.png" class="price-icon"></span> 가격대 ${dto.minPrice } ~ ${dto.maxPrice }</li>

											<li><span ><img src="./img/phone.png" class="tel-icon"></span> ${dto.tel }</li>

											<li><span ><img src="./img/watch.png" class="hours-icon"></span>OPEN : ${dto.open } <br>
																											CLOSE : ${dto.close }</li>

											<li><span></span><img src="./img/house.png" class="location-icon"></span> 주소 : ${dto.addr } <br>
																												상세주소 : ${dto.addr_details }</li>
										</ul>
									</div>
									<div>
										<form action="./ReservationAction.re" method="post" name="frm_rsrvAction">
										<input type="hidden" name="store_no" value="${dto.store_no }">
								  	  	<button class="btn1" type="submit">
											예약하기
								  	  	</button>
									</form>
									</div>
								</div>
							</div>
						
						
					</div>
					<div class="col-md-6 px-0">
						<div class="map_container">
							<div class="map-responsive">
								<iframe
									src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&q=
									${dto.store_name} ${dto.addr}"
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
				<li ><a href="./StoreInfo.st?store_no=${dto.store_no }">가게상세정보</a></li>
				<li ><a href="./StoreMenu.nu?store_no=${dto.store_no }">메뉴</a></li>
				<li ><a href="./StoreImg.st?store_no=${dto.store_no }">사진</a></li>
				<li class="-current"><a href="./ReviewList.rv?store_no=${dto.store_no }">리뷰</a></li>

			</ul>

		</div>
	</div>

	<!--   중간 머릿말   -->

	<!-- 내용넣기 시작  -->

	<br><br>
	
	<jsp:include page="../review/review.jsp"/>

	<!-- 내용넣기 끝  -->

	<!-- info section -->

	<section class="info_section layout_padding">
		<div class="container">
			<div class="info_logo">
				<h2>NiNom</h2>
			</div>
			<div class="info_contact">
				<div class="row">
					<div class="col-md-4">
						<a href=""> <img src="./images/location.png" alt=""> <span>
								Passages of Lorem Ipsum available </span>
						</a>
					</div>
					<div class="col-md-4">
						<a href=""> <img src="./images/call.png" alt=""> <span>
								Call : +012334567890 </span>
						</a>
					</div>
					<div class="col-md-4">
						<a href=""> <img src="./images/mail.png" alt=""> <span>
								demo@gmail.com </span>
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
							<a href=""> <img src="./images/facebook-logo-button.png"
								alt="">
							</a>
						</div>
						<div>
							<a href=""> <img src="./images/twitter-logo-button.png"
								alt="">
							</a>
						</div>
						<div>
							<a href=""> <img src="./images/linkedin.png" alt="">
							</a>
						</div>
						<div>
							<a href=""> <img src="./images/instagram.png" alt="">
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


	<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap.js"></script>
	<script type="text/javascript" src="./js/custom.js"></script>

</body>

</html>