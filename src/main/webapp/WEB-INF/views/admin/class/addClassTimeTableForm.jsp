<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: ���� �ð�ǥ ���</title>
	
	<style>
		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
			-webkit-appearance: none;
	    	-moz-appearance: none;
	    	appearance: none;
			
		}
	</style>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>
	
	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">���� ����</li>
	    <li class="breadcrumb-item ">���� ��Ȳ</li>
	    <li class="breadcrumb-item ">���� �ð�ǥ ���</li>
	  </ol>
	</nav>	
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis ${nowYear } ���� �ð�ǥ ���</b></h1>
			
			<div class="col-sm-12 col-md-8">
				<div class="card">
					<div class="card-body">
						<form name = "f" action="insertClassTimeTable.do" method = "post">
							<div class="mt-2">
								<div class="row gy-2">
									<div class="col-sm-12 col-md-5">
										<label for="c_code" class="form-label form-control-sm ps-0"><b>���� ��</b> </label>
									  	<select class="form-select form-select-sm" aria-label="c_code" id="c_code" name="c_code">
										  	<c:forEach var = "classDto" items="${listClass }">
												<option value="${classDto.c_code }">${classDto.c_name }
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-12 col-md-5">
										<label for="c_day" class="form-label form-control-sm ps-0"><b>���� ����</b> </label>
										<div>
										  	<div class="form-check form-check-inline" id="c_day">
										    	<input class="form-check-input" type="checkbox" id="c_day1" value="��" name="c_day" checked="checked">
										 		<label class="form-check-label" for="c_day1">��</label>
											</div>	
											<div class="form-check form-check-inline" >
												<input class="form-check-input" type="checkbox" id="c_day2" value="ȭ" name="c_day">
										 		<label class="form-check-label" for="c_day2">ȭ</label>
											</div>
											<div class="form-check form-check-inline" >
												<input class="form-check-input" type="checkbox" id="c_day3" value="��" name="c_day">
										 		<label class="form-check-label" for="c_day3">��</label>
											</div>
											<div class="form-check form-check-inline" >
												<input class="form-check-input" type="checkbox" id="c_day4" value="��" name="c_day">
										 		<label class="form-check-label" for="c_day4">��</label>
											</div>
											<div class="form-check form-check-inline" >
												<input class="form-check-input" type="checkbox" id="c_day5" value="��" name="c_day">
										 		<label class="form-check-label" for="c_day5">��</label>
											</div>					  	
										</div>
									</div>
									<div class="col-sm-12 col-md-2">  
										<label for="c_limit" class="form-label form-control-sm ps-0"><b>����</b></label>
									  	<input type="number" class="form-control form-control-sm" id="c_limit" name="c_limit" placeholder="���� " value="12">
								  	</div>
							  	</div>
							  	<hr/>
							  	<!-- �ð�ǥ -->
							  	<c:set var ="count" value = "0"/>
								<c:forEach var ="month" begin="1" end="12" step="1">
									<div class="row gy-2 mb-2 pb-2" onMouseOver="this.style.background='#e7e7e7'" onMouseOut="this.style.background='transparent'" >
										<c:set var = "dateValue" value ="${nowYear}-0${month }-01"/>
										<c:if test="${month >= 10 eq true}">
											<c:set var = "dateValue" value ="${nowYear}-${month }-01"/> 					
										</c:if>
										<div class="col-sm-12 col-md-1">
								  			<label for="staticEmail" class="col-form-label form-control-sm"><b>${month }��</b></label>
								  		</div>	 
								  		<div class="col-sm-12 col-md-6">
								  			<div class="d-flex">
								  				<label for="c_list[${count }].c_start_day" class="col-form-label form-control-sm">������</label>
								  				<input type="date" class="form-control form-control-sm" style="flex: 1" id="c_list[${count }].c_start_day" name="c_list[${count }].c_start_day" value="${dateValue }">
								  				<label for="c_list[${count }].c_end_day" class="col-form-label form-control-sm">������</label>
								  				<input type="date" class="form-control form-control-sm" style="flex: 1" id="c_list[${count }].c_end_day" name="c_list[${count }].c_end_day" value="${dateValue }">
								  			</div>
										</div>
										<div class="col-sm-12 col-md-5">
								  			<div class="d-flex">
								  				<label for="c_list[${count }].c_start_time" class="col-form-label form-control-sm">�ð�</label>
								  				<input type="time" class="form-control form-control-sm" style="flex: 1" id="c_list[${count }].c_start_time" name="c_list[${count }].c_start_time" value="13:00">
								  				<label for="c_list[${count }].c_end_time" class="col-form-label form-control-sm">~</label>
								  				<input type="time" class="form-control form-control-sm" style="flex: 1" id="c_list[${count }].c_end_time" name="c_list[${count }].c_end_time" value="16:00">
								  			</div>
										</div>
										<c:set var ="count" value = "${count + 1}"/>
									</div>
								</c:forEach>
								<hr/>
								<div class="d-grid gap-3 d-flex justify-content-center align-items-center">
					  				<a href="classIndex.do" class="btn btn-secondary w-100">���</a>
						    		<input type="submit" value = "���" class="btn btn-danger w-100">
					  			</div>
				 			</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%-- 
	<div align="center">
		<hr width = "300" color = "green">
		<h1>${classDto.c_name } ${nowYear }�ð�ǥ</script> </h1>
		<hr width = "300" color = "green">
		<form name = "f" action="insertClassTimeTable.do" method = "post">
		<table border="1">

			<tr>
				<td colspan="2">
					���� �� 
					<select name = "c_code">
						<c:forEach var = "classDto" items="${listClass }">
								<option value="${classDto.c_code }">${classDto.c_name }
						</c:forEach>
					</select>
					���� ����
					<input type ="checkbox" name = "c_day" value = "��" checked="checked">�� 
					<input type ="checkbox" name = "c_day" value = "ȭ">ȭ
					<input type ="checkbox" name = "c_day" value = "��">��
					<input type ="checkbox" name = "c_day" value = "��">��
					<input type ="checkbox" name = "c_day" value = "��">��
					
					����
					<input type = "number" name ="c_limit" value = "12" style="width:30px;">
				</td>
			</tr>
			
			<c:set var ="count" value = "0"/>
			<c:forEach var ="month" begin="1" end="12" step="1">
				<tr>
					<c:set var = "dateValue" value ="${nowYear}-0${month }-01"/>
					<c:if test="${month >= 10 eq true}">
						<c:set var = "dateValue" value ="${nowYear}-${month }-01"/> 					
					</c:if>
					<th align="center">${month }�� </th>		 			
					<td> 
						������ <input type ="date" name = "c_list[${count }].c_start_day" value="${dateValue }">
						������ <input type ="date" name = "c_list[${count }].c_end_day" value = "${dateValue }">
						�ð� <input type = "time" name = "c_list[${count }].c_start_time" value="13:00" > ~ <input type = "time" name = "c_list[${count }].c_end_time" value="16:00">
					</td>
					<c:set var ="count" value = "${count + 1}"/>
				</tr> 
			</c:forEach> 
			<tr>
				<td colspan="2" align="right" ><input type = "submit" value = "���"></td>
			</tr>
		</table>
		</form>
	</div> 
	--%>
	
	<%@ include file = "../footer.jsp" %>
	
	<script type="text/javascript">
		function setDay(year, month) {
			var day = year + "-" month + "-00"
			document.write( year + '-' + month +'-'+'00' );
		}
	</script>
</body>
</html>