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
<style>
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
table {
	border-collapse: collapse;
	width: 70%;
	margin: auto;
}

th, td {
	padding: 5px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

img {
	max-width: 100px;
	max-height: 100px;
}

.btn-modify, .btn-delete {
	display: inline-block;
	margin-right: 10px;
	padding: 5px 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn-modify:hover, .btn-delete:hover {
	background-color: #3e8e41;
}
</style>
<link href="./css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
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
					<h1 style="text-align: center;">메뉴 목록</h1>
					<table border="1">
						<thead>
							<tr>
								<th>사진</th>
								<th>메뉴 이름</th>
								<th>가격</th>
								<th>메뉴 정보</th>
								<th style="width:150px;">카테고리</th>
								<th style="width:200px;">수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${cMenuList }">
								<tr>
									<td><img
										src="./images/${dto.menu_img }"
										alt="식당 이미지"></td>
						 			<td>${dto.menu_name }</td>
									<td>${dto.price }</td>
									<td>${dto.menu_info }</td>
									<td>${dto.menu_category }</td>
									<td>
										<button class="btn-modify" onclick="location.href='./CeoMenuList.nu?store_no=${dto.store_no}&menu_no=${dto.menu_no}'">수정</button>
										<button class="btn-delete" onclick="deleteMenu(${dto.menu_no},${dto.store_no })">삭제</button>
									</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<script type="text/javascript">
					 	function deleteMenu(menu_no,store_no) {
					 		if(confirm('메뉴를 삭제하시겠습니까?')){
					 			location.href="./CeoMenuDelete.nu?menu_no="+menu_no+"&store_no="+store_no;
					 		}
						}
				    </script>
				    
					<c:if test="${cdto.menu_no != null }">
					   <h1 style="text-align: center;">메뉴 수정</h1>
						<form method="post" action="./CeoMenuUpdate.nu" enctype="multipart/form-data">
							<input type="hidden" value="${cdto.menu_no }" name="menu_no">
							<input type="hidden" value="${cdto.store_no }" name="store_no">
							
							<label for="menu_name">메뉴 이름</label>
							<input type="text" id="menu_name" name="menu_name" required value="${cdto.menu_name }"><br>
					
							<label for="price">가격</label>
							<input type="text" id="price" name="price" required value="${cdto.price }"><br>
					
							<label for="menu_info">메뉴 정보</label>
							<input type="text" id="menu_info" name="menu_info" value="${cdto.menu_info }"><br>
					
					
							<label for="menu_img">사진</label>
							<input type="file" id="menu_img" name="menu_img" value="${cdto.menu_img }"><br>
					
							
							<label for="menu_category">카테고리</label>
							<select id="menu_category" name="menu_category" required>
						
								<option value="한식" 
								<c:if test="${cdto.menu_category eq '한식' }">
								selected
								</c:if>
								>한식</option>
							
								<option value="일식"
								<c:if test="${cdto.menu_category eq '일식' }">
								selected
								</c:if>
								>일식</option>
								<option value="중식"
								<c:if test="${cdto.menu_category eq '중식' }">
								selected
								</c:if>
								>중식</option>
								<option value="양식"
								<c:if test="${cdto.menu_category eq '양식' }">
								selected
								</c:if>
								>양식</option>
								<option value="기타"
								<c:if test="${cdto.menu_category eq '기타' }">
								selected
								</c:if>
								>기타</option>
							</select><br>
							<button type="submit">수정하기</button>
						</form>
					</c:if>
						
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