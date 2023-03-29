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

<body sytle="position: relative;
    z-index: -1;">
    <div class="tm-page-wrap mx-auto mainbody" sytle="position: relative;
    z-index: -1;">
    
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
                        <span>지금 바로 예약하세요!</span>
                    </a>
                    
                </div>
            </div>
		  	<c:set var="currentVideo"><%= "cook" + (int)Math.ceil(Math.random()*6) %></c:set>
			<div id="tm-video-container" style="background-color:white;">
			    <video autoplay muted loop id="tm-video">
			        <source id="video-source" src="./video/${currentVideo}.mp4" type="video/mp4">
			    </video>
			</div>
        </div>
    </div>    
    
    		<script src="js/jquery-3.4.1.min.js"></script>
    		<script src="js/bootstrap.min.js"></script>
			<!-- 배경영상 랜덤재생 -->
			<script type="text/javascript">
			    var video = document.getElementById('tm-video');
			    var source = document.getElementById('video-source');
			    var currentVideo = "${currentVideo}";
			    var timer;
			    var randomCheck = "cook1";
			    
			
			    function playNextVideo() {
			    	
			        clearInterval(timer);
			        while(randomCheck == currentVideo){
			        	randomCheck = "cook" + Math.ceil(Math.random()*6);
			    	}
			    	currentVideo = randomCheck;
			    	source.setAttribute('src', './video/' + currentVideo + '.mp4');
			    	video.load();
			    	video.play();
			    	timer = setInterval(playNextVideo, 30000);
			    }
			    
			    
			    timer = setInterval(playNextVideo, 30000);
			
				video.addEventListener('ended', function() {
			    	clearInterval(timer);
			    	source.setAttribute('src', './video/' + currentVideo + '.mp4');
			    	video.load();
			    	timer = setInterval(playNextVideo, 30000);
			    	video.play();
				}, false);
			</script>
			<!-- 배경영상 랜덤재생 -->
     
        
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
			<!-- 가게 이름 -->
			<!-- 찾기 -->
			<svg onclick="searchStore();" id="move-btn" width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M15.853 16.56c-1.683 1.517-3.911 2.44-6.353 2.44-5.243 0-9.5-4.257-9.5-9.5s4.257-9.5 9.5-9.5 9.5 4.257 9.5 9.5c0 2.442-.923 4.67-2.44 6.353l7.44 7.44-.707.707-7.44-7.44zm-6.353-15.56c4.691 0 8.5 3.809 8.5 8.5s-3.809 8.5-8.5 8.5-8.5-3.809-8.5-8.5 3.809-8.5 8.5-8.5z"/>
			<!-- 찾기 -->
			
			</svg>
			</form>
			</div>
			<!-- 닫기 버튼 -->
			<?xml version="1.0" ?>
			<!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>
			<svg height="512px" id="close-btn" style="enable-background:new 0 0 512 512;" version="1.1" viewBox="0 0 512 512" width="512px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
			<path d="M443.6,387.1L312.4,255.4l131.5-130c5.4-5.4,5.4-14.2,0-19.6l-37.4-37.6c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4  L256,197.8L124.9,68.3c-2.6-2.6-6.1-4-9.8-4c-3.7,0-7.2,1.5-9.8,4L68,105.9c-5.4,5.4-5.4,14.2,0,19.6l131.5,130L68.4,387.1  c-2.6,2.6-4.1,6.1-4.1,9.8c0,3.7,1.4,7.2,4.1,9.8l37.4,37.6c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1L256,313.1l130.7,131.1  c2.7,2.7,6.2,4.1,9.8,4.1c3.5,0,7.1-1.3,9.8-4.1l37.4-37.6c2.6-2.6,4.1-6.1,4.1-9.8C447.7,393.2,446.2,389.7,443.6,387.1z"/></svg>
			<!-- 닫기 버튼 -->
		</div>
	</div>

	
	

	
	
	
	<!-- 모달창 -->
                    
	<script type="text/javascript">
		
		const bg = document.querySelector('.search_back');
		const sc = document.querySelector('.search');
		const close = document.querySelector('#close-btn');
		const btn = document.querySelector('#modal_btn');
		
		btn.addEventListener('click', openModal);
		close.addEventListener('click', closeModal);
		
		document.addEventListener('click', (event) => {
			
			if(bg.style.display == 'flex'){
				bg.addEventListener('click', function(e){
					if(e.target != bg) return false;
					else closeModal();
				});
			}
		});
		
		function openModal(){
			bg.style.display = 'flex';
			btn.style.display = 'none';
		}
		
		function closeModal(){
			bg.style.display = 'none';
			btn.style.display = 'inline-flex';
		}
	
	</script>
<!-- 모달창 -->



<!-- 지역 이동 -->
<div id="map">
	<img id="back-arrow" src="./img/back-arrow.png">
    <script src="./file/TL_SCCO_SIG.json"></script>
    <object id="seoul" type="image/svg+xml" data="./file/SEOUL_SIG.jsp" 
    style="width: 840px; height: 700px;"></object>
    
</div>







<!-- 지역 이동 -->
<script type="text/javascript">

const move = document.querySelector('#map-search');
const category = document.querySelector('#menu-category');
const name = document.querySelector('#store-name');	
const map = document.querySelector('#map');
const elementsToHide = document.querySelectorAll(":not(#map)");
const seoul = document.querySelector('#seoul');
const goback = document.querySelector('#back-arrow');
const SD = document.querySelector('svg');
const changeText = document.getElementById('map-district');




move.addEventListener('click', openMapSearch);

goback.addEventListener('click', closeMapSearch);

seoul.addEventListener("wheel", function(event) {
	if (move.classList.contains("active")) {
		event.preventDefault();
	}
});


var prevDisVal = '';


window.addEventListener('message', function(event) {
	prevDisVal = '';
	
  	prevDisVal = event.data.disVal;
	if(prevDisVal.length < 10 && prevDisVal != '' && prevDisVal != ' '){
		closeMapSearch();
		changeText.textContent = prevDisVal;
	}else if(prevDisVal.length >= 270){
		closeMapSearch();
		changeText.textContent = '지역 검색창 (누르면 이동)';
	}
});






function closeMapSearch(){
	map.style.display = 'none';
	document.documentElement.classList.remove("no-scroll");
}

function openMapSearch(){
	map.style.display = 'inline-flex';
	document.documentElement.classList.add("no-scroll");
}



function searchStore(){
	var srch_location = move.textContent.trim();
	var srch_category = category.value;
	var srch_text = name.value;
	
	if(srch_location == "지역 검색창 (누르면 이동)") srch_location = "";
	if(srch_category == "카테고리") srch_category = "";
	
	var url = "./StoreList.st?" +
    "srch_location=" + encodeURIComponent(srch_location) +
    "&srch_category=" + encodeURIComponent(srch_category) +
    "&srch_text=" + encodeURIComponent(srch_text);
	location.href = url;
}



</script>

<!-- 지역 이동 -->





        <div class="container-fluid" style="position:relative;z-index:-1;">
            <div id="content" class="mx-auto tm-content-container">
                <main>
                    <div class="row">
                        <div class="col-12" style="height:100px;">
                            <h2 class="tm-page-title mb-4">추천 식당</h2>
                            <div class="tm-categories-container mb-5">
                            </div>        
                        </div>
                    </div>
                    
                    <div id="rec-container">
                    	<div id="rec-wrapper" class="row tm-catalog-item-list animated">
                    <c:forEach var="i" items="${storeList }">
                        <div id="rec-store" class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
                     
                            <div id="store_mainimg" class="position-relative tm-thumbnail-container">
                            <img src="./images/${i.store_img }" 
                            onError="this.onerror=null; this.src='img/res_img/restaurant0.jpg'" class="img-fluid tm-catalog-item-img" id="rec_storeImg">    
                            <a href="./StoreInfo.st?store_no=${i.store_no }" class="position-absolute tm-img-overlay">
                                <!-- <i class="fas fa-play tm-overlay-icon"></i> -->
                            </a>
                            </div>    
                            <div class="p-4 tm-bg-gray tm-catalog-item-description">
                            	<a href="./StoreInfo.st?store_no=${i.store_no }">
                                <h3 class="tm-text-primary mb-3 tm-catalog-item-title">${i.store_name }</h3>
                                </a>
                                <p class="tm-catalog-item-text">${i.store_content }</p>
                            </div>
                            
                        </div>
                    </c:forEach>
                        </div>
                    </div>
				    <p class="controls">
				        <span id="btn-stopmove">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M11 22h-4v-20h4v20zm6-20h-4v20h4v-20z"/>
						</svg>
						</span>
				        <span id="btn-resumemove">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M3 22v-20l18 10-18 10z"/>
						</svg>
						</span>
				    </p>
                    
                    <script text="java/script">
                    	// 버튼 클릭 이동
	                    var wrapper = document.getElementById('rec-wrapper'),
	                    box = document.querySelectorAll('#rec-store'),
	                    currentIdx = 0,
	                    count = Math.min(box.length, 10)-3,
	                    width = 462,
	                    margin = 22,
	                    prevBtn = document.querySelector('.prev'),
	                    nextBtn = document.querySelector('.next');
                    	
                    	
	                    function moveSlide(num) {
	                        wrapper.style.left = -num * (width + margin) + 'px';
	                        currentIdx = num;
	                    } 
	                 	
	                 	var stopmovingBtn = document.querySelector('#btn-stopmove');
	                 	var resumemovingBtn = document.querySelector('#btn-resumemove');
	                 	
	                 	let timerId = null;
						let isPaused = false;
						
						function startSlideShow() {
						  	timerId = setInterval(() => {
						    	if (currentIdx === count) {
						      		currentIdx = 0;
						    	} else {
						      		currentIdx++;
						    	}
						    		moveSlide(currentIdx);
						  	}, 3000);
						}
						
						function stopSlideShow() {
						  	clearInterval(timerId);
						}
						
						function resumeSlideShow() {
						  	if (!isPaused) {
						    	startSlideShow();
						  	}
						}
						
						if(box.length <= 3){
							stopmovingBtn.style.display = 'none';
							resumemovingBtn.style.display = 'none';
						}
						
						stopmovingBtn.addEventListener('click', () => {
						  	stopSlideShow();
						  	isPaused = true;
						});
						
						resumemovingBtn.addEventListener('click', () => {
							isPaused = false;
							resumeSlideShow();
						});
						
						
						startSlideShow();
	                 	
	                 	
                    </script>

                </main>
			</div>
		</div>
	</div>

	

    <!-- <script src="js/jquery-3.4.1.min.js"></script> -->
    <!-- <script src="js/bootstrap.min.js"></script> -->
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

        })
    </script>
    
      <!-- footer -->
    
     	   <jsp:include page="../inc/footer.jsp" />
     	
      <!-- footer -->   
    

</body>

</html>