<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div id="headder">
			<h1>Motionis 회원가입</h1>
		</div>
		<form action="addUser.do">
			<table border="1" width = "300">
				<tr>
					<th>ID</th>
					<td>
						<input type = "text" name = "u_id">
					</td>
				</tr>
				<tr>
					<th>PW</th>
					<td>
						<input type = "password" name = "u_pw">
					</td>
				</tr>
				<tr>
					<th>강사</th>
					<td id ="__add_user_selecter">
						
					</td>					
				</tr>
				<tr>
					<th>권한</th>
					<td>
						 <input type="radio" name = "u_access" value = "admin">관리자
						 <input type="radio" name = "u_access" value = "teacher" checked="checked">강사
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type = "submit" value="회원 가입">
					</td>
				</tr>
			</table>
		</form>
		<div>
			
		</div>
	</div>
	
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
function getUserList() {
	
	const selecter = document.getElementById('__add_user_selecter');
	let html;
	$.ajax({
		url : "selectTeacherList.do",
		type : "POST",
		dataType: 'json',
        contentType: 'application/json;',
        success : function(result) {
        	console.log(result);
        	html = `<select name = "u_code">`;
        	for(let count = 0; count < result.length; count++) {
        		console.log(result[count].t_name);
        		html += `<option value = "\${result[count].t_code}">\${result[count].t_name}`;
        	}
        	html += `</select>`;
	        selecter.innerHTML += html;
        }
	});
	
	
}

$(document).ready(function() {
	getUserList();

})

</script>
</body>
</html>