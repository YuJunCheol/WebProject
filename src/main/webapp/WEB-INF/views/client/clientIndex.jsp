<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>${u_code } �����</h1>
		
		<a href ="<c:url value= 'attendance.do?u_code='+${u_code }/>" >�⼮üũ �ϱ�.</a>
		
	</div>
</body>
</html>