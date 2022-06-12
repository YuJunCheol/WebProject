<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../admin/top.jsp" %>
	<title>Motionis :: 강사 페이지</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "./header.jsp" %>

	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">강사 페이지</li>
	    <li class="breadcrumb-item " aria-current="page">출석부</li>
	  </ol>
	</nav>
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>출석부</b></h1>
			
			<div class="col-sm-12 col-md-6">
				<form action="insertCheck.do" method="post" onsubmit="return test(this);">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-12 col-md-6 mb-2">
									<div class="row">
									    <label for="t_name" class="col-sm-3 col-form-label"><b>강사명</b></label>
									    <div class="col-sm-9">
									    	<input type="text" readonly class="form-control-plaintext" id="t_name" name="t_name" value="${data }">
									    </div>
						 			</div>
								</div>
								<div class="col-sm-12 col-md-6 mb-2">
									<div class="row">
									    <label for="t_name" class="col-sm-3 col-form-label"><b>강의</b></label>
									    <div class="col-sm-9">
								      		<select class="form-select" name = "c_code" id="__c_code" onchange="getClassList()">
												<c:forEach var = "data" items="${ct_list }">
													<option value = ${data.c_code } selected="selected" >${data.c_name }
												</c:forEach>
											</select>
									    </div>
						 			</div>
								</div>
								<div class="col-sm-12 col-md-6 mb-2">
									<div class="row">
									    <label for="t_name" class="col-sm-3 col-form-label"><b>날짜</b></label>
									    <div class="col-sm-9" id="__day">
									    	<%-- <input type="text" readonly class="form-control-plaintext" id="t_name" name="t_name" value="${data }"> --%>
									    </div>
						 			</div>
								</div>
								<div class="col-sm-12 col-md-6 mb-2">
								</div>
							</div>
						</div>
					</div>
					
					<h6 class="mt-3 mb-2 text-muted"><b><span class="text-danger">*</span> 출결 입력</b> </h6>
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-12" id="__student">
								</div>
							</div>
						</div>
					</div>
					
					<div class="d-grid gap-3 d-flex justify-content-center align-items-center mt-5">
		  				<input type="reset" value="초기화" class="btn btn-secondary w-100">
 			    		<input type="submit" value = "등록" class="btn btn-danger w-100">
		  			</div>
				</form>
			</div>
			
		</div>
	</div>

	<%-- 
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
	 --%>
	
	<%@ include file = "../admin/footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
	
	<script>
		$(document).ready(function() {	
			getClassList();
			
		});
		
		function test(obj) {
			console.log('obj : ', obj )
			console.log("serialize : ", $(obj).serialize());
			return true;
		}
	
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
					
					let htmlDate = ``;
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
									htmlDate += '<input id ="class_ct_code" type="hidden" name="ct_code" value="' + result[i].ct_code + '" >';
									htmlDate += '<input type="text" readonly class="form-control-plaintext" id="to_day" name="to_day" value="' + to_day + '">';
								}
							}
						}
					}
					console.log('htmlDate : ', htmlDate);
					document.getElementById('__day').innerHTML = htmlDate;
					getStSelctList();
				}
			});
		}
		
		function getStSelctList() {
			const val = document.getElementById('class_ct_code').value;
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
					console.log(result);
					
					let html="";
					for(let i =0; i < result.length; i++) {
						
						for(let r=0; r<stList.length; r++) {
							
							if(result[i].s_code == stList[r].s_code){
							
								if(result[i].c_payCheck ="수강"){
									html += `<input name = "s_code" type = "hidden" value = "\${stList[r].s_code}">	
									<div class="row mb-2">
										<label for="t_name" class="col-sm-4 col-form-label">\${stList[r].s_name} 출석 현황  </label>
										<div class="col-sm-8">
											<select class="form-select" name = "ck_status" >
												<option value = "출석" selected="selected"> 출석</option>
												<option value = "지각"> 지각</option>
												<option value = "결석"> 결석</option>
											</select>
										</div>
									</div>`;
								}
							}
						}
					}
					selectedStudent.innerHTML = html;
					
				}
			});
		}
	</script>
</body>
</html>