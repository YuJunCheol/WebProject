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
		<h1><a href ="index.do">로그아웃</a></h1>
		<form id="dddd" action="insertCheck.do" method="post" onsubmit="return test(this);">
			<table id = "__check_class_list" border="1" width = "600">
				<tr>
					<th>강사 명</th>
					<th>${data }</th>
					<th>강의</th>
					<td>
						<input name = "t_name" type = "hidden" value="${data }">
						<select name = "c_code" id="__c_code" onchange="getClassList()">
							<c:forEach var = "data" items="${ct_list }">
								<option value = ${data.c_code } selected="selected" >${data.c_name }
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr id ="__day"></tr>
				<tr><th colspan="4">출석부</th></tr>
				<tr id ="__student"></tr>
				<tr>
					<td colspan="4" align="center"><input type = "submit" value=등록></td>
				</tr>
				
			</table>
		</form>
		
		
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script>

function test(obj) {
	console.log('obj : ', obj )
	console.log("serialize : ", $(obj).serialize());
	return true;
	
}

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
			const to_day = moment().format("YYYY-MM-DD");
			
			let htmlDate=`<th>날자</th>`;
			htmlDate +=`<td>`; 
			for(let i = 0; i < result.length; i++) {
				let sy = result[i].c_start_day.substring(0,4);
				let ey = result[i].c_end_day.substring(0,4);
				
				let sm = result[i].c_start_day.substring(5,7);
				let em = result[i].c_end_day.substring(5,7);
				
				let sd = result[i].c_start_day.substring(8,10);   
				let ed = result[i].c_end_day.substring(8,10)
				if(sy <= year && year <= ey) {
					if(sm <= month && month <= em){
						if(sd <= day && day <= ed) {
							htmlDate += `<input id ="class_ct_code" type="hidden" name="ct_code" value="\${result[i].ct_code}" >
										 <input type="hidden" name="to_day" value="\${to_day}" >
										 \${to_day}`;
						}
					}
				}
			}
			htmlDate +=`</td>`;
			document.getElementById('__day').innerHTML = htmlDate;
			getStSelctList();
		}
		 
	});
}

function getStSelctList() {
	const val = document.getElementById('class_ct_code').value;
	const selectedStudent = document.getElementById('__student');
	const stList = JSON.parse('${studentList}');
	//	console.log(val);
	$.ajax({
		url : "getStudentCheckList.do",
		type : "POST",
		dataType: 'json',
        contentType: 'application/json;', 
		data :JSON.stringify({
			ct_code : val
		}),
		success : function(result) {
			console.log(result);
			
			let html="";
			for(let i =0; i < result.length; i++) {
				
				for(let r=0; r<stList.length; r++) {
					
					if(result[i].s_code == stList[r].s_code){
					
						if(result[i].c_payCheck ="수강"){
							html += `
							<input name = "s_code" type = "hidden" value = "\${stList[r].s_code}">	
							<div>\${stList[r].s_name}
								출석 현황 	
								<select name = "ck_status" >
									<option value = "출석" selected="selected"> 출석</option>
									<option value = "지각"> 지각</option>
									<option value = "결석"> 결석</option>
								</select>
							</div>`;
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