<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="URL" value="${requestScope['javax.servlet.forward.servlet_path']}" />

	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		  <div class="container container-fluid">
		    <a class="navbar-brand" href="/">Motionis</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link ${fn:contains(URL, 'student') ? 'active' : '' }" aria-current="page" href="studentIndex.do">切积 包府</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link ${fn:contains(URL, 'class') || fn:contains(URL, 'addClassForm') || fn:contains(URL, 'insertClassTimeTableForm') ? 'active' : '' }" href="classIndex.do">碍狼 包府</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link ${fn:contains(URL, 'teacher') || fn:contains(URL, 'addTeachertForm') ? 'active' : '' }" href="teacherIndex.do">碍荤 包府</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</header>
