<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: 강사정보</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>


	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">강사 관리</li>
	    <li class="breadcrumb-item " aria-current="page">강사 현황</li>
	    <li class="breadcrumb-item " aria-current="page">강사 정보</li>
	  </ol>
	</nav>	
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis 강사 정보</b></h1>
			
			<div class="d-flex flex-column justify-content-center align-items-center w-100">
				<div class="col-4 gy-4">
					<div class="card">
						<div class="bg-dark p-2 d-flex flex-column justify-content-center align-items-center" style="min-height: 220px;">
					  		<img src="resources/img/${dto.t_img }" onerror="this.src='resources/img/no-image-icon.png';"/>
						</div>
				  		<div class="card-body d-flex flex-column justify-content-between" style="min-height: 280px;">
				  			<div>
				  				<h5 class="card-title">${dto.t_name }</h5>
						    	<p class="card-text">
						    		${dto.t_major }
									<br/>
									${dto.t_edu }
						    	</p>
				  			</div>
				  			
				  			<div class="d-grid gap-3 d-flex justify-content-center align-items-center">
				  				<input type = "button" value = "목록" class="btn btn-secondary w-100" onclick = "location='teacherIndex.do'">
				  				<input type = "button" value = "수정" class="btn btn-primary w-100" onclick = "location='updateTeacherForm.do?code=${dto.t_code}'">
					    		<input type = "button" value = "삭제" class="btn btn-danger w-100"  onclick="checkDel('${dto.t_code}', '${dto.t_img }')">
				  			</div>
					  	</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	
	<%@ include file = "../footer.jsp" %>
	<script>
		function checkDel(code, img){
			var isDel = window.confirm("정말로 삭제하시겠습니까?")
			if (isDel){
				location.href="deleteTeacher.do?code=" + code + "&img=" + img 
			}
		}
	</script> 
</body>
</html>