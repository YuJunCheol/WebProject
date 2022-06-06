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
		<a href = "studentIndex.do">학생 목록 페이지.</a>
		<a href = "classIndex.do">강의 목록 페이지.</a>
		<a href = "teacherIndex.do">강사 목록 페이지</a>
	</div>
	
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js' />"></script>
</body>
</html>