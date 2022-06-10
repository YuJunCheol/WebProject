<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- index.jsp -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<div align="center">
		<h1>Motionis</h1>
		<form action="login.do" method="post">
			<div id ="__login_table">
				<div>
					<input type="checkbox" name ="check_save_user" value="check"> 아이디 저장			
				</div>
				<div>
					<input type = "text" name ="u_id" placeholder="아이디">
				</div>
				<div>
					<input type = "password" name ="u_pw" placeholder="비밀번호">				
				</div>
				<div>
					<button type = "submit">로그인</button>				
				</div>
				<div>
					<a href = "addUserForm.do">회원 가입</a>
				</div> 
			</div>
		</form>
	</div>
	
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js' />"></script>
</body>
</html>