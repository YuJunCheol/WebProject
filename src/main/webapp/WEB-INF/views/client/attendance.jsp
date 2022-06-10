<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id ="" align="center">
		<h1><a href ="index.do">Motionis</a></h1>
		<table id = "__check_class_list" border="1" width = "600">
			<tr>
				<th>강사 명</th>
				<th>${data }</th>
				<th>강의</th>
				<td>
					<select id="__c_code" onchange="getClassList()">
						<c:forEach var = "data" items="${ct_list }">
							<option value = ${data.c_code } selected="selected" >${data.c_name }
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr id ="__day"></tr>
			<tr><th colspan="4">출석부</th></tr>
			<tr id ="__student"></tr>
			
		</table>
		
		
		
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

const table = document.getElementById('__check_class_list');
function getClassList(){
	let c_code = document.getElementById('__c_code').value;
	$.ajax({
		url : "getClassList.do",
		type : "POST",
		dataType: 'json',
        contentType: 'application/json;', 
		data :JSON.stringify({
			c_code : c_code
		}),
		success : function(result) {
			let today = new Date(); 
			let year = today.getFullYear();
			let month = today.getMonth() + 1;
			let day = today.getDate();
			let htmlDate=""; 
			htmlDate +='<th>날자</th><td><select id="__getStct_code" onchange = "getStSelctList()">'; 
			for(let i = 0; i < result.length; i++) {
				htmlDate += `<option value = "\${result[i].ct_code}" selected="selected" >\${result[i].c_start_day}</option>`;
			}
			htmlDate +='</td></select>';
			console.log(htmlDate);
			document.getElementById('__day').innerHTML = htmlDate;
		}
		 
	});
}

function getStSelctList() {
	const val = document.getElementById('__getStct_code').value;
	const selectedStudent = document.getElementById('__student');
	const stList = JSON.parse('${studentList}');
	
	$.ajax({
		url : "getStudentCheckList.do",
		type : "POST",
		dataType: 'json',
        contentType: 'application/json;', 
		data :JSON.stringify({
			ct_code : val
		}),
		success : function(result) {
			
			let html="";
			for(let i =0; i < result.length; i++) {
				for(let r=0; r<stList.length; r++) {
					if(result[i].s_code = stList[r].s_code){
						if(result[i].c_payCheck ="수강"){
							console.log("학생이름 : ", stList[r].s_name)
							html += `<p>\${stList[r].s_name}
								출석 <select name = "ck_check">
 										<option value = "출석"> 출석
 										<option value = "지각"> 지각
 										<option value = "결석"> 결석
									</select>
 										</p>
								`;							
						}
					}
				}
			}
			selectedStudent.innerHTML = html;
			
		}
	});
	
}

$(document).ready(function() {	
	getClassList();
	
}); 
 
</script>
</body>
</html>