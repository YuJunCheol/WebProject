<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "../top.jsp" %>
	<div align="center">
		<h1>�л� ��� ������</h1> 
		<input type = "button" value ="�л����" onclick = "location.href='addStudentForm.do'">
		<table border="1"> 
			<tr>
				<th>�л��̸�</th><% for (int i = 1; i <= 12; i++ ) {
					%><th><%=i %>��</th><%
				}
				%> 
			</tr>
			<c:if test="${empty listStudent }">
				<tr>
					<td colspan="6">��ϵǾ��ִ� �л��� �����ϴ�.</td>
				</tr>
			</c:if>
			
			
					
		</table>
	</div>
</body>
</html>
