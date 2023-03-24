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
        <link href="./css/adminMyPage.css" rel="stylesheet" />
    </head>
    
    
    
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="./Main.me">BOBJO</a>
        
           
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
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
        
        
        
        
        
        
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav" style="display:inline-flex;">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="main-nav">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                        <div id="m_id">
	                        환영합니다 <br>관리자 ${m_id }님
                        </div>
                        
                        
                        
                            <div class="sb-sidenav-menu-heading">관리기능</div>
                            <a class="nav-link" 
                            href="javascript:void(0);" onclick="openSubNav();">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                예약관리
                            </a>
                            <!-- <div class="sb-sidenav-menu-heading">예약</div> -->
                            <a class="nav-link collapsed" 
                            href="javascript:void(0);" onclick="openSubNav();" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                <div id="manageMem">회원관리</div>     
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav"> </nav>
                            </div>
                            <a class="nav-link collapsed" 
                            href="javascript:void(0);" onclick="openSubNav();" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                가게관리
                                </a>
                            
                             <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages"> </nav>
                            </div>


<script type="text/javascript">



</script>


                            
                           
                            <div class="sb-sidenav-menu-heading">계정</div>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                내정보수정
                            </a>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원탈퇴
                            </a>
                            
                            <c:if test="${ceo_num != null }">
	                               <div class="sb-sidenav-menu-heading">사업주</div>
	                            <a class="nav-link" href="#">
	                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
	                                가게등록
	                            </a>
	                            <a class="nav-link" href="#">
	                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	                               	가게리스트
	                            </a>
	                            <a class="nav-link" href="#">
	                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
	                                메뉴등록
	                            </a>
                            </c:if>
                            
                        </div>
                    </div>
                    
                </nav>
                
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sub-nav">
                
                <div id="sub-nav-title">
                	회원관리
                </div>
                
                <!-- 예약관리 -->
                <div id="rsrv-manage">
                	<ul>
                		<li>예약 추가</li>
                		<li>예약 수정</li>
                		<li>예약 삭제</li>                		
                	</ul>
                </div>
                
                <!-- 회원관리 -->
                <div id="member-manage">
                	<ul>
                		<li><div>사업자 허가</div></li>
                		<li><div>회원 수정</div></li>
                		<li><div>회원 탈퇴</div></li>
                		<li><div>비밀번호 변경(임시)</div></li>             		
                	</ul>
                </div>
                
                <!-- 가게관리 -->
                <div id="store_manage">
                	<ul>
                		<li>식당 등록</li>
                		<li>식당 정보 수정</li>
                		<li>식당 삭제</li>                		
                	</ul>
                </div>
                
                
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                
                    <!-- <div class="container-fluid px-4">
                        <h1 class="mt-4">${m_id }님</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Static Navigation</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                    This page is an example of using static navigation. By removing the
                                    <code>.sb-nav-fixed</code>
                                    class from the
                                    <code>body</code>
                                    , the top navigation and side navigation will become static on scroll. Scroll down this page to see an example.
                                </p>
                            </div>
                        </div>
                        <div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                    </div> -->
                    
                    
                    
                     
                </main>
                
                
                <script type="text/javascript">
                
                const manageMem = document.querySelector('#manageMem');
                const subnav = document.querySelector('#sub-nav');
                
                
                function openSubNav(){
                	
                	manageMem.addEventListener('click', () => {
                		subnav.style.display = 'flex';	
                	});
                	
                }
                
                
                </script>
                
                
                
                
                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>