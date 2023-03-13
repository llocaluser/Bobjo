<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="./review/review.css">
    <link rel="stylesheet" type="text/css" href="./review/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var store_no = "${store_no}";
		var pageNum = "${pageNum}";
		function sortReview(){
			var sort = $("#selectbox option:selected").val();
			if(sort == high) {
				location.href='review.jsp?store_no='+store_no+'pageNum='+pageNum+'sort=high';
			}
			else if(sort == low) {
				location.href='review.jsp?store_no='+store_no+'pageNum='+pageNum+'sort=low';
			}
			else if(sort == recent) {
				location.href='review.jsp?store_no='+store_no+'pageNum='+pageNum+'sort=recent';
			}
			return;
		}
		
		function report(){
    		var report = confirm("리뷰글을 신고하시겠습니까?");
    		if(report){
    			alert("신고되었습니다");
    		}else{
    			return false;
    		}
    		return true;
    	}
	</script>
</head>
<body>
    
    <br><br>
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
                        <div class="score">평균 ${AVG }점</div>
                        총 ${Count }명 참여
                    </section>
                    <p class="review_desc">
                    	${store_name } 방문 고객님들의 리뷰입니다
                    </p>
                    <p class="review_desc2">허위 사실 기재, 타인에 대한 비방 시 법적 조치가 이루어질 수 있습니다</p>
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
                    
                    	<option value="none" disabled style="display:none">
                    	정렬 기준
                    	</option>
                        <option value="high" 
                        <c:if test="${sort eq 'high' }">
                        selected
                        </c:if>
                        >별점 높은 순</option>
                        <option value="low" 
                        <c:if test="${sort eq 'low' }">
                        selected
                        </c:if>
                        >별점 낮은 순</option>
                        <option value="recent" 
                        <c:if test="${sort eq 'recent' }">
                        selected
                        </c:if>
                        >최신순</option>
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
	                        <a href="./img/${list.review_img }">
	                            <img class="profile" src="./img/${list.review_img }" alt="프로필">
	                        </a><br><br>
                        </div>
                        <p class="desc font_arr">${list.m_id }</p>
                    </section>
                    <!-- 평점, 작성일자, 내용 섹션 -->
                    <section class="section_review">
                        <section class="section_review_head font_arr">
                            <div class="div_star">
                            <c:forEach var="i" begin="1" end="5">
                            <c:choose>
            					<c:when test="${i <= list.score}">
            					<div class="star">
                					<i class="star_icon">
                						<img class="star" src="./img/star.jpg" alt="별">
                					</i>
                				</div>
            					</c:when>
            					<c:when test="${i-0.5 == list.score}">
					                <i class="star">
					                	<img class="star" src="./img/half.jpg" alt="반 별">
					                </i>
					            </c:when>
					            <c:otherwise>
					                <i class="star">
					                	<img class="star" src="./img/empty.jpg" alt="빈 별">
					                </i>
					            </c:otherwise>
					        </c:choose>
                            </c:forEach>
                            </div>
                            <p class="review_day">${list.reg_date }</p>
                        </section>
                        <div class="topmargin">
                            <span class="review_content">${list.content }</span>
                        </div>
                        <div class="rightsort">
                        	<button class="btn_reg font_norm">
	            				<a href="./ReviewModform.rv?store_no=${list.store_no }
			            		&list=${list}">리뷰 수정</a>
			            	</button>
                            <button type="button" class="btn_report font_arr" onclick="report();">
                            	신고하기
                            </button>
                        </div>
                    </section>
                </li>
                
            </ol>
            </c:forEach>
            <br>
            <section class="reg">
            <%-- <c:if test="${sessionContext.m_id eq ReviewList.m_id }">
            	<button class="btn_reg font_norm">
            		<a href="./ReviewMod.rv?store_no=${ReviewList[0].store_no }">리뷰 수정</a>
            	</button>
            </c:if> --%>
            	
            	<button class="btn_reg font_norm">
            		<a href="./ReviewRegform.rv?store_no=${ReviewList[0].store_no }">리뷰 등록</a>
            	</button>
            </section>
            <br><br>
            
            <!-- 페이지 -->
            <footer class="page">
                <div class="page_div">
                    <!-- 필요하면 맨 앞으로 버튼 or 1 ... (현재 페이지) -->
                    <!-- Prev 버튼 -->
                    <div class="page_div_l">
                    <c:if test="${startPage > 1 }">
                    <a href="./ReviewList.rv?pageNum=1" class="btn font_arr">
                        1
                    </a>
                    </c:if>
                    </div>
                    <ul class="pagelist">
                    <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
                    
                    <li class="pagel">
                    <c:if test="${startPage > 1 && i eq pageNum-2}">
                    	<span class="btn font_arr" style="border:none">
                    	...
                    	</span>
                    </c:if>
                    	<span class="btn font_arr">
                    		<a href="./ReviewList.rv?pageNum=${i }">${i }</a>
                    	</span>
                    <c:if test="${endPage < pageSize && i eq pageNum+2 }">
                    	<span class="btn font_arr" style="border:none">
                    	...
                    	</span>
                    </c:if>
                    </li>
                    
					</c:forEach>
                    </ul>
                    <div class="page_div_l">
                    <c:if test="${endPage < pageSize }">
                    <a href="./ReviewList.rv?pageNum=${pageSize }" class="btn font_arr">
                        <div>${pageSize }</div>
                    </a>
                    </c:if>
                    </div>
                    
                </div>
            </footer>
            
            
        </section>
    </div>
    
</body>
</html>