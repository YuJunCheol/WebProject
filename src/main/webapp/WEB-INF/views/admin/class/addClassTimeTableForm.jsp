<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head> 
<script type="text/javascript">
function setDay(year, month) {
		var day = year + "-" month + "-00"
		document.write( year + '-' + month +'-'+'00' );
	}
</script>
<style>
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
    	-moz-appearance: none;
    	appearance: none;
		
	}
</style>
<link rel="stylesheet" type="text/css" href="">
<body>
	<div align="center">
		<hr width = "300" color = "green">
		<h1>${classDto.c_name } ${nowYear }시간표</script> </h1>
		<hr width = "300" color = "green">
		<form name = "f" action="insertClassTimeTable.do" method = "post">
		<table border="1">

			<tr>
				<td colspan="2">
					강의 명 
					<select name = "c_code">
						<c:forEach var = "classDto" items="${listClass }">
								<option value="${classDto.c_code }">${classDto.c_name }
						</c:forEach>
					</select>
					수강 요일
					<input type ="checkbox" name = "c_day" value = "월" checked="checked">월 
					<input type ="checkbox" name = "c_day" value = "화">화
					<input type ="checkbox" name = "c_day" value = "수">수
					<input type ="checkbox" name = "c_day" value = "목">목
					<input type ="checkbox" name = "c_day" value = "금">금
					
					정원
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
					<th align="center">${month }월 </th>		 			
					<td> 
						개강일 <input type ="date" name = "c_list[${count }].c_start_day" value="${dateValue }">
						종강일 <input type ="date" name = "c_list[${count }].c_end_day" value = "${dateValue }">
						시간 <input type = "time" name = "c_list[${count }].c_start_time" value="13:00" > ~ <input type = "time" name = "c_list[${count }].c_end_time" value="16:00">
					</td>
					<c:set var ="count" value = "${count + 1}"/>
				</tr> 
			</c:forEach> 
			<tr>
				<td colspan="2" align="right" ><input type = "submit" value = "등록"></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>