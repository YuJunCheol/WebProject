<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function show() {
		if(f.c_name.value == "") {
			alert("���Ǹ��� �Է����ּ���.")
			return false
		} if (f.cteacher.value == "") {
			alert("������� �Է����ּ���.")
			return false
		} if (f.c_tuition.vlaue == "") {
			alert("������ �� ������ �ּ���.")
			return false
		} 
		return true
	}
	 
</script>
</head>   
<body>    
	<div align="center">  
		<h1>���� ���</h1> 
		<form name = "f" onsubmit="return show()" action="inputClass.do" method="post">
			<table>
				<tr>
					<th>���Ǹ�</th> 
					<td><input type = "text" name ="c_name"></td>
				</tr>
				<tr>
					<th>�����</th> <!-- �Ŀ� ���� ��� �� ���縦 �ҷ��� ������ �� �ֵ��� ����. -->
					<td><input type = "text" name ="c_teacher"></td>
				</tr>
				<tr>
					<th>������</th>
					<td><input type ="text" name = "c_tuition">��</td> 
				</tr>
				<tr align="center">
					<td colspan="2"><input type ="submit" value = "���">	</td>
				</tr>
			</table>
		</form>
		
		
	</div>
	
</body>
</html>