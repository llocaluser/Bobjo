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
    
    
    
    </style>    
        
        
        
        
    </head>
    <body>

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="./Main.me">BOBJO</a>
        
           
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"> </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="./Main.me">메인</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href=".//MemberLogoutAction.me">로그아웃</a></li>
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
                            <a class="nav-link" href="./MemberBook.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                예약관리
                            </a>
                            <!-- <div class="sb-sidenav-menu-heading">예약</div> -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                방문기록      
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
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">마이페이지</h1>
                        <hr>
                        
                           
                        <div class="card mb-4">
                            <div class="card-body">
                               <img src="./img/person.png">  <h4 class="mt-4">안녕하세요 "${m_id }"님</h4> <br>
                                  <h6>이름 : ${dto.m_name } </h6>
                                  <h6>이메일 : ${dto.email } </h6>
                                  <h6>휴대폰 번호 : ${dto.phone } </h6>
                                                                             
                               <%--  <p class="mb-0">
                                    This page is an example of using static navigation. By removing the
                                    <code>.sb-nav-fixed</code>
                                    class from the
                                    <code>body</code>
                                    , the top navigation and side navigation will become static on scroll. Scroll down this page to see an example.
                                </p> --%>
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