<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../top.jsp" %>
	<div align="center">
		<h1>학생 목록 페이지</h1> 
		<input type = "button" value ="학생등록" onclick = "location.href='addStudentForm.do'">
		<table border="1"> 
			<tr>
				<th>학생이름</th><% for (int i = 1; i <= 12; i++ ) {
					%><th><%=i %>월</th><%
				}
				%> 
			</tr>
			<c:if test="${empty listStudent }">
				<tr>
					<td colspan="6">등록되어있는 학생이 없습니다.</td>
				</tr>
			</c:if>
			
			
					
		</table>
	</div>
</body>
</html>
