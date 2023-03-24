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
	padding: 8px;
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

.btn-modify, .btn-delete, .btn-addmenu {
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
#cMenu {
  color: green;
  text-decoration: none;
}
</style>
<link href="./css/styles.css" rel="stylesheet" />
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
					<h1 style="text-align: center;">예약자 목록</h1>
					<table border="1">
						<thead>
							<tr>
								<th>예약자 이름</th>
								<th>전화번호</th>
								<th>식당번호</th>
								<th>예약날짜</th>
								<th>인원수</th>
								<th>결제정보</th>
								<th>결제상태</th>
								<th>요청사항</th>
								<th>메뉴번호</th>
								<th>메뉴수량</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="dto" items="${cRsvList }">
							<tr>
								<td>${dto.rsrv_name }</td>
								<td>${dto.rsrv_phone }</td>
								<td>${dto.store_no }</td>
								<td>${dto.rsrv_date }</td>
								<td>${dto.people_num }</td>
								<td>${dto.pay_no }</td>
								<td>${dto.status }</td>
								<td>${dto.rsrv_msg }</td>
								<td>${dto.menu_no.split(',')[0] }</td>
								<td>${dto.menu_amount.split(',')[0] }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
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