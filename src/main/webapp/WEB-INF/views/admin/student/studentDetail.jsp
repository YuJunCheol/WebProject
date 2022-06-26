<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: �л�����</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>
	
	
	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">�л� ����</li>
	    <li class="breadcrumb-item " aria-current="page">�л� ����</li>
	  </ol>
	</nav>	
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis �л� ����</b></h1>
			
			<div class="col-sm-12 col-md-5">
				<div class="card">
					<div class="card-body">
						<div class="row g-2">
				            <div class="col-sm-6">
				              <label for="s_name" class="form-label"><b>�̸�</b></label>
				              <input type="text" readonly class="form-control-plaintext" id="s_name" name="s_name" value="${student.s_name }">
				            </div>
				            
				            <div class="col-sm-6">
				              <label for="s_barth" class="form-label"><b>�������</b></label>
				              <input type="text" readonly class="form-control-plaintext" id="s_barth" name="s_barth" value="${student.s_barth }">
				            </div>
				            
				             <div class="col-sm-6">
				              <label for="s_email" class="form-label"><b>�̸���</b></label>
				              <input type="email" readonly class="form-control-plaintext" id="s_email" name="s_email" value="${student.s_email }">
				            </div>
					            
				            <div class="col-sm-6">
				              <label for="s_tel" class="form-label"><b>��ȭ��ȣ</b></label>
				              <input type="text" readonly class="form-control-plaintext" id="s_tel" name="s_call" value="${student.s_call }">
				            </div>
				
				            <div class="col-12">
				              <label for="s_addr" class="form-label"><b>�ּ�</b></label>
				              <input type="text" readonly class="form-control-plaintext" id="s_addr" name="s_addr" value="${student.s_addr }">
				            </div>
				            
				            <div class="col-sm-6">
				              <label for="s_school" class="form-label"><b>�б�</b></label>
				              <input type="text" readonly class="form-control-plaintext" id="s_school" name="s_school" value="${student.s_school }">
				            </div>
				            
				            <div class="col-sm-6">
				              <label for="s_major" class="form-label"><b>����</b></label>
				              <input type="text" readonly class="form-control-plaintext" id="s_major" name="s_major" value="${student.s_major }">
				            </div>
				            
				            <div class="col-12">
				              <label for="s_work" class="form-label"><b>���� �� �μ�</b></label>
				              <input type="text" readonly class="form-control-plaintext" id="s_work" name="s_work" value="${student.s_work }">
				            </div>
			           </div>
		           </div>
	           </div>
	           
	           <div class="d-grid gap-3 d-flex justify-content-center align-items-center mt-5">
	           		<a href="studentIndex.do" class="btn btn-secondary w-100">���</a>
	           		<input type="submit" value = "����" class="btn btn-primary w-100">
	  				<button class="btn btn-danger w-100" onclick="checkDel('${student.s_code}')">����</button>
		    		
	  			</div>
           </div>
		</div>
	</div>
	
	<%-- 
	<div align="center" >
	<h1>�л�����</h1>
		<form action="studentUpdateForm.do" name = "f" method = "post">
			<input type = "hidden" name = "s_no" value = "${student.s_no }">
			<input type = "hidden" name = "s_code" value = "${student.s_code }">
			<table border="1">
				<tr>
					<th>�л� �̸�</th><td>${student.s_name }</td>
					<input type = "hidden" name = "s_name" value = "${student.s_name }">
					
					<th>�л� ����</th><td>${student.s_barth }</td>
					<input type = "hidden" name = "s_barth" value = "${student.s_barth }">
				</tr>
				<tr>
					<th>�л� ��ȣ</th><td colspan="3">${student.s_call }</td>
					<input type = "hidden" name = "s_call" value = "${student.s_call }">
				</tr>
				<tr> 
					<th>�л� �ּ�</th><td colspan="3">${student.s_addr }</td>
					<input type = "hidden" name = "s_addr" value = "${student.s_addr }">
				</tr>
				<tr>
					<th>�̸���</th><td colspan="3">${student.s_email }</td>
					<input type ="hidden" name = "s_email" value = "${student.s_email }">
				</tr>
				<tr>
					<th>����</th><td colspan="3">${student.s_work }</td>
					<input type = "hidden" name = "s_work" value = "${student.s_work }">
				</tr>
				<tr>
					<th>������</th><td colspan="3">${student.s_join }</td>
					<input type = "hidden" name = "s_join" value = "${student.s_join }">
				</tr>
				<!-- �����ϴ� ���� ������ ����  -->
				
				<tr>
					<td align="center" colspan="4" >
						<button type = "submit">����</button>
						<button type = "button" onclick="javascript:checkDel('${student.s_code}')">����</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	 --%>
	
	<%@ include file = "../footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function checkDel(s_code){
			var isDel = window.confirm("������ �����Ͻðڽ��ϱ�?")
			if (isDel){
				location.href="deleteStudent.do?s_code=" + s_code
			}
		}
	</script>
</body>
</html>