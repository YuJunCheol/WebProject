<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- studentAdd.jsp -->
<html>
<head>
<meta charset="EUC-KR">
<title>�л����</title>
</head>
<body>

	<div id ="root" align="center">
		<hr width="300" color="green">
		<h1>�л� ��� ������</h1>
		<hr width="300" color="green">
		<form action="inputStudent.do" method="post">
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
	
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

let classnum = 0;

function addClass(){
	
	var a = document.createElement('a');
	
	$.ajax({
		url : "selectClass.do",
		type :"post",
		success : function(result) {

			let html = '<select id = "__addClassId'+ classnum+'" name ="c_code" onchange="getCtt('+ classnum +')">';
			
			for(var i=0; i<result.length; i++) {
					html += '<option value = "'+ result[i].c_code +'">' +  result[i].c_name; + '</option>';
			}
				
			
			html += '</select>';
			a.innerHTML += html;
			document.getElementById('classArea').appendChild(a);
			classnum = classnum + 1;
			
			document.getElementById('__addClass').setAttribute('disabled', 'true');
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
			
			let html = '<div id = "__cttArea'+num +'"><select name = "ct_code">';
			for(var i = 0; i<result.length; i++) {
				html += '<option value = "' + result[i].ct_code + '">������ : ' + result[i].c_start_day +'  �ð�'+ result[i].c_start_time +'~'+result[i].c_end_time+'</option>'	
			}
			html += '</select>';
			html += `
				���� ���� <select name = "c_payCheck">
					<option value = "���� ">����
					<option value = "����">����
				</select>`;
				
			html +=	'<input type="button" value ="����" onclick ="delCttArea('+num+');"/></div>';
				
			a.innerHTML = html;
			
			document.getElementById('classArea').appendChild(a);
			
			document.getElementById('__addClass').removeAttribute('disabled');
		}
	});
	
}

function delCttArea(num) {
	document.getElementById('__addClassId'+num).remove();
	document.getElementById('__cttArea'+num).remove();
}
</script>
	
</body>
</html>