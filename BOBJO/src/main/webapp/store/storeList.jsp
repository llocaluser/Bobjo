<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>BOBJO</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="${root }/css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${root }/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="${root }/css/responsive.css" rel="stylesheet" />
  
  
  <!-- modal style -->
  <link rel="stylesheet" href="./css/modal.css">
  
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<%--   <script type="text/javascript" src="${root }/js/bootstrap.js"></script> --%>
  <script type="text/javascript" src="${root }/js/custom.js"></script>
 
 
 <style type="text/css">
 .box img {
 	width: 100%;
 	height: 400px;
 }
 .container-fluid {
 	width: 80%;
 	margin: auto;
 }
 

 
 </style>
</head>

    <!-- header section strats -->

      <jsp:include page="../inc/header3.jsp" />
    <!-- end header section -->

  <!-- nav section -->

  <section class="nav_section">
    <div class="container">
      <div class="custom_nav2">
        <nav class="navbar navbar-expand custom_nav-container " 
        style="z-index:999;">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex  flex-column flex-lg-row align-items-center">
              <form action="./StoreList.st" method="post" class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0" name="srch_frm">
              <input type="hidden" name="srch_location" value="${srch_location }">
              <input type="hidden" name="srch_category" value="${srch_category }"> 
              <ul class="navbar-nav  ">
                <li class="nav-item active"
                	style="display: flex;
    					align-items: center;">
                <!-- 원본 -->
                  <!-- <a class="nav-link" onclick="openLocation();">지역 <span class="sr-only">(current)</span></a> -->
                <!-- 원본 -->
                
                
                
                <span id="map-search" 
                	style="display: inline-flex;
						    cursor: pointer;
						    align-items: center;
						    border: none;
						    width: auto;">
					<div id="map-district" 
						style="color:white;">
						지역 <span class="sr-only">(current)</span>
					</div>
				</span>
                
                  
                  
                  
                </li>
                <li class="nav-item"
                	style="display: flex;
    					align-items: center;
    					margin: 6px 20px 6px 20px;
    					height: 30px;">
                <!-- 원본 -->
                  <!-- <a class="nav-link" onclick="openCategory();">카테고리 </a> -->
                <!-- 원본 -->
                  



				<select id="menu-category"
						style="padding:0px;
								height: 30px;
								border: none;
								background-color: #252525;
								color: white;
								text-align: center;">
					<option value="" selected hidden>카테고리</option>
					<option value="한식">한식</option>
					<option value="일식">일식</option>
					<option value="중식">중식</option>
					<option value="양식">양식</option>
					<option value="기타">기타</option>
				</select>



                  
                </li>
                <li class="nav-item" 
                style="align-items: center;
    					display: flex;">
                 <input type="text" name="srch_text" value="${srch_text }">
                </li>
                <li class="nav-item"
                style="display: flex;
    					align-items: center;">
                  <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"
                  style="margin-left:0;"></button>
                </li>
                <li class="nav-item" 
                style="align-items: center;
    					display: flex;
    					margin-right: 20px;">
                 <input type="button" value="검색 조건 초기화" onclick="resetValue();">
                </li>
                <li class="nav-item" 
                style="align-items: center;
    					display: flex;">
                 <select name="order_standard" onchange="srch_frm.submit();">
                 	<option value="">정렬</option>
                 	<option value="score" <c:if test='${order_standard eq "score" }' >selected</c:if>>별점 높은 순</option>
                 	<option value="cnt" <c:if test='${order_standard eq "cnt" }' >selected</c:if>>방문자 많은 순</option>
<%--                  	<option value="2" <c:if test='${order_standard == 2 }' >selected</c:if>>가까운 거리 순</option> --%>
                 </select>
                </li>
              </ul>
              </form>
				<script type="text/javascript">
					function openLocation() {    
						window.open("${root }/popuppage/store_search_location.jsp", "search_location", "width=570, height=350, resizable = no, scrollbars = no, location = no");
					}
					function openCategory() {    
						window.open("${root }/popuppage/store_search_category.jsp", "search_location", "width=570, height=350, resizable = no, scrollbars = no, location = no");
					}
					function resetValue() {
						document.getElementsByName("srch_location")[0].value = "";
						document.getElementsByName("srch_category")[0].value = "";
						document.getElementsByName("srch_text")[0].value = "";
						document.getElementsByName("order_standard")[0][0].selected = true;
					}
				</script>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </section>

  <!-- end nav section -->

	<img id="gotoTop" src="./img/up-arrow.png">




	<!-- MODAL -->
	
	
	<div id="map">
		<img id="back-arrow" src="./img/back-arrow.png">
	    <script src="./file/TL_SCCO_SIG.json"></script>
	    <object id="seoul" type="image/svg+xml" data="./file/SEOUL_SIG.jsp" 
	    style="width: 840px; height: 700px;"></object>
	    
	</div>

	<!-- MODAL -->
	
	

	<!-- modal 스크립트 -->

	<script type="text/javascript">
	
	const map = document.querySelector('#map');
	const move = document.querySelector('#map-search');
	const goback = document.querySelector('#back-arrow');
	const changeText = document.getElementById('map-district');
	const category = document.querySelector('#menu-category');
	const gotoTop = document.getElementById("gotoTop");
	
	var input_location = document.querySelector('input[name="srch_location"]');
	
	
	$('#menu-category').on('change', function() {
		$('input[name="srch_category"]').val($(this).val());
	});
	
	
	move.addEventListener('click', openMapSearch);
	goback.addEventListener('click', closeMapSearch);
	
	var prevDisVal = '';


	
	gotoTop.addEventListener("click", () => {
		window.scrollTo(0,0);
	});
	
	
	window.addEventListener('message', function(event) {
		prevDisVal = '';
		
	  	prevDisVal = event.data.disVal;
		if(prevDisVal.length < 10 && prevDisVal != '' && prevDisVal != ' '){
			closeMapSearch();
			changeText.textContent = "지역 : " + prevDisVal;
			input_location.value = prevDisVal;
		}
	});
	
	function openMapSearch(){
		map.style.display = 'inline-flex';
		document.documentElement.classList.add("no-scroll");
	}
	
	function closeMapSearch(){
		map.style.display = 'none';
		document.documentElement.classList.remove("no-scroll");
	}
	
	
	
	</script>

	<!-- modal 스크립트 -->




  <!-- list section -->

  <section class="fruit_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <hr>
        <h2>
          store list
        </h2>
      </div>
    </div>
    <div class="container-fluid">

      <div class="fruit_container">
      <c:forEach var="dto" items="${list }">
      	<div class="box">
          <img src="${root }/images/${dto.store_img }" onerror="this.onerror=null; this.src='${root }/images/no_img.PNG';">
          <div class="link_box">
            <h5>
              ${dto.store_name }
            </h5>
            <h6>
              ★ ${dto.score }
            </h6>
            <h6>
              ${dto.store_category }
            </h6>
            <h6>
              ${dto.addr }
            </h6>
            <a href="./StoreInfo.st?store_no=${dto.store_no }">
              상세 정보
            </a>
          </div>
        </div>
      </c:forEach>
  
      </div>
      <div class="fruit_container_end"></div>
    </div>
    
    
  </section>

  <!-- end list section -->

  <!-- infinite scroll -->
  <script type="text/javascript">
  	let pageNum = 1;
  	let hasNext = pageNum < ${totalPage};
  	
  	// 스크롤 페이징
	function infiniteScroll () {
		const pagination = document.querySelector('.fruit_container_end'); // 리스트 엔드 포인트
		const fullContent = document.querySelector('.fruit_container'); // 리스트 컨테이너
		const screenHeight = screen.height; // 화면 크기
		
		document.addEventListener('scroll',OnScroll,{passive:true}) // 스크롤 이벤트 리스너
		function OnScroll () { //스크롤 이벤트 함수
			const fullHeight = fullContent.clientHeight; //  리스트 컨테이너 높이   
			const scrollPosition = pageYOffset; // 현재 스크롤 위치
			if (hasNext && fullHeight-screenHeight/2 <= scrollPosition) {
				hasNext = false;
				getList(); // 리스트 추가하는 함수
			}
			
			// 부활한 버튼
			if(pageYOffset >= 1200){
				gotoTop.style.display = "block";
			}else{
				gotoTop.style.display = "none";
			}
			
		}
	}
	infiniteScroll();
	// 스크롤 페이징
	
	// 리스트 추가로 가져오기
	function getList() {
		$.ajax({
			url:"./StoreListAjax.st",
			type:"post",
			data:{
				pageNum:++pageNum,
				srch_location:$("input[name=srch_location]").val(),
				srch_category:$("input[name=srch_category]").val(),
				srch_text:$("input[name=srch_text]").val(),
				order_standard:$("select[name=order_standard]").val()
				},
			success:function(data) {
				$('.fruit_container').append(data);
			},
			error:function(data){
				console.log(data);
				console.log("ajax err");
			}
		});
		
		hasNext = pageNum < ${totalPage};
	}
	// 리스트 추가로 가져오기

  </script>
  <!-- infinite scroll -->


  <!-- info section -->

 <%--  <section class="info_section layout_padding">
    <div class="container">
      <div class="info_logo">
        <h2>
          BOBJO
        </h2>
      </div>
      <div class="info_contact">
        <div class="row">
          <div class="col-md-4">
            <a href="">
              <img src="${root }/images/location.png" alt="">
              <span>
                Passages of Lorem Ipsum available
              </span>
            </a>
          </div>
          <div class="col-md-4">
            <a href="">
              <img src="${root }/images/call.png" alt="">
              <span>
                Call : +012334567890
              </span>
            </a>
          </div>
          <div class="col-md-4">
            <a href="">
              <img src="${root }/images/mail.png" alt="">
              <span>
                demo@gmail.com
              </span>
            </a>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-lg-9">
          <div class="info_form">
            <form action="">
              <input type="text" placeholder="Enter your email">
              <button>
                subscribe
              </button>
            </form>
          </div>
        </div>
        <div class="col-md-4 col-lg-3">
          <div class="info_social">
            <div>
              <a href="">
                <img src="${root }/images/facebook-logo-button.png" alt="">
              </a>
            </div>
            <div>
              <a href="">
                <img src="${root }/images/twitter-logo-button.png" alt="">
              </a>
            </div>
            <div>
              <a href="">
                <img src="${root }/images/linkedin.png" alt="">
              </a>
            </div>
            <div>
              <a href="">
                <img src="${root }/images/instagram.png" alt="">
              </a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section> --%>
  <jsp:include page="../inc/footer.jsp" />
  <!-- end info section -->


  <!-- footer section -->
  <section class="container-fluid footer_section">
    <p>
      &copy; <span id="displayYear"></span> All Rights Reserved By
      <a href="https://html.design/">Free Html Templates</a>
    </p>
  </section>
  <!-- footer section -->



</body>

</html>