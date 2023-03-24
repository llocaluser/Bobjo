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


</style>


<!--                 수정                              -->

</head>

<body class="sub_page">
  <div class="hero_area">
    <!-- header section strats -->
    <div class="brand_box">
      <a class="navbar-brand" href="${root }/Main.me">
        <span>
          BOBJO
        </span>
      </a>
    </div>
    <!-- end header section -->
  </div>

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
  </body>

</html>