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
		<h1>���� ī�װ� ����</h1>
		<hr width = "300" color = "green">
		<input type = "hidden" value="${classDto.c_code }">
		<form action="updateClassCate.do" method = "post">
			<input type = "hidden" name ="c_code" value = "${classDto.c_code }">
			<table border="1" width = "600">
				<tr>
					<th>���Ǹ�</th> <td> <input type = "text" name ="c_name" value = "${classDto.c_name }"></td>
				</tr>
				<tr>
					<th>�����</th> <td><input type = "text" name ="c_teacher" value = "${classDto.c_teacher }"></td>
				</tr>
				<tr>
					<th>������</th> <td><input type = "text" name =c_tuition value = "${classDto.c_tuition }"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type = "submit" value  ="�����ϱ�"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>