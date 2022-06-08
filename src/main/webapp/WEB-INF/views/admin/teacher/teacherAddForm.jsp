<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: 강사등록</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>


	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">강사 관리</li>
	    <li class="breadcrumb-item " aria-current="page">강사 현황</li>
	    <li class="breadcrumb-item " aria-current="page">강사 등록</li>
	  </ol>
	</nav>
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis 강사 등록</b></h1>
			
			<div class="col-sm-12 col-md-5">
				<div class="card">
					<div class="card-body">
						<form name = "f" action="inputTeacher.do" method="post" enctype="multipart/form-data">
							<div class="mt-2 row">
							    <label for="t_name" class="col-sm-3 col-form-label"><b>강사명</b></label>
							    <div class="col-sm-9">
						      		<input type="text" class="form-control" id="t_name" name="t_name" placeholder="강사명을 입력하세요.">
							    </div>
				 			</div>
				 			<hr/>
				 			<div class="mt-2 row">
							    <label for="t_name" class="col-sm-3 col-form-label"><b>수업</b></label>
							    <div class="col-sm-9">
								    <c:forEach var="var" items="${listClass }"> 
					  					<div class="form-check">
										  <input class="form-check-input" type="checkbox" name="t_major" value="${var.c_name }" id="${var.c_name }">
										  <label class="form-check-label" for="${var.c_name }">
										    ${var.c_name }
										  </label>
										</div>
									</c:forEach>
							    </div>
				 			</div>
				 			<hr/>
				 			<div class="mt-2 row">
							    <label for="t_edu" class="col-sm-3 col-form-label"><b>학력</b></label>
							    <div class="col-sm-9">
						      		<input type="text" class="form-control" id="t_edu" name="t_edu" placeholder="학력을 입력하세요.">
							    </div>
				 			</div>
				 			<hr/>
				 			<div class="mt-2 row">
							    <label for="t_img" class="col-sm-3 col-form-label"><b>사진</b></label>
							    <div class="col-sm-9">
						      		<input type="file" class="form-control" id="t_img" name="t_img" placeholder="학력을 입력하세요.">
							    </div>
				 			</div>
				 			
				 			<div class="d-grid gap-3 d-flex justify-content-center align-items-center mt-4">
				  				<a href="teacherIndex.do" class="btn btn-secondary w-100">취소</a>
					    		<input type="submit" value = "등록" class="btn btn-danger w-100">
				  			</div>
			 			</form>
		 			</div>
	 			</div>
 			</div>
		</div>
	</div>
	
	<%-- 
	<div align="center"> 
		<h1>강사 등록 페이지</h1>
		<form name = "f" action="inputTeacher.do" method="post" enctype="multipart/form-data">
			<table>
				<tr> 
					<th>강사명</th><td><input type ="text" name ="t_name"></td>
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
					<th>학력</th><td><input type ="text" name ="t_edu"></td>
				</tr>
				<tr> 
					<th>사진</th><td><input type ="file" name ="t_img"></td> 
				</tr>
				<tr>
					<td>
						<input type ="submit" value="등록">
					</td>
				</tr>
			</table>
		</form>
		<button onclick="location = 'teacherIndex.do'">이전</button>
	</div>
	 --%>
	<%@ include file = "../footer.jsp" %>
</body>
</html>