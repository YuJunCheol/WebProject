<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../admin/top.jsp" %>
	<title>Motionis :: ȸ������</title>
</head>
<body class="d-flex flex-column justify-content-center align-items-center min-vh-100" style="background-color: #f5f5f5;">
	
	<div class="container">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis ȸ������</b></h1>
			
			<div class="col-sm-12 col-md-4">
				<form action="addUser.do"> 
					<div class="form-floating mb-1"> 
					  <input type="text" class="form-control" id="u_id" name="u_id" placeholder="ID�� �Է��ϼ���.">
					  <label for="u_id">���̵�</label>
					</div>
					<div class="form-floating mb-1">		
					  <input type="password" class="form-control" id="u_pw" name="u_pw" placeholder="��й�ȣ�� �Է��ϼ���.">
					  <label for="u_pw">��й�ȣ</label>
					</div>
					<div class="form-floating mb-1" id="__add_user_selecter">
						<!-- ���� -->
					</div>
					<div class="mt-2 row align-items-center">
					    <label for="u_access2" class="col-sm-3 col-form-label"><b>����</b></label>
					    <div class="col-sm-9">
					    	<div class="form-check form-check-inline">
			 		 			<input class="form-check-input" type="radio" name="u_access" id="u_access2" value="teacher" checked="checked">
							  	<label class="form-check-label" for="u_access2">����</label>
							</div>
				      		<div class="form-check form-check-inline">
						  		<input class="form-check-input" type="radio" name="u_access" id="u_access1" value="admin">
						  		<label class="form-check-label" for="u_access1">������</label>
							</div>
					    </div>
		 			</div>
			
		 			
		 			<button class="w-100 btn btn-lg btn-primary mt-3 mb-5" type="submit">ȸ������ </button>
					
					<div class="w-100 text-center">
						<a href="<c:url value='/' />">�α���</a>
					</div>
					
					<p class="mt-4 text-muted text-center">Copyright &#64; 2019 MOTIONIS Academy.</p>
				</form>
			</div>
		</div>
	</div>
	
	
	<!-- 
	<div align="center">
		<div id="headder">
			<h1>Motionis ȸ������</h1>
		</div>
		<form action="addUser.do">
			<table border="1" width = "300">
				<tr>
					<th>ID</th>
					<td>
						<input type = "text" name = "u_id">
					</td>
				</tr>
				<tr>
					<th>PW</th>
					<td>
						<input type = "password" name = "u_pw">
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td id ="__add_user_selecter">
						
					</td>					
				</tr>
				<tr>
					<th>����</th>
					<td>
						 <input type="radio" name = "u_access" value = "admin">������
						 <input type="radio" name = "u_access" value = "teacher" checked="checked">����
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type = "submit" value="ȸ�� ����">
					</td>
				</tr>
			</table>
		</form>
		<div>
			
		</div>
	</div>
	 -->
	
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js' />"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
	function getUserList() {
		
		const selecter = document.getElementById('__add_user_selecter');
		let html;
		$.ajax({
			url : "selectTeacherList.do",
			type : "POST",
			dataType: 'json',
	        contentType: 'application/json;',
	        success : function(result) {
	        	console.log(result);
	        	html = `<select class="form-select" name = "u_code" id="u_code" >`;
	        	for(let count = 0; count < result.length; count++) {
	        		console.log(result[count].t_name);
	        		html += `<option value = "\${result[count].t_code}">\${result[count].t_name}`;
	        	}
	        	html += `</select>`;
	        	html += ` <label for="u_code">����</label>`;
		        selecter.innerHTML += html;
	        }
		});
		
		
	}
	
	$(document).ready(function() {
		getUserList();
	
	})
	
	</script>
</body>
</html>