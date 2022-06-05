<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- classInfo.jsp -->
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<script type="text/javascript">
	
	function check(){
	
		var isChecked = false;
		var c_day = document.getElementsByName("c_day");
		
		for(var i = 0; i<c_day.length; i++) {
			if(c_day[i].checked == true) {
				isChecked = true;
				break;
			}
		}
		
		if(!isChecked) {
			alert("���������� �������ּ���");
			return false
		}
		
		return true;
	}

</script>
</head>
<body>
	<div align="center">
		<h1>���� ���</h1> 
		<form name = "f" onsubmit="return show()" action="updateClass.do" method="post" onsubmit="return check()">
			<table>
				<tr>
					<input type = "hidden" name = "c_code" value = "${dto.c_code }">
				</tr>
				<tr>
					<th>���Ǹ�</th> 
					<td><input type = "text" name ="c_name" value = "${dto.c_name }"></td>
				</tr>
				<tr>
					<th>�����</th> <!-- �Ŀ� ���� ��� �� ���縦 �ҷ��� ������ �� �ֵ��� ����. -->
					<td><input type = "text" name ="c_teacher" value = "${dto.c_teacher }"></td>
				</tr>
				<tr>
					<th>������</th> 
					<td><input type = "text" name ="c_start" value = "${dto.c_start }"></td>
				</tr>
				<tr>
					<th>���� �ð�</th> 
					<td><input type ="time" name ="c_start_time" value = "${dto.c_start_time }"> ~ <input type ="time" name ="c_end_time" value = "${dto.c_end_time }"></td>
				</tr>
				<tr>
					<th>������</th> 
					<td><input type ="text" name ="c_end" value = "${dto.c_end }"></td>
				</tr>
				<tr>
					<th>��������</th> 
					<td>
						<input type ="checkbox" name = "c_day" value = "��">��
						<input type ="checkbox" name = "c_day" value = "ȭ">ȭ
						<input type ="checkbox" name = "c_day" value = "��">��
						<input type ="checkbox" name = "c_day" value = "��">��
						<input type ="checkbox" name = "c_day" value = "��">��
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type ="number" name = "c_max" value = "${dto.c_max }"></td>
				</tr>
				<tr>
					<th>������</th>
					<td><input type ="number" name = "c_tuition" value = "${dto.c_tuition }"></td>
				</tr>
				<tr align="center">
					<td><input type ="submit" value = "����">	</td>
					<td><input type ="button" value ="����" onclick="location = 'deleteClass.do?c_code=${dto.c_code}'"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>