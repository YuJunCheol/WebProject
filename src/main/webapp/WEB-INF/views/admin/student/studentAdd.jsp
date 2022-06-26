<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: �л����</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>
	
	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">�л� ����</li>
	    <li class="breadcrumb-item " aria-current="page">�л� ���</li>
	  </ol>
	</nav>	
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis �л� ���</b></h1>
			
			<div class="col-sm-12 col-md-5">
				<form action="inputStudent.do" method="post" >
					<h5 class="mt-3 mb-3 text-muted"><b><span class="text-danger">*</span> �л� ����</b> </h5>
					<div class="card">
						<div class="card-body">
							<div class="row g-2">
					            <div class="col-sm-6">
					              <label for="s_name" class="form-label"><b>�̸�</b></label>
					              <input type="text" class="form-control form-control-sm" id="s_name" name="s_name" placeholder="" required>
					            </div>
					            
					            <div class="col-sm-6">
					              <label for="s_barth" class="form-label"><b>�������</b></label>
					              <input type="text" class="form-control form-control-sm" id="s_barth" name="s_barth" placeholder="">
					            </div>
					            
					            <div class="col-sm-6">
					              <label for="s_email" class="form-label"><b>�̸���</b></label>
					              <input type="email" class="form-control form-control-sm" id="s_email" name="s_email" placeholder="">
					            </div>
					            
					            <div class="col-sm-6">
					              <label for="s_tel" class="form-label"><b>��ȭ��ȣ</b></label>
					              <input type="text" class="form-control form-control-sm" id="s_tel" name="s_call" placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
					            </div>
					
					            <div class="col-12">
					              <label for="s_addr" class="form-label"><b>�ּ�</b></label>
					              <input type="text" class="form-control form-control-sm" id="s_addr" name="s_addr" placeholder="">
					            </div>
					            
					            <div class="col-sm-6">
					              <label for="s_school" class="form-label"><b>�б�</b></label>
					              <input type="text" class="form-control form-control-sm" id="s_school" name="s_school" placeholder="">
					            </div>
					            
					            <div class="col-sm-6">
					              <label for="s_major" class="form-label"><b>����</b></label>
					              <input type="text" class="form-control form-control-sm" id="s_major" name="s_major" placeholder="">
					            </div>
					            
					            <div class="col-12">
					              <label for="s_work" class="form-label"><b>���� �� �μ�</b></label>
					              <input type="text" class="form-control form-control-sm" id="s_work" name="s_work" placeholder="���� �����Դϴ�.">
					            </div>
				            </div>
						</div>
					</div>
					
					<h5 class="mt-5 mb-3 text-muted"><b><span class="text-danger">*</span> ���� ����</b> <input class="btn btn-secondary btn-sm" id="__addClass" type="button" value="�߰�" onclick="addClass();"></h5>
					<div id="classArea">
					</div>
					<div class="card" id="classAreaEmpty">
						<div class="card-body">
							<span class="text-muted">���� ������ �߰� �ϼ���.</span>
						</div>
					</div>
					
					<h5 class="mt-5 mb-3 text-muted"><b><span class="text-danger">*</span> ���� ����</b> </h5>
					<div class="card">
						<div class="card-body">
							<div class="row g-3">
					            <div class="col-sm-3">
						            <div class="row align-items-center">
									    <label for="t_name" class="col-sm-5 col-form-label"><b>����</b></label>
									    <div class="col-sm-6">
											<div class="form-check form-switch">
											  <input class="form-check-input" type="checkbox" role="switch" name="s_disc" value="����" id="flexSwitchCheckDefault">
											</div>
									    </div>
						 			</div>
					            </div>
					            
					            <div class="col-sm-9">
					            	<div class="row align-items-center">
									    <label for="t_name" class="col-sm-3 col-form-label"><b>���� ���</b></label>
									    <div class="col-sm-9">
								      		<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="c_card" checked="checked" value="����" id="c_card1">
											  <label class="form-check-label" for="c_card1">����</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="c_card" value="ī��" id="inlineRadio2" value="c_card2">
											  <label class="form-check-label" for="c_card2">ī��</label>
											</div>
									    </div>
						 			</div>
					            </div>
				            </div>
			            </div>
		            </div>
		            
		            <div class="d-grid gap-3 d-flex justify-content-center align-items-center mt-5">
		  				<a href="studentIndex.do" class="btn btn-secondary w-100">���</a>
			    		<input type="submit" value = "���" class="btn btn-danger w-100">
		  			</div>
	  			</form>
			</div>
		</div>
	</div>	

	<!-- 
	<div id ="root" align="center">
		<hr width="300" color="green">
		<h1>�л� ��� ������</h1>
		<hr width="300" color="green">
		<form action="inputStudent.do" method="post" >
			<table id ="classTable" border="1">
				<tr>
					<th colspan="4">�л�</th>
				</tr>
				<tr>
					<th>�̸�</th><td><input type = "text" name ="s_name"></td><th>�������</th><td><input type ="text" name= "s_barth"/></td> 
				</tr>
				<tr>
					<th>�̸���</th><td><input type = "text" name ="s_email"></td>
					<th>��ȭ��ȣ</th>
					<td><input id = "s_tel" type="tel" name="s_call" placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"></td>
				</tr>
				<tr>
					<th>�ּ�</th><td><input type = "text" name ="s_addr">
				</td>
				<tr>
					<th>�б�</th><td><input type ="text" name="s_school"></td><th>����</th><td><input type="text" name="s_major"></td>
				</tr>
				<th>���� �� �μ�</th><td colspan="3"><input type="text" name="s_work" placeholder="���� �����Դϴ�."></td>
				<tr>
					<th colspan="4">����	<input id="__addClass" type="button" value="�߰�" onclick="addClass();"></th>
				</tr>
				<tr>
					<td id="classArea" colspan="4"></td>
				</tr>
				<tr>
					<th colspan="5">����</th>
				</tr>
				<tr>
					<th align="right" colspan="5">
						���� <input type="checkbox" name="s_disc" value="����">
						���� ��� | ���� <input type="radio" name ="c_card" checked="checked" value="����"> ī�� <input type="radio" name ="c_card" value="ī��">
					</th>
				</tr>
				<td align="center" colspan="5"><input type="submit" value="���"></td>
				
			</table>			
		</form> 
	</div>
	 -->
	
	<%@ include file = "../footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
	
	let classnum = 0;
	
	function addClass(){
		
		var a = document.createElement('a');
		
		$.ajax({
			url : "selectClass.do",
			type :"post",
			success : function(result) {
				let html = '<div class="card mb-3" id = "__addClassWrapRoot'+ classnum+'"><div class="card-body" id = "__addClassWrap'+ classnum+'">'
				html += '<div class="row align-items-center"><label for="t_name" class="col-sm-3 col-form-label"><b>����</b></label>'
				html +='<div class="col-sm-9"><select class="form-select form-select-sm" id = "__addClassId'+ classnum+'" name ="c_code" onchange="getCtt('+ classnum +')">';
				
				for(var i=0; i<result.length; i++) {
						html += '<option value = "'+ result[i].c_code +'">' +  result[i].c_name; + '</option>';
				}
					
				
				html += '</select></div></div></div>';
				a.innerHTML += html;
				document.getElementById('classArea').appendChild(a);
				classnum = classnum + 1;
				
				document.getElementById('__addClass').setAttribute('disabled', 'true');
				document.getElementById('classAreaEmpty').style.display = 'none';
			}
		});
	}
	
	function getCtt(num) {
	
		const value = document.getElementById('__addClassId'+num).value;
		
		$.ajax({
			url : "selectCtt.do",
			type :"post",
			dataType: 'json',
	        contentType: 'application/json;',
			data : JSON.stringify({
				c_code : value
			}),
			success : function(result) {
				var check = document.getElementById('__cttArea' + num);
				if(check) {
					check.remove();
				}	
				var a = document.createElement('a');
				
				let html = '<div id = "__cttArea'+num +'"><div class="mt-1 row align-items-center"><label for="t_name" class="col-sm-3 col-form-label"><b>���� �ð�</b></label>';
				
				html += '<div class="col-sm-9"><select class="form-select form-select-sm" name = "ct_code">';
				for(var i = 0; i<result.length; i++) {
					html += '<option value = "' + result[i].ct_code + '">������ : ' + result[i].c_start_day +'  �ð�'+ result[i].c_start_time +'~'+result[i].c_end_time+'</option>'	
				}
				html += '</select></div></div>';
				html += `
					<div class="mt-1 row align-items-center">
						<label for="t_name" class="col-sm-3 col-form-label"><b>���� ����</b></label>
						<div class="col-sm-9">
							<select class="form-select form-select-sm" name = "c_payCheck">
								<option value = "���� ">����
								<option value = "����">����
							</select>
						</div>
					</div>`;
					
				html +=	'<button class="btn btn-danger btn-sm mt-2 float-end" onclick ="delCttArea('+num+');">����</button></div>';
					
				a.innerHTML = html;
				
				document.getElementById('__addClassWrap' + num).appendChild(a);
				
				document.getElementById('__addClass').removeAttribute('disabled');
			}
		});
		
	}
	
	function delCttArea(num) {
		document.getElementById('__addClassWrapRoot'+num).remove();
		// document.getElementById('__cttArea'+num).remove();
		
		if (document.getElementsByName('c_code').length === 0) {
			document.getElementById('classAreaEmpty').style.display = '';
		}

	}
	</script>
	
</body>
</html>