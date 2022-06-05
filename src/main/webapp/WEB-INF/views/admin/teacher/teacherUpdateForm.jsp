<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- teacherUpdateForm.jsp -->
<html>
<head>
<meta charset="EUC-KR">
<title>${dto.t_name }정보 수정</title>
</head>
<body>
	<div align="center">
		<h1>강사 정보 수정</h1>  
		<form name = "f" action="teaherUpdate.do" method="post">
			<input name = "t_code" type = "hidden" value ="${dto.t_code }">
			<table border="1">
			<tr>
				<td rowspan ="3"><img alt="${dto.t_img }" src="resources/img/${dto.t_img }"></td><td colspan="3"><input type = "hidden" value = "${dto.t_name }">${dto.t_name }</td>
			</tr>
			<tr>
				<th>수업</th>
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
				<td colspan="3"><input type = "text" name = "t_edu"  style="width:300px;"" value = "${dto.t_edu }"></td>
			</tr>
			<tr>
				<td align="right" colspan="3"> <input type="submit" value = "수정하기"> </td>
			</tr>	
		</table>
		</form>
	</div>
</body>
</html>