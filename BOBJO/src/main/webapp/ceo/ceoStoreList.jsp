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
input[type="button"] {
        background-color: buttonhighlight;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-bottom: 20px;
        cursor: pointer;
    }

    input[type="button"]:hover {
        background-color: #3e8e41;
    }
input[type="checkbox"] {
  display: inline-block;
  vertical-align: middle;
  margin-right: 70%;
  position: relative;
   bottom: 40px;
}	
    
</style>
<link href="./css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	 var count = 1;
	 var addCount;
	 
	//행추가
	function addInputBox() {
	 for(var i=1; i<=count; i++) {
	  if(!document.getElementsByName("store_img"+i)[0]) {
	   addCount = i;
	   break;
	  }
	  else addCount = count;
	 }
	
	 var addStr = "<tr><td width=140><input type=file name=store_img"+addCount+" size=40></td></tr>";
	 var table = document.getElementById("dynamic_table");
	 var newRow = table.insertRow();
	 var newCell = newRow.insertCell();
	 newCell.innerHTML = addStr;
	 count++;
	}
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
					<h1 style="text-align: center;">식당 목록</h1>
					<table border="1">
						<thead>
							<tr>
								<th>사진</th>
								<th>식당 이름</th>
								<th>주소</th>
								<th style="width: 150px">전화번호</th>
								<th>카테고리</th>
								<th style="width: 250px">메뉴등록/수정/삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${cStoreList }"> 
							
								<tr>
									<td><img
										src="./images/${dto.store_img.split(',')[0] }"
										alt="식당 이미지"></td>
						 			<td>
						 			<a href="./CeoMenuList.nu?store_no=${dto.store_no }" id="cMenu">${dto.store_name }</a>
						 			</td>
						 			
									<td>
										${dto.addr } <br>
										${dto.addr_details }
									</td>
									<td>${dto.tel }</td>
									<td>${dto.store_category }</td>
									<td>
										<button class="btn-addmenu" onclick="location.href='./CeoMenuAdd.nu?store_no=${dto.store_no}'">메뉴등록</button>
										<button class="btn-modify" onclick="location.href='./CeoStoreList.st?store_no=${dto.store_no}'">수정</button>
										<button class="btn-delete"  onclick="deleteStore(${dto.store_no})">삭제</button>
									</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<script type="text/javascript">
					 	function deleteStore(store_no) {
					 		if(confirm('가게를 삭제하시겠습니까?')){
					 			location.href="./CeoStoreDelete.st?store_no="+store_no;
					 		}
						}
				    </script>
					<c:if test="${cdto.store_no != null }">
					   <h1 style="text-align: center;">식당 수정</h1>
						<form method="post" action="./CeoStoreUpdate.st?store_no=${cdto.store_no }" enctype="multipart/form-data">
							
							<label for="store_name">식당 이름</label>
							<input type="text" id="store_name" name="store_name" required value="${cdto.store_name }"><br>
					
							<label for="addr">주소</label>
							<input type="text" id="addr" name="addr" required value="${cdto.addr }"><br>
					
							<label for="addr_details">상세 주소</label>
							<input type="text" id="addr_details" name="addr_details" value="${cdto.addr_details }"><br>
					
							<label for="tel">전화번호</label>
							<input type="text" id="tel" name="tel" required value="${cdto.tel }"><br>
					
							<label for="open">open</label>
							<input type="text" id="open" name="open" required value="${cdto.open }"><br>
					
							<label for="close">close</label>
							<input type="text" id="close" name="close" required value="${cdto.close }"><br>
					
							<label for="total_tables">총 좌석 수</label>
							<input type="number" id="total_tables" name="total_tables" min="0" required value="${cdto.total_tables }"><br>
					
							<label for="max_rsrv">최대 예약 인원</label>
							<input type="number" id="max_rsrv" name="max_rsrv" min="1" required value="${cdto.max_rsrv }"><br>
					
							<label for="extra_info">편의 시설</label>
							<input type="text" id="extra_info" name="extra_info" value="${cdto.extra_info }"><br>
					
							<label for="store_content">식당 소개</label>
							<textarea id="store_content" name="store_content" required >${cdto.store_content }</textarea><br>
					
							<label for="store_img">사진</label> 
							<c:forEach var="img" items="${cdto.store_img.split(',')}">
								<img src="./images/${img}" width="60px" height="60px">
								<input type="checkbox" value="${img}" name="deleteImg">
								<input type="hidden" name="existingImg" value="${img}">
							</c:forEach>
							
							<input type="button" value="행 추가" onclick="javascript:addInputBox();"> 
							<input type="hidden" name="count">
							<table cellpadding=0 cellspacing=0  border="1">
								<tr>
									<table cellpadding=0 cellspacing=0 id="dynamic_table"
										border="1">
									</table>
								</tr>
							</table>
					
							<label for="refund_policy">환불 규정</label>
							<textarea id="refund_policy" name="refund_policy" >${cdto.refund_policy }</textarea><br>
					
							<label for="store_category">카테고리</label>
							<select id="store_category" name="store_category" required>
						
								<option value="한식" 
								<c:if test="${cdto.store_category eq '한식' }">
								selected
								</c:if>
								>한식</option>
							
								<option value="일식"
								<c:if test="${cdto.store_category eq '일식' }">
								selected
								</c:if>
								>일식</option>
								<option value="중식"
								<c:if test="${cdto.store_category eq '중식' }">
								selected
								</c:if>
								>중식</option>
								<option value="양식"
								<c:if test="${cdto.store_category eq '양식' }">
								selected
								</c:if>
								>양식</option>
								<option value="기타"
								<c:if test="${cdto.store_category eq '기타' }">
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