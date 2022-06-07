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
	    <li class="breadcrumb-item " aria-current="page">강사 정보 수정</li>
	  </ol>
	</nav>
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis 강사 정보 수정</b></h1>
			
			<div class="d-flex flex-column justify-content-center align-items-center w-100">
				<div class="col-4 gy-4">
					<div class="card">
						<div class="bg-dark p-2 d-flex flex-column justify-content-center align-items-center" style="min-height: 220px;">
					  		<img src="resources/img/${dto.t_img }" onerror="this.src='resources/img/no-image-icon.png';"/>
						</div>
				  		<div class="card-body d-flex flex-column justify-content-between" style="min-height: 280px;">
				  			<div>
				  				<h5 class="card-title">${dto.t_name }</h5>
				  				<hr/>
				  				<div class="d-flex flex-column gap-1"> 
				  					<b>수업</b>
				  					<c:forEach var="var" items="${listClass }"> 
					  					<div class="form-check">
										  <input class="form-check-input" type="checkbox" name="t_major" value="${var.c_name }" id="${var.c_name }">
										  <label class="form-check-label" for="${var.c_name }">
										    ${var.c_name }
										  </label>
										</div>
									</c:forEach> 
									
									<b class="mt-3" >학력</b>
									<input type="text" name="t_edu" class="form-control form-control-sm" id="t_edu" value="${dto.t_edu }">
				  				</div>
				  			</div>
				  			
				  			<div class="d-grid gap-3 d-flex justify-content-center align-items-center mt-3">
				  				<a href="teacherInfo.do?t_code=${dto.t_code }" class="btn btn-secondary w-100">취소</a>
					    		<input type="submit" value = "수정" class="btn btn-danger w-100">
				  			</div>
					  	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- 
	<div align="center">
		<h1>강사 정보 수정</h1>  
		<form name = "f" action="teaherUpdate.do" method="post">
			<input name = "t_code" type = "hidden" value ="${dto.t_code }">
			<table border="1">
			<tr>
				<td rowspan ="3"><img alt="${dto.t_img }" src="resources/img/${dto.t_img }"></td><td colspan="3"><input type = "hidden" value = "${dto.t_name }">${dto.t_name }</td>
			</tr>
			<tr>
				<th>수업</th>
					<c:set var = "i" value = "1"/> 
					<td>
					<c:forEach var="var" items="${listClass }"> 
						<input type = "checkbox" name = "t_major"  value = "${var.c_name }">${var.c_name }
						<c:if test="${i%2 eq 0 }">
							<br>
						</c:if>
						<c:set var = "i" value = "${i + 1 }"/>
					</c:forEach> 
					</td>
				</tr> 
			<tr>
				<td colspan="3"><input type = "text" name = "t_edu"  style="width:300px;"" value = "${dto.t_edu }"></td>
			</tr>
			<tr>
				<td align="right" colspan="3"> <input type="submit" value = "수정하기"> </td>
			</tr>	
		</table>
		</form>
	</div>
	 --%>
	 
 	<%@ include file = "../footer.jsp" %>
</body>
</html>