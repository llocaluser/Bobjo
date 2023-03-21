<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
    <title>SulJo</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="./css/bootstrap.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
     

    <title>BOBJO</title>
    <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <!-- https://fonts.google.com/ -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/templatemo-video-catalog.css">
    <link rel="stylesheet" href="./css/mainpage.css">
    <link rel="stylesheet" href="./css/modal.css">
    
    
    <!-- Custom styles for this template -->
  <link href="./css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="./css/responsive.css" rel="stylesheet" />
    
<!--

TemplateMo 552 Video Catalog

https://templatemo.com/tm-552-video-catalog

-->


<!-- 지형지도 -->
<script src="https://d3js.org/d3.v5.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .seoul-district {
            fill: #ccc;
            stroke: #333;
            stroke-width: 1;
        }

.seoul-district {
  fill: #ddd;
  stroke: #fff;
  stroke-width: 1px;
}
        
    </style>
<!-- 지형지도 -->
    
    
    
</head>

<body>
    <div class="tm-page-wrap mx-auto mainbody">
    
    	<!-- 헤더 -->
    
     	<jsp:include page="../inc/header.jsp" />
     	
     	<!-- 헤더 -->
     	

    <div class="tm-page-wrap mx-auto">
        <div class="position-relative">
            <div class="position-absolute tm-site-header">
                <div class="container-fluid position-relative">
                    <div class="row">

                        <div class="col-5 col-md-8 ml-auto mr-0">
                        
                        </div>
                    </div>
                </div>
            </div>
            <div class="tm-welcome-container text-center text-white">
                <div class="tm-welcome-container-inner">
                    <p class="tm-welcome-text mb-1 text-white">
						<!-- 검색창 구현부 -->
					</p><br>
                    <a href="#" class="btn tm-btn-animate tm-btn-cta tm-icon-down" id="modal_btn">
                        <span>Search</span>
                    </a>
                    
                    
                </div>
            </div>
		  	<c:set var="ran"><%= (int)Math.ceil(Math.random()*6) %></c:set>
            <div id="tm-video-container" style="background-color:white;">
                <video autoplay muted loop id="tm-video">
                    <!-- <source src="video/sunset-timelapse-video.mp4" type="video/mp4"> -->
                        <source src="./video/cook${ran }.mp4" type="video/mp4">
                </video>    
            </div>
            
            <i id="tm-video-control-button" class="fas fa-pause"></i>
        </div>
        
        
        
    <!-- 모달창 -->
	
	<div class="search_back">
		<div class="search">
			<div class="search_box">
			<span id="modal-title">나만의 가게를 찾아 지금 예약하세요</span>
			<form onsubmit="searchStore();">
			<!-- 지역 검색 -->
			<img id="img-gps" src="./img/map.png" alt="gps">
			<span id="map-search">
				<div id="map-district" style="margin-left:50px;">지역 검색창 (누르면 이동)</div>
			</span>
			<!-- 지역 검색 -->
			<!-- 음식 카테고리 -->
			<svg id="svg-category" width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M19.188 0c-1.557 0-3.858 7.004-4.66 14h2.467v8.5c0 .931.785 1.5 1.5 1.5h.001c.828 0 1.5-.672 1.5-1.5.002-5.037.009-20.254-.001-21.649-.003-.494-.36-.851-.807-.851m-.191 1.333l-.001 21.167c0 .276-.225.5-.501.5-.157 0-.5-.126-.5-.5v-9.498h-2.334c.8-5.889 2.397-10.348 3.336-11.669m-8.443-1.333h-.887l.675 6.002-1.341-.002-.003-6h-1l.001 6h-1.003l.002-6h-1l-.005 6h-1.291l.597-5.998-.909-.002s-.611 5.038-.863 7.575c-.088.889.391 1.762 1.09 2.322.943.756 1.383.982 1.383 1.673v10.93c0 .828.666 1.5 1.497 1.5.832 0 1.504-.672 1.504-1.5v-10.925c0-.702.433-.918 1.382-1.669.713-.564 1.22-1.454 1.121-2.356-.275-2.545-.95-7.55-.95-7.55m-.117 7c.076.658.27 1.375-.674 2.122-.95.753-1.762 1.216-1.762 2.453v10.925c0 .276-.226.5-.504.5-.279 0-.497-.224-.497-.5v-10.93c0-1.222-.819-1.699-1.757-2.453-.911-.73-.719-1.475-.652-2.117h5.846z" fill="#030405"/>
			</svg>
			<select id="menu-category">
				<option value="카테고리" selected hidden>카테고리</option>
				<option value="한식">한식</option>
				<option value="일식">일식</option>
				<option value="중식">중식</option>
				<option value="양식">양식</option>
				<option value="기타">기타</option>
			</select>
			<!-- 음식 카테고리 -->
			
			
			<!-- 가게 이름 -->
			<input id="store-name" type="text" placeholder="가게 이름">
			<svg onclick="searchStore();" id="move-btn" width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M15.853 16.56c-1.683 1.517-3.911 2.44-6.353 2.44-5.243 0-9.5-4.257-9.5-9.5s4.257-9.5 9.5-9.5 9.5 4.257 9.5 9.5c0 2.442-.923 4.67-2.44 6.353l7.44 7.44-.707.707-7.44-7.44zm-6.353-15.56c4.691 0 8.5 3.809 8.5 8.5s-3.809 8.5-8.5 8.5-8.5-3.809-8.5-8.5 3.809-8.5 8.5-8.5z"/>
			
			</svg>
			<!-- 가게 이름 -->
			<!-- <button>찾기</button> -->
			</form>
			</div>
			<?xml version="1.0" ?>
			<!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>
			<svg height="512px" id="close-btn" style="enable-background:new 0 0 512 512;" version="1.1" viewBox="0 0 512 512" width="512px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
			<path d="M443.6,387.1L312.4,255.4l131.5-130c5.4-5.4,5.4-14.2,0-19.6l-37.4-37.6c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4  L256,197.8L124.9,68.3c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4L68,105.9c-5.4,5.4-5.4,14.2,0,19.6l131.5,130L68.4,387.1  c-2.6,2.6-4.1,6.1-4.1,9.8c0,3.7,1.4,7.2,4.1,9.8l37.4,37.6c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1L256,313.1l130.7,131.1  c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1l37.4-37.6c2.6-2.6,4.1-6.1,4.1-9.8C447.7,393.2,446.2,389.7,443.6,387.1z"/></svg>
		</div>
	</div>
	
	
	
	
	<!-- API Test Code -->
	
<!-- Add a div to hold the map -->
<!-- <div id="map"></div> -->

<!-- Add a div to hold the static map image -->
<!-- <div id="static-map"></div>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=z0ZtWBY91E7ZvPB33PLtbQrOOngArUAmKIiHN9aN"></script>
<script type="text/javascript">
  // Create a map object with the desired location and zoom level
  var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.5665, 126.9780),
    zoom: 12
  });

  // Get the bounding box of the map
  var bounds = map.getBounds();

  // Generate a static map image with administrative boundaries
  var staticMapUrl = 'https://navermaps.github.io/maps.js/docs/img/example/staticmap/staticmap_boundary.png?' +
                     'w=800&h=600&bounds=' + bounds.toString();

  // Set the static map image as the background of the static map div
  var staticMapDiv = document.getElementById('static-map');
  staticMapDiv.style.backgroundImage = 'url(' + staticMapUrl + ')';
</script> -->

	
	<!-- API Test Code -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 모달창 -->
                    
	<script type="text/javascript">
		
	/* 모달창 */
		const bg = document.querySelector('.search_back');
		const sc = document.querySelector('.search');
		const close = document.querySelector('#close-btn');
		const btn = document.querySelector('#modal_btn');
		const icon = document.querySelector('#tm-video-control-button');
		
		btn.addEventListener('click', openModal);
		close.addEventListener('click', closeModal);
		
		document.addEventListener('click', (event) => {
			//console.log(event.target);
			if(bg.style.display == 'flex'){
				bg.addEventListener('click', function(e){
					if(e.target != bg) return false;
					else closeModal();
				});
			}
		});
		
		function openModal(){
			bg.style.display = 'flex';
			icon.style.display = 'none';
			btn.style.display = 'none';
		}
		
		function closeModal(){
			bg.style.display = 'none';
			icon.style.display = 'block';
			btn.style.display = 'inline-flex';
		}
		
	/* 모달창 */
		
		
	
	</script>
        



<!-- 지역 이동 -->
<div id="map">
	<img id="back-arrow" src="./img/back-arrow.png">
    <script src="./file/TL_SCCO_SIG.json"></script>
    <object id="seoul" type="image/svg+xml" data="./file/SEOUL_SIG.jsp" 
    style="width: 840px; height: 700px;"></object>
    
</div>



<!-- 팝업 -->

<!-- <div id="map1">
	<img id="back-arrow" src="./img/back-arrow.png">
    <script src="./file/TL_SCCO_SIG.json"></script>
    <object id="seoul" type="image/svg+xml" data="./file/SEOUL_SIG.jsp" 
    style="width: 840px; height: 700px;"></object>
    
</div> -->

<!-- 팝업 -->



<!-- <script>
    // Wait for SVG to load before proceeding
    document.getElementById("seoul").addEventListener("load", function () {
        let svgDoc = document.getElementById("seoul").contentDocument;
        let pathElements = svgDoc.getElementsByTagName("path");

        // Load the JSON file and process it
        d3.json("TL_SCCO_SIG.json").then(function (json) {
            let seoulDistricts = [];

            // Find the Seoul districts in the JSON file
            json.features.forEach(function (feature) {
                if (feature.properties.SIG_CD.startsWith("11")) {
                    seoulDistricts.push(feature);
                }
            });

            // Find the corresponding path element in the SVG file for each district
            seoulDistricts.forEach(function (feature) {
                let sigKorNm = feature.properties.SIG_KOR_NM;
                let sigCd = feature.properties.SIG_CD;
                let pathElement = Array.from(pathElements).find(function (element) {
                    return element.id === sigCd;
                });

                // Draw the district on the SVG map
                d3.select(pathElement)
                    .attr("class", "seoul-district")
                    .attr("data-name", sigKorNm);
            });
        });
    });
</script> -->




<script>

/* 지역 이동 */

const move = document.querySelector('#map-search');
const category = document.querySelector('#menu-category');
const name = document.querySelector('#store-name');	
const map = document.querySelector('#map');
const elementsToHide = document.querySelectorAll(":not(#map)");
const seoul = document.querySelector('#seoul');
const goback = document.querySelector('#back-arrow');
const SD = document.querySelector('svg');




move.addEventListener('click', openMapSearch);

goback.addEventListener('click', closeMapSearch);

seoul.addEventListener("wheel", function(event) {
	if (move.classList.contains("active")) {
		event.preventDefault();
	}
});


const paths = document.querySelectorAll('path');
const texts = document.querySelectorAll('text');


var disVal = '${ disVal} ';
var changeText = document.getElementById('map-district');
if(disVal.length < 10 && disVal != null){
	changeText.textContent = disVal;
}


function closeMapSearch(){
	map.style.display = 'none';
	document.documentElement.classList.remove("no-scroll");
}

function openMapSearch(){
	map.style.display = 'inline-flex';
	document.documentElement.classList.add("no-scroll");
}

function searchStore(){
	location.href="./StoreList.st?srch_location='+move.value+'srch_category='+category.value+'srch_text='+name.value'";
}



</script>

<!-- 지역 이동 -->





        <div class="container-fluid" style="position:relative;z-index:-1;">
            <div id="content" class="mx-auto tm-content-container">
                <main>
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-page-title mb-4">추천 식당</h2>
                            <div class="tm-categories-container mb-5">
                                <!-- <h3 class="tm-text-primary tm-categories-text">Categories:</h3>
                                <ul class="nav tm-category-list">
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link active">전체</a></li>
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">예약 순</a></li>
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Nature</a></li>
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Actions</a></li>
                                    <li class="nav-item tm-category-item"><a href="#" class="nav-link tm-category-link">Featured</a></li>
                                </ul> -->
                            </div>        
                        </div>
                    </div>
                    <%-- ${storeList } --%>
                    <div class="row tm-catalog-item-list">
                    <c:forEach var="i" items="${storeList }">
                        <div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                     
                            <div class="position-relative tm-thumbnail-container">
                                <img src="img/res_img/${i.store_img }" alt="Image" class="img-fluid tm-catalog-item-img">    
                                <a href="video-page.html" class="position-absolute tm-img-overlay">
                                    <i class="fas fa-play tm-overlay-icon"></i>
                                </a>
                            </div>    
                            <div class="p-4 tm-bg-gray tm-catalog-item-description">
                                <h3 class="tm-text-primary mb-3 tm-catalog-item-title">${i.store_name }</h3>
                                <p class="tm-catalog-item-text">${i.store_content }
                                    <!-- <span class="tm-text-secondary">소개</span> 
                                    문구 -->안녕</p>
                            </div>
                            
                        </div>
                    </c:forEach>
                        
                    </div>
                    
                    


                    <!-- Catalog Paging Buttons -->
                    <!-- <div>
                        <ul class="nav tm-paging-links">
                            <li class="nav-item active"><a href="#" class="nav-link tm-paging-link">1</a></li>
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">2</a></li>
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">3</a></li>
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">4</a></li>
                            <li class="nav-item"><a href="#" class="nav-link tm-paging-link">></a></li>
                        </ul>
                    </div> -->
                </main>
			</div>
		</div>
	</div>

	

    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        function setVideoSize() {
            const vidWidth = 1920;
            const vidHeight = 1080;
            let windowWidth = window.innerWidth;
            let newVidWidth = windowWidth;
            let newVidHeight = windowWidth * vidHeight / vidWidth;
            let marginLeft = 0;
            let marginTop = 0;

            if (newVidHeight < 500) {
                newVidHeight = 500;
                newVidWidth = newVidHeight * vidWidth / vidHeight;
            }

            if(newVidWidth > windowWidth) {
                marginLeft = -((newVidWidth - windowWidth) / 2);
            }

            if(newVidHeight > 720) {
                marginTop = -((newVidHeight - $('#tm-video-container').height()) / 2);
            }

            const tmVideo = $('#tm-video');

            tmVideo.css('width', newVidWidth);
            tmVideo.css('height', newVidHeight);
            tmVideo.css('margin-left', marginLeft);
            tmVideo.css('margin-top', marginTop);
        }

        $(document).ready(function () {
            /************** Video background *********/

            setVideoSize();

            // Set video background size based on window size
            let timeout;
            window.onresize = function () {
                clearTimeout(timeout);
                timeout = setTimeout(setVideoSize, 100);
            };

            // Play/Pause button for video background      
            const btn = $("#tm-video-control-button");

            btn.on("click", function (e) {
                const video = document.getElementById("tm-video");
                $(this).removeClass();

                if (video.paused) {
                    video.play();
                    $(this).addClass("fas fa-pause");
                } else {
                    video.pause();
                    $(this).addClass("fas fa-play");
                }
            });
        })
    </script>
    
    
    
    
    <div class="footer">
    <!-- info section -->

  <section class="info_section layout_padding" style="display:flex; padding:50px">
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
              <img src="./images/location.png" alt="">
              <span>
                Passages of Lorem Ipsum available
              </span>
            </a>
          </div>
          <div class="col-md-4">
            <a href="">
              <img src="./images/call.png" alt="">
              <span>
                Call : +012334567890
              </span>
            </a>
          </div>
          <div class="col-md-4">
            <a href="">
              <img src="./images/mail.png" alt="">
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
                <img src="./images/facebook-logo-button.png" alt="">
              </a>
            </div>
            <div>
              <a href="">
                <img src="./images/twitter-logo-button.png" alt="">
              </a>
            </div>
            <div>
              <a href="">
                <img src="./images/linkedin.png" alt="">
              </a>
            </div>
            <div>
              <a href="">
                <img src="./images/instagram.png" alt="">
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
					      &copy; <span id="displayYear"></span> All Rights Reserved By
					      <a href="https://html.design/">Free Html Templates</a>
					    </p>
					  </section>
					  <!-- footer section -->
					  </div>
</body>

</html>