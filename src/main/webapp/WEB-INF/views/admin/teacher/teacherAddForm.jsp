<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��� ������</title>
</head> 
<body>
	<div align="center"> 
		<h1>���� ��� ������</h1>
		<form name = "f" action="inputTeacher.do" method="post" enctype="multipart/form-data">
			<table>
				<tr> 
					<th>�����</th><td><input type ="text" name ="t_name"></td>
				</tr>
				<tr>
				<th>����</th>
					<c:set var = "i" value = "1"/> 
					<td>
					<c:forEach var="var" items="${listClass }"> 
						<input type = "checkbox" name = "t_major"  value = "${var.c_name }">${var.c_name }
						<c:if test="${i%2 eq 0 }">
							<br>
						</c:if>
						<c:set var = "i" value = "${i + 1 }"/>
					</c:forEach> 
					</td>
				</tr> 
				<tr> 
					<th>�з�</th><td><input type ="text" name ="t_edu"></td>
				</tr>
				<tr> 
					<th>����</th><td><input type ="file" name ="t_img"></td> 
				</tr>
				<tr>
					<td>
						<input type ="submit" value="���">
					</td>
				</tr>
			</table>
		</form>
		<button onclick="location = 'teacherIndex.do'">����</button>
	</div>
</body>
</html>