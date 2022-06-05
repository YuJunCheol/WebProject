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
</body>
</html>