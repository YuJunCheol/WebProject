<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta charset="EUC-KR">
<title>�л� ����</title>

		<script type="text/javascript">
		
		function checkDel(s_code){
			var isDel = window.confirm("������ �����Ͻðڽ��ϱ�?")
			if (isDel){
				location.href="deleteStudent.do?s_code=" + s_code
			}
		}
			
		</script>

</head>
<body>
	<div align="center" >
	<h1>�л� ������Ʈ</h1>
		<form action="studentUpdate.do" name = "f" method = "post">
			<input type = "hidden" name = "s_no" value = "${student.s_no }">
			<input type = "hidden" name = "s_code" value = "${student.s_code }">l
			<table border="1" >
				<tr>
					<th>�л� �̸�</th><td><input type = "text" name = "s_name" value = "${student.s_name }"></td>
				</tr>
				<tr>
					<th>�л� ����</th><td><input type = "text" name = "s_barth" value = "${student.s_barth }"></td>
				</tr>
				<tr>
					<th>�л� ��ȣ</th><td> <input type = "text" name = "s_call" value = "${student.s_call }"></td>
				</tr>
				<tr>
					<th>�л� �ּ�</th><td> <input type = "text" name = "s_addr" value = "${student.s_addr }"></td>
				</tr>
				<tr>
					<th>�б�</th><td><input type = "text" name = "s_school" value = "${student.s_school }"></td>
				</tr>
				<tr>
					<th>����</th><td><input type = "text" name = "s_dept" value = "${student.s_dept }"></td>
				</tr>
				<tr>
					<th>�̸���</th><td> <input type ="text" name = "s_email" value = "${student.s_email } "></td>
				</tr>
				<tr>
					<th>����</th><td><input type = "text" name = "s_work" value = "${student.s_work }"></td>
				</tr>
				<tr>
					<th>������</th><td><input type = "text" name = "s_join" value = "${student.s_join }"></td>
				</tr>
				<tr>
					<th>���� �̷�</th> 
					<c:if test="${student.s_class_discount eq 1 }">
						<td>����</td>
					</c:if>
					<c:if test="${student.s_class_discount eq 0 }">
						<td>����</td>
					</c:if>
					<input type = "hidden" name = "s_class_discount" value = "${student.s_class_discount }">
				</tr>
				<tr>
					<c:if test="${student.s_class_card eq 1}">
						<th>���� ���</th><td>ī��</td>					
					</c:if>
					<c:if test="${student.s_class_card eq 0}">
						<th>���� ���</th><td>����</td>					
					</c:if>
					<input type = "hidden" name = "s_class_card" value = "${student.s_class_card }">
				</tr>
				
				<tr>
					<th>���� ���� �� </th><th>������Ȳ</th>
				</tr>
				<tr>
					<c:forEach var = "cl" items="${listClass }">
						<c:forEach var = "ji" items="${listJoin }">
							<c:if test="${cl.c_code eq ji.jc_code }">
								<td>${cl.c_name }</td>
								<c:if test="${ji.payInfo eq 1}">
									<td align="center">���� <input type = "button" value ="����" onclick= "location='payInfo.do?code=0&s_code=${student.s_code }&j_code=${ji.j_code}'")> </td>										
								</c:if>
								<c:if test="${ji.payInfo ne 1}">
									<td  align="center">�̳� <input type = "button" value ="����" onclick= "location='payInfo.do?code=1&s_code=${student.s_code }&j_code=${ji.j_code}'")> </td>									
								</c:if>
							</c:if> 
						</c:forEach>
					</c:forEach>
				</tr>
				
				<tr>
					<td align="center" colspan="2">
						<button type = "submit">����</button>
						<button type = "button" onclick="javascript:checkDel('${student.s_code}')">����</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>