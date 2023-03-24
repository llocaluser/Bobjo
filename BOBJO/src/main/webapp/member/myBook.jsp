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
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="./Main.me">BOBJO</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="./Main.me">메인</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="./MemberLogoutAction.me">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            
              <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">    
                        <c:if test="${ceo_num == null }">
                            <div class="sb-sidenav-menu-heading">마이페이지</div>
                            <a class="nav-link" href="./MemberMypage.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                마이페이지 홈
                            </a>
                            <!-- <div class="sb-sidenav-menu-heading">예약</div> -->
                            <a class="nav-link collapsed" href="./MemberBook.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                예약관리      
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav"> </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                북마크
                                </a>
                            
                             <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages"> </nav>
                            </div>
                       </c:if>
                           
                            <div class="sb-sidenav-menu-heading">계정</div>
                            <a class="nav-link" href="./MemberUpdateAction.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                내정보수정
                            </a>
                            <a class="nav-link" href="./MemberDeleteAction.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원탈퇴
                            </a>
                            
                            <c:if test="${ceo_num != null }">
	                               <div class="sb-sidenav-menu-heading">사업주</div>
	                            <a class="nav-link" href="./CeoAddStore.st">
	                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
	                                가게등록
	                            </a>
	                            <a class="nav-link" href="./CeoStoreList.st">
	                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	                               	가게리스트
	                            </a>
	                            <a class="nav-link" href="./CeoMenuAdd.nu">
	                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
	                                메뉴등록
	                            </a>
                            </c:if> 
                        </div>                    
                    </div>
                </nav>
             </div>   
           
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">예약확인</h1>
                    
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
                                            <th>예약자 연락처</th>
                                            <th>예약상태</th>
                                            <th>요청사항</th>
                                            <th>가게이름</th>
                                            <th>메뉴이름</th>
                                            <th>수량</th>
                                            <th>예약 일시</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                    <c:forEach var="dto" items="${getMemberBookList}">               
                                        <tr>
                                            <td>${dto[0].rsrv_name }</td>
                                            <td>${dto[0].rsrv_phone }</td>
                                            <td>${dto[0].status }</td>
                                            <td>${dto[0].rsrv_msg }</td>
                                            <td>${dto[1].store_name }</td>
                                            <td>${dto[2] }</td>
                                            <td>${dto[3] }</td>
                                            <td>${dto[0].rsrv_date }</td>
                                             
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