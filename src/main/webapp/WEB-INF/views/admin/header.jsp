<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="URL" value="${requestScope['javax.servlet.forward.servlet_path']}" />

	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <div class="container container-fluid">
		    <a class="navbar-brand" href="<c:url value='/' />">Motionis</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link ${fn:contains(URL, 'student') || fn:contains(URL, 'Student') ? 'active' : '' }" aria-current="page" href="studentIndex.do">학생 관리</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link ${fn:contains(URL, 'class') || fn:contains(URL, 'Class') ? 'active' : '' }" href="classIndex.do">강의 관리</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link ${fn:contains(URL, 'teacher') || fn:contains(URL, 'Teacher') ? 'active' : '' }" href="teacherIndex.do">강사 관리</a>
		        </li>
		        
		        <li class="nav-item d-block d-lg-none mt-1">
		          <span class="text-light me-2"> ${sessionScope.SESSION_USER.u_id }</span>
        		  <a href="logout.do" class="btn btn-outline-light btn-sm" >로그아웃</a>
		          <%-- <a class="nav-link ${fn:contains(URL, 'teacher') || fn:contains(URL, 'Teacher') ? 'active' : '' }" href="teacherIndex.do">강사 관리</a> --%>
		        </li>
		      </ul>
		    </div>
		    <div class="d-none d-md-none d-lg-block">
			    <span class="text-light me-2"> ${sessionScope.SESSION_USER.u_id }</span>
			    <a href="logout.do" class="btn btn-outline-light btn-sm" >로그아웃</a>
		    </div>
		  </div>
		</nav>
	</header>
