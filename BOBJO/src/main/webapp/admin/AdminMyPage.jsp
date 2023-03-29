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
                
            </form>
            
            
            
            
            
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="./MemberLogoutAction.me">Logout</a></li>
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
                            href="javascript:void(0);" onclick="openSubNav('rsrv-manage');">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                예약관리
                            </a>
                            <a class="nav-link collapsed" 
                            href="javascript:void(0);" onclick="openSubNav('member-manage');" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                <div id="manageMem">회원관리</div>     
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav"> </nav>
                            </div>
                            <a class="nav-link collapsed" 
                            href="javascript:void(0);" onclick="openSubNav('store-manage');" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                가게관리
                                </a>
                            
                             <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages"> </nav>
                            </div>


<script type="text/javascript">



</script>


                            
                           
                            <%-- <div class="sb-sidenav-menu-heading">계정</div>
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
                            </c:if> --%>
                            
                        </div>
                    </div>
                    
                </nav>
                
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sub-nav">
                
                <a class="btn_close">
                <svg id="sub-nav-close" width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path class="white" d="M12 11.293l10.293-10.293.707.707-10.293 10.293 10.293 10.293-.707.707-10.293-10.293-10.293 10.293-.707-.707 10.293-10.293-10.293-10.293.707-.707 10.293 10.293z"/>
                <style>.white{fill:white;}</style>
                </svg>
                </a>
                
                <div id="sub-nav-title">
                	회원관리
                </div>
                
                <!-- 예약관리 -->
                <div id="rsrv-manage">
                	<ul>
                		<li id="addRsrv">예약 추가</li>
                		<li id="modRsrv">예약 수정</li>
                		<li id="delRsrv">예약 삭제</li>                		
                	</ul>
                </div>
                
                <!-- 회원관리 -->
                <div id="member-manage">
                	<ul>
                		<li id="adCeo">사업자 허가</li>
                		<li id="mM">회원 수정/탈퇴</li>
                		<li id="resetPw">비밀번호 변경</li>             		
                	</ul>
                </div>
                
                <!-- 가게관리 -->
                <div id="store-manage">
                	<ul>
                		<li id="regRes">식당 등록</li>
                		<li id="modRes">식당 정보 수정</li>
                		<li id="killRes">식당 삭제</li>                		
                	</ul>
                </div>
                
                
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                
                    
                    <div class="main_content">
                    
                    
                    
                    <article id="show-addRsrv">
                    	<section class="title">
                    		<h4>예약 추가</h4>
                    	</section>
                    </article>
                    
                    
                    
                    
                    <article id="show-modRsrv">
                    	<section class="title">
                    		<h4>예약 수정</h4>
                    	</section>
                    </article>
                    
                    
                    
                    
                    <article id="show-delRsrv">
                    	<section class="title">
                    		<h4>예약 삭제</h4>
                    	</section>
                    </article>
                    
                    
                    
                    <article id="show-adCeo">
                    	<section class="title">
                    		<h4>사업자 허가</h4>
                    	</section>
                    </article>
                    
                    
                    
                    <article id="show-mM">
                    	<section class="title">
                    		<h4>회원 관리</h4>
                    	</section>
                    </article>
                    
                    
                    
                    <article id="show-resetPw">
                    	<section class="title">
                    		<h4>임시 비밀번호 생성</h4>
                    	</section>
	                    <input type="text" name="memberId" placeholder="회원 아이디 입력">
	                    <button id="NewPw">새 비번 생성 & 보내기</button>
                    </article>
                    
                    
                    
                    
                    
                    <article id="show-regRes">
                    	<section class="title">
                    		<h4>식당 등록</h4>
                    	</section>
                    </article>
                    
                    
                    
                    
                    
                    <article id="show-modRes">
                    	<section class="title">
                    		<h4>식당 정보 수정</h4>
                    	</section>
                    </article>
                    
                    
                    
                    
                    
                    <article id="show-killRes">
                    	<section class="title">
                    		<h4>식당 삭제</h4>
                    	</section>
                    </article>
                    
                     </div>
                     
                     
                     <!-- 회원 수정 모달 -->
                     <div id="update-modal" class="search_back">
                     	<div class="search">
                     		<form class="search_box" action="./UpdateMember.ad" method="post">
                     		<table class="table_Mem">
                     			<tr>
                     				<th>id</th>
                     				<th>pw</th>
                     				<th>name</th>
                     				<th>phone</th>
                     				<th>nickname</th>
                     				<th>email</th>
                     				<th>point</th>
                     				<th>ceonum</th>
                     				<th>level</th>
                     			</tr>
                     			<tr>
                     				<td><input type="text" name="m_id" style="width:110px" readonly></td>
                     				<td><input type="text" name="pw" style="width:110px"></td>
                     				<td><input type="text" name="m_name" style="width:110px"></td>
                     				<td><input type="text" name="phone" style="width:125px"></td>
                     				<td><input type="text" name="nickname" style="width:120px"></td>
                     				<td><input type="text" name="email" style="width:200px"></td>
                     				<td><input type="text" name="point" style="width:50px"></td>
                     				<td><input type="text" name="ceo_num" style="width:120px"></td>
                     				<td><input type="text" name="alcohol_level" style="width:60px"></td>
                     			</tr>
                     		</table>
                     		<br>
                     			<input type="submit" value="수정">
                     		</form>
                     	</div>
                     </div>
                     <!-- 회원 수정 모달 -->
                     
                     
                </main>
                
                
                
                 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <script type="text/javascript"
				        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
				</script>
                <script type="text/javascript">
                
                const manageMem = document.querySelector('#manageMem');
                const subnav = document.querySelector('#sub-nav');
                
                const rsrvManage = document.getElementById('rsrv-manage');
                const memberManage = document.getElementById('member-manage');
                const storeManage = document.getElementById('store-manage');
                
                const NewPw = document.querySelector('#NewPw');
                const subnavclose = document.querySelector('#sub-nav-close');
                const subnavtitle = document.querySelector('#sub-nav-title');
                
                const mM = document.querySelector('#mM');
                const manageMember = document.querySelector('#manageMember');
                
                const resetPw = document.querySelector('#resetPw');
                const generatePw = document.querySelector('#generatePw');
                
                const navItems = document.querySelectorAll('#sub-nav li');
                const articles = document.querySelectorAll('.main_content article');
				const updatebg = document.querySelector('#update-modal');
                
                
                
                navItems.forEach(item => {
                	item.addEventListener('click', () => {
	                	const articleId = 'show-' + item.id.replace('show-', '');
	                	const articleToShow = document.getElementById(articleId);
	
	                	articles.forEach(article => {
	                    	article.classList.remove('current');
	                    	article.style.display = 'none';
	                	});
	
	                	articleToShow.classList.add('current');
	                	articleToShow.style.display = 'block';
	                	
	                	if(articleId == 'show-mM') {
	                		loadMemberTable();
	                	}
                	});
            	});
                
                
                function loadMemberTable(){
                	
                	if (document.getElementById("member-table")) {
                    	return;
                    }
                	
                	$.ajax({
                		type: "POST",
                		url: "LoadMemberTable.ad",
                		dataType: "json",
                		success: function(data) {
                			
                			var tableHtml = '<table id="member-table" class="table_Mem"><thead><tr><th>ID</th><th>PW</th><th>Name</th><th>Phone</th><th>Nickname</th><th>Email</th><th>Point</th><th>Ceo Num</th><th>Alcohol Level</th><th>Manage</th></tr></thead><tbody>';

                		    for (var i = 0; i < data.length; i++) {
                		        var member = data[i];
tableHtml += '<tr><td>' + member.m_id + '</td><td>' + member.pw + '</td><td>' + member.m_name + '</td><td>' + member.phone + '</td><td>' + member.nickname + '</td><td>' + member.email + '</td><td>' + member.point + '</td><td>' + member.ceo_num + '</td><td>' + member.alcohol_level 
+ '</td><td><button class="btn_mem" onclick="modMem(\'' + member.m_id + '\',\'' + member.pw + '\',\'' + member.m_name + '\',\'' + member.phone + '\',\'' + member.nickname + '\',\'' + member.email + '\',\'' + member.point + '\',\'' + member.ceo_num + '\',\'' + member.alcohol_level + '\');">수정</button><button class="btn_mem" onclick="delMem(\'' + member.m_id + '\');">삭제</button></td></tr>';
                		    }
                		    
                		    tableHtml += '</tbody></table>';
                		    $('#show-mM section.title').after(tableHtml);
						},
                		error: function() {
                			console.log('Error loading member table');
                		}
                	});
                	
                }
                
                
                
                document.querySelector('.search_box').addEventListener('submit', function(e) {
                    
                    e.preventDefault();
                    
                    let formData = new FormData(this);
                    	              
                    $.ajax({
                    	type: "POST",
                    	url: "./UpdateMember.ad",
                    	data: {
                    		m_id:formData.get("m_id"),
                    		pw:formData.get("pw"),
                    		m_name:formData.get("m_name"),
                    		phone:formData.get("phone"),
                    		nickname:formData.get("nickname"),
                    		email:formData.get("email"),
                    		point:formData.get("point"),
                    		ceo_num:formData.get("ceo_num"),
                    		alcohol_level:formData.get("alcohol_level")
                    	},
                    	success: function(data) {
                    	    console.log('수정 성공');
                    	    
                    	    updatebg.style.display = 'none';
                            
                            let memberTable = document.getElementById('member-table');
                            if (memberTable) {
                                memberTable.parentNode.removeChild(memberTable);
                            }
                            
                            loadMemberTable();
                    	},
                    	error: function() {
                    	    console.log('Error updating member');
                    	}
                    });
                    
                    
                });
                
                document.querySelector('.search_back').addEventListener('click', (e) => {
                	let targetE = e.target;
                	if(!targetE.classList.contains('search')){
	                	updatebg.style.display = 'none';                		
                	}
                })
                
                function openSubNav(id){
                	subnav.classList.add('show');
                	
                	rsrvManage.style.display = id === 'rsrv-manage' ? 'flex' : 'none';
                	memberManage.style.display = id === 'member-manage' ? 'flex' : 'none';
                	storeManage.style.display = id === 'store-manage' ? 'flex' : 'none';
                	
                	if (id === 'rsrv-manage') {
                		subnavtitle.textContent = '예약 관리';
                	} else if (id === 'member-manage') {
                		subnavtitle.textContent = '회원 관리';
                	} else if (id === 'store-manage') {
                		subnavtitle.textContent = '가게 관리';
                	}
                }
                
                
                function modMem(m_id, pw, m_name, phone, nickname, email, point, ceo_num, alcohol_level){
                	
                	updatebg.style.display = 'flex';
                	
                	document.querySelector('input[name="m_id"]').value = m_id;
                	document.querySelector('input[name="pw"]').value = pw;
                	document.querySelector('input[name="m_name"]').value = m_name;
                	document.querySelector('input[name="phone"]').value = phone;
                	document.querySelector('input[name="nickname"]').value = nickname;
                	document.querySelector('input[name="email"]').value = email;
                	document.querySelector('input[name="point"]').value = point;
                	document.querySelector('input[name="ceo_num"]').value = ceo_num;
                	document.querySelector('input[name="alcohol_level"]').value = alcohol_level;
                }
                
                function delMem(id){
                	var check = confirm(id + "님에 대한 정보를 삭제하시겠습니까?");
                	
                	if(check){
                		$.ajax({
                			type: "POST",
                			url: "DeleteMember.ad",
                			dataType: "text",
                			data: {id : id},
                			success: function(data, stat, xhr){
                				if(xhr.status === 200){
	                				let table = document.getElementById("member-table");
	                				table.parentNode.removeChild(table);
	                				loadMemberTable();
                				}else{
                					alert("오류가 발생했습니다");
                				}
                			},
                			error: function(req, stat, error){
                				alert(stat + " - " + error + " [삭제 실패]");
                			}
                		});
                	}
                }
                
                
                NewPw.addEventListener('click', () => {
                	var m_id = document.querySelector('input[name="memberId"]').value;
                	if(m_id == '') {
                		alert("회원의 id값을 입력해야 합니다")
                		return false;
                	}
                	var xhr = new XMLHttpRequest();
                		xhr.onreadystatechange = function() {
	                		if (xhr.readyState === XMLHttpRequest.DONE) {
	                	    	if (xhr.status === 200) {
		                	        var response = xhr.responseText.split("|");
		                	        var password = response[0];
		                	        var email = response[1];
		                	        if (email == null || email == 'null') {
		                	        	email = null;
		                	        	alert("당 회원은 메일 주소가 없습니다");
		                	        }
		                	        else {
		                	        	alert(email + "에 새로운 비밀번호가 송신되었습니다");
		                	        	
		                	        	emailjs.init("rVmnb5Oe_svONJ5rI");
		            			    	
		            			    	var templateParams = {
		            			    		pw: password
		            			    	}
		            			    	
		            			    	emailjs.sendForm('gmail', 'template_dtnk9fq', templateParams)
		            			         //emailjs.send('service ID', 'template ID', 보낼 내용이 담긴 객체)
		            			         	    .then(function(response) {
		            			         	       console.log('SUCCESS!', response.status, response.text);
		            			         	    }, function(error) {
		            			         	       console.log('FAILED...', error);
		            			         	    });
		                	        	//sendPasswordEmail(email, password);
		                	        	
		                	        }
		               			} else {
	                	    	console.log("Error: " + xhr.status);
	              				}
	                		}
	               		};
					xhr.open("POST", "GenerateNewPw.ad?m_id=" + m_id, true);
                	xhr.send();
			    	
                });
                
                function sendPasswordEmail(memberEmail, password) {
                	var emailBody = "Dear Member,\n\nYour new password is: " + password + "\n\nPlease use this password to log in to our website.\n\nThank you.";
                	var emailLink = "mailto:" + memberEmail + "?subject=New Password&body=" + encodeURIComponent(emailBody);
                	window.location.href = emailLink;
               	}
                
                subnavclose.addEventListener('click', () => {
                	
                	subnav.classList.remove('show');
                });
                
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