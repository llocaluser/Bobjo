<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

    </style>
    <link rel="stylesheet" type="text/css" href="../samples/review.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function sortReview(){
			var sort = $("#selectbox option:selected").val();
			if(sort == high) location.href='review.jsp?sort=high';
			else if(sort == low) location.href='review.jsp?sort=low';
			else if(sort == recent) location.href='review.jsp?sort=recent';
			return;
		}
	</script>
</head>
<body>
<div class="sub_sector">
        <section class="sect">
            <header class="title">
                <div class="div_title">
                    <h2 class="font_head">리뷰 페이지</h2>
                </div>
            </header>
            <section class="sect left">
                <article class="review_section article_font">
                    <h3 class="font_head font_title">전체 평점 및 리뷰</h3>

                    <!-- 평균 평점 -->
                    <section class="score font_arr">
                    <!-- <img class="star" src="./img/star.png"> -->
                        <!-- <div class="div_star">
                            <div class="star">
                                <i class="star_icon">별</i>
                            </div>
                            <div class="star">
                                <i class="star_icon">별</i>
                            </div>
                            <div class="star">
                                <i class="star_icon">별</i>
                            </div>
                            <div class="star">
                                <i class="star_icon">별</i>
                            </div>
                            <div class="star">
                                <i class="star_icon">없</i>
                            </div>
                        </div> -->
                        <div class="score">평균 4.7점</div>
                        총 N명 참여
                    </section>
                    <p class="review_desc">설명</p>
                    <p class="review_desc2">허위 리뷰 처벌 조항</p>
                </article>
                <article class="score_section article_font">
                    <ol class="ol_graph">
                        <li class="li_graph">
                            <label class="label_score">5</label>
                            <meter class="meter_score">
                                <div class="div_score" style="width:${scoreList[5]*100}%"></div>
                            </meter>
                        </li>
                        <li class="li_graph">
                            <label class="label_score">4</label>
                            <meter class="meter_score">
                                <div class="div_score" style="width:${scoreList[4]*100}%"></div>
                            </meter>
                        </li>
                        <li class="li_graph">
                            <label class="label_score">3</label>
                            <meter class="meter_score">
                                <div class="div_score" style="width:${scoreList[3]*100}%"></div>
                            </meter>
                        </li>
                        <li class="li_graph">
                            <label class="label_score">2</label>
                            <meter class="meter_score">
                                <div class="div_score" style="width:${scoreList[2]*100}%"></div>
                            </meter>
                        </li>
                        <li class="li_graph">
                            <label class="label_score">1</label>
                            <meter class="meter_score">
                                <div class="div_score" style="width:${scoreList[1]*100}%"></div>
                            </meter>
                        </li>
                        <li class="li_graph">
                            <label class="label_score">0</label>
                            <meter class="meter_score">
                                <div class="div_score" style="width:${scoreList[0]*100}%"></div>
                            </meter>
                        </li>
                    </ol>
                </article>
            </section>
            <h3 class="h3_sort"></h3>
            <div class="div_sort1">
                <div class="div_sort2">
                    <select class="select_sort" id="selectbox" 
                    onchange="location.href='./ReviewList.rv?sort='+this.value">
                    
                    	<option value="none" selected disabled style="display:none">
                    	정렬 기준
                    	</option>
                        <option value="high">별점 높은 순</option>
                        <option value="low">별점 낮은 순</option>
                        <option value="recent">최신순</option>
                    </select>
                </div>
            </div><br>
            <!-- 리뷰내용 -->
            <c:forEach var="list" items="${ReviewList }">
            <ol class="reviewslist">
                <li class="reviewlist">
                    <!-- 사진, 이름 섹션 -->
                    <section class="section_profile">
                        <div class="div_img">
                            ${list.review_img }
                        </div>
                        <p class="desc font_arr">${list.m_id }</p>
                    </section>
                    <!-- 평점, 작성일자, 내용 섹션 -->
                    <section class="section_review">
                        <section class="section_review_head font_arr">
                        	<c:if test="${list.score eq 5.0 }">
                        		<img class="star" src="./img/star.png">
                        	</c:if>
                            <!-- <div class="div_star">
                                <div class="star">
                                    <i class="star_icon">별</i>
                                </div>
                                <div class="star">
                                    <i class="star_icon">별</i>
                                </div>
                                <div class="star">
                                    <i class="star_icon">별</i>
                                </div>
                                <div class="star">
                                    <i class="star_icon">반</i>
                                </div>
                                <div class="star">
                                    <i class="star_icon">없</i>
                                </div>
                            </div> -->
                            <p class="review_day">${list.reg_date }</p>
                        </section>
                        <div class="topmargin">
                            <span class="review_content">${list.content }</span>
                        </div>
                        <div class="rightsort">
                            <button class="btn_report font_arr">신고하기</button>
                        </div>
                    </section>
                </li>
                
            </ol>
            </c:forEach>
            <br>
            <section class="reg">
            	<button class="btn_reg font_norm">리뷰 등록</button>
            </section>
            <br><br>
            <c:if test="${pageCount > 10 }">
            
            
            <!-- 페이지 -->
            <footer class="page">
                <div class="page_div">
                    <!-- 필요하면 맨 앞으로 버튼 or 1 ... (현재 페이지) -->
                    <!-- Prev 버튼 -->
                    <div class="page_div_l">
                        <a href="#" class="btn font_arr">
                            <div>Prev</div>
                        </a>
                    </div>
                    <!-- 1~10 페이지 -->
                    <ul class="pagelist">
                        <li class="pagel">
                            <span class="btn font_arr">
                                <a href="#">1</a>
                            </span>
                        </li>
                        <li class="pagel">
                            <span class="btn font_arr">
                                <a href="#">2</a>
                            </span>
                        </li>
                        <li class="pagel">
                            <span class="btn font_arr">
                                <a href="#">3</a>
                            </span>
                        </li>
                        <li class="pagel">
                            <span class="btn font_arr">
                                <a href="#">4</a>
                            </span>
                        </li>
                    </ul>
                    <div class="page_div_l">
                        <a href="#" class="btn font_arr">
                            <div>Next</div>
                        </a>
                    </div>
                    <!-- 필요하면 맨 뒤로 버튼 or (현재 페이지) ... (마지막 페이지) -->
                </div>
            </footer>
            </c:if>
            
            
        </section>
    </div>
</body>
</html>