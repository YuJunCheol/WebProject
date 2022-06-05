<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../top.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div align="center">
		<h1>���� ��� ������.</h1>
		<input type = "button" value ="������" onclick = "location.href='addTeachertForm.do'">
		<table border="1">
			<c:if test="${empty listTeacher }">
				<tr>
					<td>��ϵǾ��ִ� ���簡 �����ϴ�.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${listTeacher}">
				<tr>
					<td rowspan ="3"><a href = "teacherInfo.do?t_code=${dto.t_code }"><img alt="${dto.t_img }" src="resources/img/${dto.t_img }"></a></td><td>${dto.t_name }</td>
				</tr>
				<tr>
					<td>
					<c:forEach var = "major" items="${fn:split(dto.t_major,',') }">
						${major } <br>
					</c:forEach> 
					</td> 
				</tr>
				<tr>
					<td>${dto.t_edu }</td> 
				</tr>			
			</c:forEach>
		</table>
	</div>
</body>
</html>
