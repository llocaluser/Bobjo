<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
               <a class="navbar-brand ps-3" href="./Main.me">BOBJO</a> 
        
           
            <!-- Navbar-->
           <ul class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="./Main.me">메인으로</a></li>
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
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link" href="./MemberMypage.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                마이페이지
                            </a>
                            <!-- <div class="sb-sidenav-menu-heading">예약</div> -->
                            <a class="nav-link collapsed" href="./MemberBook.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                예약관리      
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav"> </nav>
                            </div>
                            <a class="nav-link collapsed" href="./MemberReview.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                리뷰관리
                                </a>
                            
                             <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages"> </nav>
                            </div>
                       </c:if>
                           
                            <div class="sb-sidenav-menu-heading">계정</div>
                            <a class="nav-link" href="./MemberUpdateAction.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                회원정보수정
                            </a>
                            <a class="nav-link" href="./MemberDeleteAction.me">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원탈퇴
                            </a>
                            
                            <c:if test="${ceo_num != null }">
	                               <div class="sb-sidenav-menu-heading">사업자</div>
	                            <a class="nav-link" href="./CeoAddStore.st">
	                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
	                                가게등록
	                            </a>
	                            <a class="nav-link" href="./CeoStoreList.st">
	                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	                               	가게리스트
	                            </a>
	                            <a class="nav-link" href="./CeoRsrvList.re">
	                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	                               	예약리스트
	                            </a>
                            </c:if>
                            
                        </div>
                    </div>
	
</body>
</html>