<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "./admin/top.jsp" %>
	<title>Motionis :: �α���</title>
</head>
<body class="d-flex flex-column justify-content-center align-items-center min-vh-100" style="background-color: #f5f5f5;">

	<div class="container">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis</b></h1>
			
			<div class="col-sm-12 col-md-4">
				<form action="login.do" method="post">
					<div class="form-floating mb-1">
					  <input type="text" class="form-control" id="u_id" name="u_id" placeholder="���̵�">
					  <label for="u_id">���̵�</label>
					</div>
					<div class="form-floating mb-3">		
					  <input type="password" class="form-control" id="u_pw" name="u_pw" placeholder="��й�ȣ">
					  <label for="u_pw">��й�ȣ</label>
					</div>
					<div class="w-100 d-flex flex-column align-items-center mb-3">
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="check" name="check_save_user" id="check_save_user">
						  <label class="form-check-label" for="flexCheckDefault">���̵� ����</label>
						</div>
					</div>
					
					<button class="w-100 btn btn-lg btn-primary mb-5" type="submit">�α��� </button>
					
					<div class="w-100 text-center">
						<a href="addUserForm.do">ȸ�� ����</a>
					</div>
					
					<p class="mt-4 text-muted text-center">Copyright &#64; 2019 MOTIONIS Academy.</p>
				</form>
			</div>
		</div>
	</div>
	<!-- 
	<div align="center">
		<h1>Motionis</h1>
		<form action="login.do" method="post">
			<div id ="__login_table">
				<div>
					<input type="checkbox" name ="check_save_user" value="check"> ���̵� ����			
				</div>
				<div>
					<input type = "text" name ="u_id" placeholder="���̵�">
				</div>
				<div>
					<input type = "password" name ="u_pw" placeholder="��й�ȣ">				
				</div>
				<div>
					<button type = "submit">�α���</button>				
				</div>
				<div>
					<a href = "addUserForm.do">ȸ�� ����</a>
				</div>
			</div>
		</form>
	</div>
	 -->
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js' />"></script>
</body>
</html>