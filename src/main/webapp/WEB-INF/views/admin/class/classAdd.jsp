<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: ���� ���</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>
	
	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">���� ����</li>
	    <li class="breadcrumb-item ">���� ��Ȳ</li>
	    <li class="breadcrumb-item ">���� ���</li>
	  </ol>
	</nav>	
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis ���� ���</b></h1>
			
			<div class="col-sm-12 col-md-5">
				<div class="card">
					<div class="card-body">
						<form name = "f" onsubmit="return show()" action="inputClass.do" method="post">
							<div class="mt-2 row">
							    <label for="c_name" class="col-sm-3 col-form-label"><b>���Ǹ�</b></label>
							    <div class="col-sm-9">
						      		<input type="text" class="form-control" id="c_name" name="c_name" placeholder="���Ǹ��� �Է��ϼ���.">
							    </div>
				 			</div>
				 			<hr/>
				 			<div class="mt-2 row">
							    <label for="c_teacher" class="col-sm-3 col-form-label"><b>�����</b></label>
							    <div class="col-sm-9">
						      		<input type="text" class="form-control" id="c_teacher" name="c_teacher" placeholder="������� �Է��ϼ���.">
							    </div>
				 			</div>
				 			<hr/>
				 			<div class="mt-2 row">
							    <label for="c_tuition" class="col-sm-3 col-form-label"><b>������</b></label>
							    <div class="col-sm-9">
						      		<input type="text" class="form-control" id="c_tuition" name="c_tuition" placeholder="�����Ḧ �Է��ϼ���.">
							    </div>
				 			</div>
				 			
				 			<div class="d-grid gap-3 d-flex justify-content-center align-items-center mt-4">
				  				<a href="classIndex.do" class="btn btn-secondary w-100">���</a>
					    		<input type="submit" value = "���" class="btn btn-danger w-100">
				  			</div>
			 			</form>
		 			</div>
	 			</div>
 			</div>
		</div>
	</div>
	
	<!-- 
	<div align="center">  
		<h1>���� ���</h1> 
		<form name = "f" onsubmit="return show()" action="inputClass.do" method="post">
			<table>
				<tr>
					<th>���Ǹ�</th> 
					<td><input type = "text" name ="c_name"></td>
				</tr>
				<tr>
					<th>�����</th> �Ŀ� ���� ��� �� ���縦 �ҷ��� ������ �� �ֵ��� ����.
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
	 -->
	 
	<%@ include file = "../footer.jsp" %>
	
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
</body>
</html>