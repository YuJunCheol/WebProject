<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function show() {
		if(f.c_name.value == "") {
			alert("강의명을 입력해주세요.")
			return false
		} if (f.cteacher.value == "") {
			alert("강사명을 입력해주세요.")
			return false
		} if (f.c_tuition.vlaue == "") {
			alert("수강료 를 선택해 주세요.")
			return false
		} 
		return true
	}
	 
</script>
</head>   
<body>    
	<div align="center">  
		<h1>강의 목록</h1> 
		<form name = "f" onsubmit="return show()" action="inputClass.do" method="post">
			<table>
				<tr>
					<th>강의명</th> 
					<td><input type = "text" name ="c_name"></td>
				</tr>
				<tr>
					<th>강사명</th> <!-- 후에 강사 등록 후 강사를 불러와 선택할 수 있도록 변경. -->
					<td><input type = "text" name ="c_teacher"></td>
				</tr>
				<tr>
					<th>수강료</th>
					<td><input type ="text" name = "c_tuition">원</td> 
				</tr>
				<tr align="center">
					<td colspan="2"><input type ="submit" value = "등록">	</td>
				</tr>
			</table>
		</form>
		
		
	</div>
	
</body>
</html>