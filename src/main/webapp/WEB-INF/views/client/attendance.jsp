<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id ="" align="center">
		<h1>출석 체크 페이지</h1>
		
		<div id = "_menu_attendance">
			
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	const u_code = '${u_code}'
	
	$.ajax({
		url : select
	});
});

</script>
</body>
</html>