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
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
                        <h1 class="mt-4">예약 목록</h1>
                    
                         <div class="card mb-4"> </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                              <!--   <i class="fas fa-table me-1"></i> -->

                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
	                                        <th>예약자 이름</th>
											<th>전화번호</th>
											<th>식당이름</th>
											<th>예약날짜</th>
											<th>인원수</th>
											<th>결제정보</th>
											<th>결제상태</th>
											<th>요청사항</th>
											<th>메뉴이름</th>
											<th>메뉴수량</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                    		<c:forEach var="dto" items="${cRsvList}">               
                                        <tr>
                                           	<td>${dto[0].rsrv_name }</td>
											<td>${dto[0].rsrv_phone }</td>
											<td>${dto[1].store_name }</td>
											<td>${dto[0].rsrv_date }</td>
											<td>${dto[0].people_num }</td>
											<td>${dto[0].pay_no }</td>
											<td>${dto[0].status }</td>
											<td>${dto[0].rsrv_msg }</td>
											<td>${dto[0].menu_no}</td>
											<td>${dto[0].menu_amount }</td>
                                        </tr>
                   			 </c:forEach>   
                                    </tbody>
                                  
                                </table>
                            </div>
                        </div>
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>