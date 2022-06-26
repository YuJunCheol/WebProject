<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: 강의 수정</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>
	
	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">강의 관리</li>
	    <li class="breadcrumb-item ">강의 현황</li>
	    <li class="breadcrumb-item ">강의 수정</li>
	  </ol>
	</nav>
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis 강의 수정</b></h1>
			
			<div class="col-sm-12 col-md-5">
				<div class="card">
					<div class="card-body">
						<form action="updateClassCate.do" method = "post">
							<input type = "hidden" name ="c_code" value = "${classDto.c_code }">
							<div class="mt-2 row">
							    <label for="c_name" class="col-sm-3 col-form-label"><b>강의명</b></label>
							    <div class="col-sm-9">
						      		<input type="text" class="form-control" id="c_name" name="c_name" placeholder="강의명을 입력하세요." value="${classDto.c_name }">
							    </div>
				 			</div>
				 			<hr/>
				 			<div class="mt-2 row">
							    <label for="c_teacher" class="col-sm-3 col-form-label"><b>강사명</b></label>
							    <div class="col-sm-9">
						      		<input type="text" class="form-control" id="c_teacher" name="c_teacher" placeholder="강사명을 입력하세요." value="${classDto.c_teacher }">
							    </div>
				 			</div>
				 			<hr/>
				 			<div class="mt-2 row">
							    <label for="c_tuition" class="col-sm-3 col-form-label"><b>수강료</b></label>
							    <div class="col-sm-9">
						      		<input type="text" class="form-control" id="c_tuition" name="c_tuition" placeholder="수강료를 입력하세요." value="${classDto.c_tuition }">
							    </div>
				 			</div>
				 			
				 			<div class="d-grid gap-3 d-flex justify-content-center align-items-center mt-4">
				  				<a href="classIndex.do" class="btn btn-secondary w-100">취소</a>
					    		<input type="submit" value = "수정" class="btn btn-danger w-100">
				  			</div>
			 			</form>
		 			</div>
	 			</div>
 			</div>
		</div>
	</div>
	
	<%-- 
	<div align="center">
		<hr width = "300" color = "green">
		<h1>강의 카테고리 수정</h1>
		<hr width = "300" color = "green">
		<input type = "hidden" value="${classDto.c_code }">
		<form action="updateClassCate.do" method = "post">
			<input type = "hidden" name ="c_code" value = "${classDto.c_code }">
			<table border="1" width = "600">
				<tr>
					<th>강의명</th> <td> <input type = "text" name ="c_name" value = "${classDto.c_name }"></td>
				</tr>
				<tr>
					<th>강사명</th> <td><input type = "text" name ="c_teacher" value = "${classDto.c_teacher }"></td>
				</tr>
				<tr>
					<th>수강료</th> <td><input type = "text" name =c_tuition value = "${classDto.c_tuition }"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type = "submit" value  ="수정하기"></td>
				</tr>
			</table>
		</form>
	</div>
 	--%>
	
	<%@ include file = "../footer.jsp" %>
</body>
</html>