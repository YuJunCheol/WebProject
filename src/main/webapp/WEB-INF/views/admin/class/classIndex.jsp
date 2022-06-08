<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../top.jsp" %>
	<title>Motionis :: 강의 현황</title>
</head>
<body class="d-flex flex-column min-vh-100">
	<%@ include file = "../header.jsp" %>
	
	<nav aria-label="breadcrumb" style="background-color: #e4e4e4;">
	  <ol class="breadcrumb justify-content-end" style="padding: 10px 30px 0px 10px;">
	    <li class="breadcrumb-item ">강의 관리</li>
	    <li class="breadcrumb-item " aria-current="page">강의 현황</li>
	  </ol>
	</nav>	
	
	<div class="container mt-5 mb-5">
		<div class="d-flex flex-column justify-content-center align-items-center gap-3">
			<h1><b>Motionis 강의 현황</b></h1>
		</div>
		
		<div class="mt-2">
			<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseClass" aria-expanded="false" aria-controls="collapseClass">
			    강의 목록
			</button>
			<a href="addClassForm.do" class="btn btn-primary">강의 등록</a>
			<a href="insertClassTimeTableForm.do" class="btn btn-primary">시간표 등록</a>
		</div>		
		<div class="collapse mt-3" id="collapseClass">
 			<div class="card card-body flex-row flex-wrap gap-3">
 				<c:if test = "${empty listClass }">
					<span>등록된 강의가 없습니다.</span>
				</c:if>
				
		    	<c:set var ="cCateCount" value ="1"/> 
				<c:forEach var = "dto" items = "${listClass }">
					<div>
						<a href = "updateClassCateForm.do?c_code=${dto.c_code }" class="fs-6" >${dto.c_name }</a>
						<button type="button" class="btn btn-sm btn-close" onclick="delCheck('${dto.c_name }', '${dto.c_code}')"></button>
						<%-- <input type = "button" value ="삭제" onclick = "delCheck('${dto.c_code}')"> --%>
					</div>
					<c:set var ="cCateCount" value ="${cCateCount + 1}"/>
				</c:forEach>
			</div>
		</div>
		
		<!-- 강의별 전체 시간표 -->
		<div class="container mt-4">
			<div class="row">
				<c:forEach var = "count" begin="1" end="12">
					<div class="col-sm-12 col-md-2 border p-0" >
						<div class="text-center p-2 border-bottom bg-secondary text-dark bg-opacity-25" >
							<span><strong>${count }월</strong></span>
						</div>
						
						<div class="card-body p-2">
							<c:forEach var ="classDto" items="${listClass }">
								<c:forEach var ="classTtable" items="${listCtt }">
									<c:if test="${classDto.c_code eq classTtable.c_code}">
										<c:set var ="month" value ="${fn:split(classTtable.c_start_day,'-')[1] }"/>
								      	<fmt:parseNumber var = "monthNum" type = "number" value = "${month}" />
										
										<c:if test="${monthNum eq count }">
											<span>${classDto.c_name }</span>
											<ul>
												<li><small>${classTtable.c_start_time } ~ ${classTtable.c_end_time }</small></li>
											</ul>  
										</c:if>
									</c:if> 
								</c:forEach>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<%@ include file = "../footer.jsp" %>
	
	<script type="text/javascript">
		function delCheck( c_name, c_code ) {
			var isDel = window.confirm(c_name +" 강의를 정말로 삭제하시겠습니까?")
			if (isDel){
				location.href="deleteClass.do?c_code=" + c_code
			}
		} 
	</script>
</body>
</html>