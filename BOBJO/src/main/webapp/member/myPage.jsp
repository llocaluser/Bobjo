<%@page import="com.bobjo.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BOBJO</title>
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
    <style type="text/css">
     
     img{
            float: left;
            width: 200px;
            margin: 15px;
    }
    
    .card_set1{
    display: flex;
    flex-flow: column nowrap;
    height: auto;
    width: 1100px;
    margin-left: 5rem;
    
    }
    .card_set2{
   
    }
    
    </style>    
           
    </head>
    <body>

       <!-- inc mypage.jsp -->
       		 <jsp:include page="../inc/mypage.jsp"/> 
       <!-- inc mypage.jsp -->
          
          
          <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
       
       
                     
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">안녕하세요 "${m_id }"님</h1>
                        <hr>
                        
                           <div class="card_set1">
                        <div class="card mb-4-1">
                            <div class="card-body">
                               <img src="./img/person.png">  <h4 class="mt-4">내정보</h4> <br>
                                  <h6>이름 : ${dto.m_name } </h6>
                                  <h6>이메일 : ${dto.email } </h6>
                                  <h6>휴대폰 번호 : ${dto.phone } </h6>                                                            
                            </div>
                        </div>
                        
	                         <div class="card_set2">
                       <c:if test="${ceo_num == null }">
	                         <div class="card mb-4-1-1">
	                            <div class="card-body">
	                               <img src="./img/date.png"> <h3 class="mt-4">예약내역</h3> <br>
	                                  <h5> <b>${count }건</b> </h5>      
	                                 <a href="./MemberBook.me"> <h5> 확인하기 </h5> </a>       
	                            </div>
	                        </div>
						</c:if>   
						  <c:if test="${ceo_num == null }">
	                         <div class="card mb-4-1-1">
	                            <div class="card-body">
	                               <img src="./img/point.png"> <h3 class="mt-4">포인트</h3> <br>
	                                  <h5> <b>${dto.point }점</b> </h5>           
	                            </div>
	                        </div>
						</c:if>                     
	                        </div>
 							</div>
                        
                          <div style="height: 40vh"></div> 
                       <!--  <div class="card mb-4">
                        <div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div> -->
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>  
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>