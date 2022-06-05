<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- classInfo.jsp -->
<html>
<head>
<meta charset="EUC-KR">
<title>강의 정보</title>
<script type="text/javascript">
	
	function check(){
	
		var isChecked = false;
		var c_day = document.getElementsByName("c_day");
		
		for(var i = 0; i<c_day.length; i++) {
			if(c_day[i].checked == true) {
				isChecked = true;
				break;
			}
		}
		
		if(!isChecked) {
			alert("수강요일을 선택해주세요");
			return false
		}
		
		return true;
	}

</script>
</head>
<body>
	<div align="center">
		<h1>강의 목록</h1> 
		<form name = "f" onsubmit="return show()" action="updateClass.do" method="post" onsubmit="return check()">
			<table>
				<tr>
					<input type = "hidden" name = "c_code" value = "${dto.c_code }">
				</tr>
				<tr>
					<th>강의명</th> 
					<td><input type = "text" name ="c_name" value = "${dto.c_name }"></td>
				</tr>
				<tr>
					<th>강사명</th> <!-- 후에 강사 등록 후 강사를 불러와 선택할 수 있도록 변경. -->
					<td><input type = "text" name ="c_teacher" value = "${dto.c_teacher }"></td>
				</tr>
				<tr>
					<th>개강일</th> 
					<td><input type = "text" name ="c_start" value = "${dto.c_start }"></td>
				</tr>
				<tr>
					<th>수업 시간</th> 
					<td><input type ="time" name ="c_start_time" value = "${dto.c_start_time }"> ~ <input type ="time" name ="c_end_time" value = "${dto.c_end_time }"></td>
				</tr>
				<tr>
					<th>종강일</th> 
					<td><input type ="text" name ="c_end" value = "${dto.c_end }"></td>
				</tr>
				<tr>
					<th>수강요일</th> 
					<td>
						<input type ="checkbox" name = "c_day" value = "월">월
						<input type ="checkbox" name = "c_day" value = "화">화
						<input type ="checkbox" name = "c_day" value = "수">수
						<input type ="checkbox" name = "c_day" value = "목">목
						<input type ="checkbox" name = "c_day" value = "금">금
					</td>
				</tr>
				<tr>
					<th>정원</th>
					<td><input type ="number" name = "c_max" value = "${dto.c_max }"></td>
				</tr>
				<tr>
					<th>수강료</th>
					<td><input type ="number" name = "c_tuition" value = "${dto.c_tuition }"></td>
				</tr>
				<tr align="center">
					<td><input type ="submit" value = "수정">	</td>
					<td><input type ="button" value ="삭제" onclick="location = 'deleteClass.do?c_code=${dto.c_code}'"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>