<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${dto.t_name }강사 정보 페이지</title>
</head> 
<body>

<script>
	function checkDel(code, img){
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="deleteTeacher.do?code=" + code + "&img=" + img 
		}
	}
</script> 

	<div align="center">
	<h1>강사 정보</h1>
		<table>
			<tr>
				<td rowspan ="3"><img alt="${dto.t_img }" src="resources/img/${dto.t_img }"></td><td>${dto.t_name }</td>
			</tr>
			<tr>
				<td>${dto.t_major }</td>
			</tr>
			<tr>
				<td>${dto.t_edu }</td>
			</tr>	
		</table>
		<input type = "button" value = "수정" onclick = "location='updateTeacherForm.do?code=${dto.t_code}'">
		<input type = "button" value = "삭제" onclick="checkDel('${dto.t_code}', '${dto.t_img }')">
	</div>
</body>
</html>