<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="boardConfig.jsp"%>

<link href="assets/css/ykm/boardStudy.css" rel="stylesheet">

<!-- jQuery -->
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Vendor JS Files -->
<script defer src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Template Main JS File -->
<script defer src="assets/js/main.js"></script>

<script defer src="assets/js/ykm/comment.js"></script>

</head>
<body>
	<!-- ======= header ======= -->
	<%@ include file="../header.jsp"%>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>공모전 스터디 게시판</h1>
			<nav style="--bs-breadcrumb-divider: '-';">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item active"><a href="boardContest">공모전</a></li>
					<li class="breadcrumb-item active"><a href="boardStudy">스터디</a></li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<!-- ======= Bordered Tabs ======= -->
		<section class="section">
			<div class="row card card-body">
				<div class="community-header">
					<span>스터디 게시판</span>
				</div>
				<!-- 탭 시작  -->
				<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab"
					role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link ${comm_mid2=='0' ? 'active' : ''}" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#bordered-home" type="button" role="tab"
							aria-controls="home" aria-selected="${comm_mid2=='0' ? 'true' : 'false'}"
							onclick="location.href='/boardStudy';">전체</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link ${comm_mid2=='10' ? 'active' : ''}" id="recruiting-tab" data-bs-toggle="tab"
							data-bs-target="#bordered-profile" type="button" role="tab"
							aria-controls="profile" aria-selected="${comm_mid2=='10' ? 'true' : 'false'}"
							onclick="location.href='/boardStudy?comm_mid2=10';">모집중</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link ${comm_mid2=='20' ? 'active' : ''}" id="recruited-tab" data-bs-toggle="tab"
							data-bs-target="#bordered-contact" type="button" role="tab"
							aria-controls="contact" aria-selected="false"
							onclick="location.href='/boardStudy?comm_mid2=20';">모집완료</button>
					</li>
					<!-- End Nav-Tab -->

					<!-- 검색 시작  -->
					<li class="nav-item ms-auto" role="presentation">
						<div class="search-bar d-flex justify-content-end">
							<form class="search-form d-flex align-items-center" method="POST"
								action="#">
								<input type="text" name="query" placeholder="Search"
									title="Enter search keyword">
								<button type="submit" title="Search">
									<i class="bi bi-search"></i>
								</button>
							</form>
						</div>
					</li>
				</ul>
				<!-- End Search tab -->
				<div class="table-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
								<th scope="col">댓글</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${getPostList}" var="PostList" varStatus="loop">
								<tr id="postTable">
									<th scope="row">${loop.index+1 }</th>
									<td>
										<c:choose>
											<c:when test="${PostList.comm_mid2 == 10}">
											<span id="recruitment_${PostList.cboard_no}" class="recruiting">모집중</span>
											</c:when>
											<c:when test="${PostList.comm_mid2 == 20}">
											<span id="recruitment_${PostList.cboard_no}" class="recruited">모집완료</span>
											</c:when>
										</c:choose>
										<a href="/post?cboard_no=${PostList.cboard_no}">${PostList.cboard_title}</a>
									</td>					
									<td>${PostList.user_nic}</td>
									<td><fmt:formatDate value="${PostList.cboard_date}" pattern="yyyy-MM-dd"/></td>
									<td>${PostList.cboard_viewcnt}</td>
									<td>${PostList.reply_count}</td>
								</tr>
								<!-- <span class="recruited">모집완료</span> -->
							</c:forEach>
							
						</tbody>
					</table>
				</div>
				<!-- End Table -->
				<div class="community-bottom">
					<div class="btn-container">
						<a href="/writeForm"><button class="btn btn-primary custom-btn wriBtn">글쓰기</button></a>
					</div>

					<!-- ======= Pagination ======= -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">«</span></a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">»</span></a></li>
						</ul>
					</nav>
				</div>
			</div>
		</section>



		<!-- ======= aSidebar ======= -->
		<%@ include file="../asidebar.jsp"%>



	</main>

	<!-- ======= Footer ======= -->
	<%@ include file="../footer.jsp"%>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
	<i class="bi bi-arrow-up-short"></i></a>


</body>
</html>