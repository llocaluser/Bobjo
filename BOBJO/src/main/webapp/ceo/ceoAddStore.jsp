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
<style type="text/css">
	form {
	  display: flex;
	  flex-direction: column;
	  max-width: 600px;
	  margin: 0 auto;
	  padding: 20px;
	  border: 1px solid #ddd;
	  border-radius: 10px;
	}
	
	label {
	  font-weight: bold;
	  margin-top: 10px;
	}
	
	input[type="text"],
	input[type="number"],
	textarea {
	  padding: 10px;
	  margin-top: 5px;
	  margin-bottom: 15px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	  font-size: 16px;
	}
	
	input[type="file"] {
	  margin-top: 5px;
	  margin-bottom: 15px;
	  font-size: 16px;
	}
	
	select {
	  padding: 10px;
	  margin-top: 5px;
	  margin-bottom: 15px;
	  border-radius: 5px;
	  border: 1px solid #ccc;
	  font-size: 16px;
	}
	
	button[type="submit"] {
	  background-color: #4CAF50;
	  border: none;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  border-radius: 5px;
	  cursor: pointer;
	  margin-top: 20px;
	}
 </style>
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                        <c:if test="${ceo_num == null }">
                            <div class="sb-sidenav-menu-heading">마이페이지</div>
                            <a class="nav-link" href="index.html">
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
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                회원정보수정
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
	                            <a class="nav-link" href="#">
	                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
	                                가게정보수정
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
                       <h1 style="text-align: center;">가게 등록</h1>
						<form method="post" action="./CeoAddStoreAction.st" enctype="multipart/form-data">
							<label for="store_name">식당 이름</label>
							<input type="text" id="store_name" name="store_name" required><br>
					
							<label for="addr">주소</label>
							<input type="text" id="addr" name="addr" required><br>
					
							<label for="addr_details">상세 주소</label>
							<input type="text" id="addr_details" name="addr_details"><br>
					
							<label for="tel">전화번호</label>
							<input type="text" id="tel" name="tel" required><br>
					
							<label for="open">영업 시간</label>
							<input type="text" id="open" name="open" required><br>
					
							<label for="close">정기 휴일</label>
							<input type="text" id="close" name="close" required><br>
					
							<label for="total_tables">총 좌석 수</label>
							<input type="number" id="total_tables" name="total_tables" min="0" required><br>
					
							<label for="max_rsrv">최대 예약 인원</label>
							<input type="number" id="max_rsrv" name="max_rsrv" min="1" required><br>
					
							<label for="extra_info">편의 시설</label>
							<input type="text" id="extra_info" name="extra_info"><br>
					
							<label for="store_content">식당 소개</label>
							<textarea id="store_content" name="store_content" required></textarea><br>
					
							<label for="store_img">사진</label>
							<input type="file" id="store_img" name="store_img"><br>
					
							<label for="refund_policy">환불 규정</label>
							<textarea id="refund_policy" name="refund_policy" ></textarea><br>
					
							<label for="store_category">카테고리</label>
							<select id="store_category" name="store_category" required>
								<option value="한식">한식</option>
								<option value="일식">일식</option>
								<option value="중식">중식</option>
								<option value="양식">양식</option>
								<option value="기타">분식</option>
							</select><br>
					
							<button type="submit">등록하기</button>
						</form>
                    </div>
                </main>
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