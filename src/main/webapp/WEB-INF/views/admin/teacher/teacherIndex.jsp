<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: 강사현황</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>

	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 15px 30px 5px 10px;">
	    <li class="breadcrumb-item ">강사 관리</li>
	    <li class="breadcrumb-item " aria-current="page">강사 현황</li>
	  </ol>
	</nav>	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis 강사 현황</b></h1>
			
			<a href="addTeachertForm.do" class="btn btn-primary">강사등록</a>
			
			<c:if test="${empty listTeacher }">
				<table border="1">
					<tr>
						<td>등록되어있는 강사가 없습니다.</td>
					</tr>
				</table>
			</c:if>
			<div class="row">
				<c:forEach var="dto" items="${listTeacher}">
					<div class="col-6 gy-4">
						<div class="card">
							<div class="bg-dark p-2 d-flex flex-column justify-content-center align-items-center" style="min-height: 220px;">
						  		<a href="teacherInfo.do?t_code=${dto.t_code }">
									<%-- <img alt="${dto.t_img }" src="resources/img/${dto.t_img }" > --%>
									<img src="resources/img/${dto.t_img }" onerror="this.src='resources/img/no-image-icon.png';"/>
								</a>
							</div>
					  		<div class="card-body d-flex flex-column justify-content-between" style="min-height: 280px;">
					  			<div>
					  				<h5 class="card-title">${dto.t_name }</h5>
							    	<p class="card-text">
							    		<c:forEach var = "major" items="${fn:split(dto.t_major,',') }">
											${major } <br>
										</c:forEach>
										<br/>
										${dto.t_edu }
							    	</p>
					  			</div>
						    	<a href="teacherInfo.do?t_code=${dto.t_code }" class="btn btn-primary">상세보기</a>
						  	</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<%-- 
			<table border="1">
				<c:if test="${empty listTeacher }">
					<tr>
						<td>등록되어있는 강사가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listTeacher}">
					<tr>
						<td rowspan ="3">
							<a href = "teacherInfo.do?t_code=${dto.t_code }">
								<img alt="${dto.t_img }" src="resources/img/${dto.t_img }">
							</a>
						</td>
						<td>${dto.t_name }</td>
					</tr>
					<tr>
						<td>
						<c:forEach var = "major" items="${fn:split(dto.t_major,',') }">
							${major } <br>
						</c:forEach> 
						</td> 
					</tr>
					<tr>
						<td>${dto.t_edu }</td> 
					</tr>			
				</c:forEach>
			</table>
			 --%>
		</div>
	</div>
	
	
	<%@ include file = "../footer.jsp" %>
</body>
</html>
