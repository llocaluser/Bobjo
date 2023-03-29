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
<!-- JQuery CDN -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<!--                 수     정                      -->
<style type="text/css">
a{
color: black;
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
    .global-navigation li:hover{
    color: blue;
    background : beige;
	border-bottom: 7px solid #e51f00;
	
    
    }
    li.-current{
    color: blue;
    background : beige;
	border-bottom: 7px solid #e51f00;
    
    }
    
    .main -left price-jpy{
    background : beige;
    }

#h2{
font-size: 3rem;
}

.container {
	*zoom: 1;
	width: 1250px;
	margin: 0 auto;
	margin-left: 16.666667%;
}


table tr{
    background : beige;
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


.menu-icon, .price-icon, .tel-icon, .hours-icon, .location-icon, .plus, .minus {
width: 20px; 
height: 20px;
}


.contact_form-container {
	display: flex;
}

.listStyle{
list-style-position: inside;
}
.offset-lg-2 col-md-10 offset-md-1 {
	display: list-item;
}

button.btn1:hover {
	color: blue;
	background : beige;
	font: bold;
	font-size: 20px;
}
button.btn1{
	font: bold;
	font-size: 20px;
	margin-left : 40px 

}
 /*  list에서 바스켓으로 보내는 장치에 대한 css  */
.basketadd-container{
display:flex;
justify-content: space-between;
margin: 60px 50px 0 200px; 
width: 300px;
}
.basket_info1{
margin-top: 25

px; 
font-size: 16px; 

}



 /*  list에서 바스켓으로 보내는 장치에 대한 css  */

.container-menu {
   width : 1250px;
   margin: -16px 30% 30px 15%;
   background: beige;
}
.row-col5 {
display: flex;
border-style: double ;
}



.-item-left-col3of12 {
padding: 0 0 0 10px;
margin: 10px;
width: 280px;
}

.-item-right-col3of12 {
margin: 10px;
flex-direction: row;
width: 100px;

}


.-item-right-col6of12-in-vertical {
flex-wrap : wrap;
padding: 0 0 0 40px;
border-style:double;
border-right: 10px; 
border-top: 10px; 
border-bottom: 10px; 
width: 500px;

}
.-item-left-col9of16 {
padding-left: 10px; 
}

.-item-right-col3of16 {
padding-right: 20px; 
}

.row-wide-bottom {
display: flex;
justify-content:space-between;
}

button.basket{
 width: 100px;
 height: 60px;
  border-radius: 8px
 
}

.menu_count{
width: 70px;
 height: 30px;
 display: flex;
}


/*  바스켓설정   */
.basketList li {
box-sizing: border-box;
background-color: #fff;
	border-bottom: 1px solid #d8d8d8;
	float: left;
	display: table-row;
	width: 10%;
	height: auto;
	margin: 0;
	padding: 10px 30px ;
	border: 0;
	padding: 18px 0 15px;
	color: black;
	vertical-align: baseline;
	font-size: 24px;
	font-weight: bold;
	text-align: center;

}

button.clear{
margin: 45px 0 0 622px;
}

.menu_header{
padding-top: 10px;
}


.basket_con li{
float: left;

}
.basket_con{
margin: 20px 0 -50px;
border: 1px solid black;

width: auto;
height: 240px;
}
.basket_title{
width: 700px;
height: 200px;

}
.basket_list{
margin: 0;
padding: 0;
}
.add_info_menu button:hover{
background: black;
}

.minus_btn{
width: 30px;
height: 30px;
background-image:url("./img/minus.png") ;

}
.plus_btn{
width: 30px;
height: 30px;
background-image:url("./img/plus.png") ;
}
.little_price{
display: flex;
}

input#sumPrice{
 margin: 0 0 0 50px;
 width: 150px; 
 
}


 /* 리스트 바스켓설정  */
.basket_list li{
padding: 5px 10px ;
background: beige;
border: 1px solid black; 
margin: 0;
}
li.basket_menu_name{
width: 390px;
}
li.basket_menu_price{
width: 200px;
}
li.basket_menu_amount{
width: 107px;
}
    /* 바스켓 안 리스트 설정  */
.basket_list2{
padding: 0;
margin: 0;
}
.basket_list2 li{
height: 50px;
border: 1px dotted black;
background: none;
}
li.basket_menu_nameli{
padding: 10px;
width: 390px;
}
li.basket_menu_priceli{
padding: 10px;
width: 200px;
}
li.basket_menu_amountli{
padding: 10px;
width: 84px;
}
.menu_sum{
margin-top: 10px;
}
input.sum_price{
width: 130px;
margin: 30px 0;

}


/*  바스켓설정   */

</style>

<script type="text/javascript">

function plusAmount(i) { 
	var amount = document.getElementById("menu_amount["+i+"]").value++;
	var price = document.getElementById("sum_price["+i+"]").value;
    document.getElementById("sum_price["+i+"]").value = price/amount*(amount+1); 
		
	}

function minusAmount(i) { 
	var amount = document.getElementById("menu_amount["+i+"]").value--;
	var price = document.getElementById("sum_price["+i+"]").value;
	if (amount < 2){
		alert("갯수는 1개 이상만 가능합니다.");
		document.getElementById("menu_amount["+i+"]").value = 1;
	}else {
		document.getElementById("sum_price["+i+"]").value = price/amount*(amount-1);
		
	}
	
}


</script>


<!--                 수정                              -->

</head>

<body class="sub_page">
    
     <!-- header   -->
	 <jsp:include page="../inc/header3.jsp" />
     <!-- header   -->
     
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
									href="./mainContent/index.html"> <span class="sr-only">(current)</span></a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="./mainContent/about.html"> </a></li>
								<li class="nav-item"><a class="nav-link"
									href="./mainContent/fruit.html"> </a></li>
								<li class="nav-item"><a class="nav-link"
									href="./mainContent/testimonial.html"></a></li>
								<li class="nav-item"><a class="nav-link"
									href="./mainContent/contact.html"></a></li>
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

											<li><span><img src="./img/house.png" class="location-icon"></span> 주소 : ${dto.addr } <br>
																												상세주소 : ${dto.addr_details }</li>
										</ul>
									</div>
									<form action="./ReservationAction.re" method="post" name="frm_rsrvAction">
										<input type="hidden" name="store_no" value="${dto.store_no }">
										<input type="hidden" name="menu_no">
										<input type="hidden" name="menu_amount" >
										<input type="hidden" name="price">
									</form>
									<div>
									  	<button class="btn1" onclick="sendRequest()">
											예약하기
										</button>
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
		<!-- 장바구니 구현 -->
		<div class="basket_list_con">
		<div class="container">
		<div class="basket_title">
		<div class="basket_con">
		<ul class="basket_list">
		<li class="basket_menu_name"> 메뉴명 </li> 
		<li class="basket_menu_price"> 가격 </li> 
		<li class="basket_menu_amount"> 갯수 </li> 
		</ul>
		<form style="background: white;" action="./ReservationAction.re">
		<div style="overflow:auto; width:700px; height:200px;">
		<ul class="basket_list2">
		</ul>
        </div>
		</form>
		</div>
		</div>
		<div class="little_price">
		<button class="clear" onclick="clearMap()">전체삭제</button>
		<h3 style="margin: 10px 0 0 20px;"> = </h3>
		<input id="sumPrice" type="text"  readonly/>
		</div>
		</div>
		</div>
		
		
		
		<!-- 장바구니 구현 -->
	</section>
	<!-- end contact section -->

	<!--   중간 머릿말   -->
	<div class="global-navigation">
		<div class="container">
			<ul class="listStyle">
				<li ><a href="./StoreInfo.st?store_no=${dto.store_no}">가게상세정보</a></li>
				<li class="-current"><a href="./StoreMenu.nu?store_no=${dto.store_no}">메뉴</a></li>
				<li ><a href="./StoreImg.st?store_no=${dto.store_no}">사진</a></li>
				<li ><a href="./ReviewList.rv?store_no=${dto.store_no}">리뷰</a></li>


			</ul>
		</div>
	</div>

	<!--   중간 머릿말   -->

	<!-- 내용넣기 시작  -->
	<br>
	<br>
	<br>
	<br>
		
	<div class="main -left price-jpy">
	<div class="container-menu">
		<h2 class="menu_header">추천 메뉴</h2>
	    <c:forEach var="i" begin="0" end="${menuList.size()-1}" step="1">
			<div class="row-col5">
				<div class="-item-left-col3of12">
					<div class="figure -fit-220">
						<a
							href="./images/${menuList[i].menu_img }"
							class="cboxElement"> <img
							src="./images/${menuList[i].menu_img }"
							width="220" alt="" title="${i+1}"> <span
							class="-closeup"></span>
						</a>
					</div>
				</div>
				<div class="-item-right-col6of12-in-vertical">

					<div class="row">
						<div class="-item-right-col8of16">
							<div class="right-spacing">
								<div class="spacing">
									<div class="small">${i+1}</div>

									<h3 class="huge abit-spacing">${menuList[i].menu_name}</h3>

								</div>
								<div class="cx">
									<div class="label -gold spacing right-spacing">추천 메뉴</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row-wide-bottom">
						<div class="-item-left-col3of12">
							<div class="panel-light-silver -in">
								<ul class="spacing-list small">
									<li><b class="b">메뉴정보 : </b><br> ${menuList[i].menu_info}</li>
								</ul> 
							</div>
						</div>
					
						<div class="-item-right-col3of12">
							<div class="right-spacing">
								<ul class="menu-like-listsmall">
									<li><span class="-value"> ${menuList[i].price}원 </span></li>
								</ul>
								<p class="text-right small">세금 포함</p>
							</div>
						</div>
					</div>
				</div>
				<div class="basketadd-container">
				<div class="add_info_menu">
		       			 <div style="display:flex;vertical-align:top;">
			      	 		 <input type="button" class="plus_btn" onclick="plusAmount(${i})">
			      	 		 <input type="number" id="menu_amount[${i}]" value="1" class="menu_count" maxlength="10" min="1" readonly/>
			      	 		 <input type="button" class="minus_btn"  onclick="minusAmount(${i})">
        				</div>
        				<div class="basket_info1"> 
        				<input class="sum_price" type="text" id="sum_price[${i}]" value="${menuList[i].price}" readonly/>
        				</div>
    			</div>
				
				
				<div>
				<input type="hidden" id="menu_name[${i}]" value="${menuList[i].menu_name}">
				<button class="basket" onclick="getMenu_amount(${menuList[i].menu_no}, ${i});" >
				장바구니에 담기</button>
				</div>
				</div>
				</div>
	         </c:forEach>

		         <script type="text/javascript">
       				let map = new Map();
	        		
       				function getMenu_amount(menu_no, i) { 
	        			
	        			var amount = document.getElementById("menu_amount["+i+"]").value; 
	        			var price = document.getElementById("sum_price["+i+"]").value;
	        			var name = document.getElementById("menu_name["+i+"]").value;
	        			
	        			if (amount < 1){ 
	        				alert("갯수는 1개 이상만 가능합니다."); 
	        				document.getElementById("menu_amount["+i+"]").value = 1; 
	        			}else if(amount >100){ 
	        				alert("장난치지마십쇼!!");
	        				document.getElementById("menu_amount["+i+"]").value = 1; 
	        			}else{
	        				let obj = new Object();
	        				obj.price = price;
	        				obj.name = name;
	        				obj.amount = amount;
	        				map.set(menu_no, obj);
	        				
	        				const iterator1 = map[Symbol.iterator]();

	        				let htmlTXT = "";
	        				var sumPrice = 0;
	        				for (const item of iterator1) {
	        					htmlTXT += "<li class='basket_menu_nameli'>"+item[1].name+"</li>"
	        							+ "<li class='basket_menu_priceli'>"+item[1].price+"</li>"
	        							+ "<li class='basket_menu_amountli'>"+item[1].amount+"</li>";
	        							sumPrice += Number(item[1].price);
	        				}
	        				document.getElementsByClassName("basket_list2")[0].innerHTML = htmlTXT;
	        				
	        				document.getElementById("sumPrice").value = sumPrice; 
	
	        			}
	        		 }
       				
       				function clearMap(){
       					map = new Map();
       					document.getElementsByClassName("basket_list2")[0].innerHTML = "";
       					document.getElementById("sumPrice").value = "";
       				}
       				
       				function sendRequest() {
       					const iterator1 = map[Symbol.iterator]();

       					let menu_no = "";
       					let price = 0;
       					let menu_amount = "";
        				for (const item of iterator1) {
        					menu_no += item[1].name + ",";
        					menu_amount += item[1].amount + ",";
        				}
        				document.getElementsByName("menu_no")[0].value = menu_no;
        				document.getElementsByName("menu_amount")[0].value = menu_amount;
        				document.getElementsByName("price")[0].value = document.getElementById("sumPrice").value;
        				
        				document.frm_rsrvAction.submit();
       				}
       				
       				
 				</script>

		<div class="cassette triple-spacing">
			<div class="row-col5">
				<div class="-item-left-col9of16">
					<p class="small">*여기에는 대표적인 식자재만을 한정해 기재하고 있으며, 그 밖의 재료가 사용되는
						경우도 있습니다.또한 시기적 요인과 식자재 입하 상황에 따라 메뉴와 요리 종류가 변경될 수 있으므로 양해해 주시기
						바랍니다.</p>
					<p class="small">*사진은 샘플입니다.</p>
					<p class="small">*실제 표시된 가격과 다른 경우가 있습니다.</p>
				</div>
				<div class="-item-right-col3of16">
					<p class="text-right small">* 금액은 한국 원 (\)</p>
				</div>
			</div>
		</div>
			</div>
		</div>

	


	<!-- 내용넣기 끝  -->


	<!-- footer section -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer section -->


	<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap.js"></script>
	<script type="text/javascript" src="./js/custom.js"></script>

</body>

</html>
