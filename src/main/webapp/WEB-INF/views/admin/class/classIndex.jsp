<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: 강의 현황</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>
	
	
	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 15px 30px 5px 10px;">
	    <li class="breadcrumb-item ">강의 관리</li>
	    <li class="breadcrumb-item " aria-current="page">강의 현황</li>
	  </ol>
	</nav>	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis 강의 현황</b></h1>
		</div>
		
		<div class="row p-4">
			<c:set var ="cCateCount" value ="1"/> 
			<c:forEach var = "dto" items = "${listClass }">
				<div class="col-3">
					<a href = "updateClassCateForm.do?c_code=${dto.c_code }" class="fs-6" >${dto.c_name }</a><input type = "button" value ="삭제" onclick = "delCheck('${dto.c_code}')">
				</div>
				<%-- <c:if test="${cCateCount % 5 eq 0 }">
					</tr><tr>
				</c:if> --%>
				<c:set var ="cCateCount" value ="${cCateCount + 1}"/>
			</c:forEach>
		</div>
		
		<div class="row">
			<c:set var ="cCateCount" value ="1"/> 
			<c:forEach var = "dto" items = "${listClass }">
				<a href = "updateClassCateForm.do?c_code=${dto.c_code }">${dto.c_name }</a><input type = "button" value ="삭제" onclick = "delCheck('${dto.c_code}')">
				<%-- <c:if test="${cCateCount % 5 eq 0 }">
					</tr><tr>
				</c:if> --%>
				<c:set var ="cCateCount" value ="${cCateCount + 1}"/>
			</c:forEach>
			
			
				<div class="col-12"> 
					디자인 베이직(유)11디자인 베이직(유)11디자인 베이직(유)11디자인 베이직(유)11디자인 베이직(유)11
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
				<div class="col-4 gy-4">
					디자인 베이직(유)
				</div>
		</div>
		<table>
			<tr>
				<td colspan="5" align="right">
					<input type ="button" value ="강의 등록" onclick="location.href='addClassForm.do'">
					<input type = "button" value ="시간표 등록" onclick = "location.href='insertClassTimeTableForm.do'">
				</td>
			</tr>
			<c:if test = "${empty listClass }">
				<tr>
					<td colspan = "7">등록되어있는 강의가 없습니다.</td>
				</tr>
			</c:if>
			<tr>
				<c:set var ="cCateCount" value ="1"/> 
				<c:forEach var = "dto" items = "${listClass }">
						<td><a href = "updateClassCateForm.do?c_code=${dto.c_code }">${dto.c_name }</a><input type = "button" value ="삭제" onclick = "delCheck('${dto.c_code}')"></td>
					<c:if test="${cCateCount % 5 eq 0 }">
						</tr><tr>
					</c:if>
					<c:set var ="cCateCount" value ="${cCateCount + 1}"/>
				</c:forEach>
			</tr>
			</table>
	</div>
	
	

	<div align="center"> 
		<h1>강의 목록</h1>
		<table>
		<tr>
			<td colspan="5" align="right">
				<input type ="button" value ="강의 등록" onclick="location.href='addClassForm.do'">
				<input type = "button" value ="시간표 등록" onclick = "location.href='insertClassTimeTableForm.do'">
			</td>
		</tr>
		<c:if test = "${empty listClass }">
			<tr>
				<td colspan = "7">등록되어있는 강의가 없습니다.</td>
			</tr>
		</c:if>
		<tr>
			<c:set var ="cCateCount" value ="1"/> 
			<c:forEach var = "dto" items = "${listClass }">
					<td><a href = "updateClassCateForm.do?c_code=${dto.c_code }">${dto.c_name }</a><input type = "button" value ="삭제" onclick = "delCheck('${dto.c_code}')"></td>
				<c:if test="${cCateCount % 5 eq 0 }">
					</tr><tr>
				</c:if>
				<c:set var ="cCateCount" value ="${cCateCount + 1}"/>
			</c:forEach>
		</tr>
		</table>
		<!-- 강의별 전체 시간표 -->
		<table border="1">
			<tr>
				<c:forEach var = "count" begin="1" end="6">
					<th>${count }월</th>
				</c:forEach>
			</tr> 
			<tr>
				<c:forEach var = "count" begin="1" end="6">
				<c:set var = "countMonth" value ="0${count }"/>
				<td>
				<c:forEach var ="classDto" items="${listClass }">
					<c:forEach var ="classTtable" items="${listCtt }">
						<c:if test="${classDto.c_code eq classTtable.c_code}">
							<c:set var ="month" value ="${fn:split(classTtable.c_start_day,'-')[1] }"/>
							<c:if test="${month eq countMonth }">
								<p>${classDto.c_name } : (${classTtable.c_start_time } ~ ${classTtable.c_end_time })</p> 
							</c:if>
						</c:if> 
					</c:forEach>
				</c:forEach>
				</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var = "count" begin="7" end="12">
					<th>${count }월</th>
				</c:forEach>
			</tr> 
			<tr>
				<c:forEach var = "count" begin="7" end="12">
				<c:set var = "countMonth" value ="0${count }"/>
				<c:if test="${countMonth >= 10 eq true}">
					<c:set var = "countMonth" value ="${count }"/>
				</c:if>
				<td>
				<c:forEach var ="classDto" items="${listClass }">
					<c:forEach var ="classTtable" items="${listCtt }">
						<c:if test="${classDto.c_code eq classTtable.c_code}">
							<c:set var ="month" value ="${fn:split(classTtable.c_start_day,'-')[1] }"/>
							<c:if test="${month eq countMonth }">
								<p>${classDto.c_name } : (${classTtable.c_start_time } ~ ${classTtable.c_end_time })</p> 
							</c:if>
						</c:if> 
					</c:forEach>
				</c:forEach>
				</td>
				</c:forEach>
			</tr>
		</table>		
	</div>
	
	<%@ include file = "../footer.jsp" %>
	
	<script type="text/javascript">
		function delCheck( c_code ) {
				var isDel = window.confirm("정말로 삭제하시겠습니까?")
				if (isDel){
					location.href="deleteClass.do?c_code=" + c_code
				}
		} 
	</script>
</body>
</html>