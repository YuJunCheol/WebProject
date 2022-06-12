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
		<h1>${u_code } 강사님</h1>
		
		<a href ="<c:url value= 'attendance.do?u_code='+${u_code }/>" >출석체크 하기.</a>
		
	</div>
</body>
</html>