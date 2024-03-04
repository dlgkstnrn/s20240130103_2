<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>보낸 쪽지 : 블루베리</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/blueberry-favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/0b22ed6a9d.js"
	crossorigin="anonymous"></script>

<!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->



<!-- KDW Main CSS File -->
<link href="assets/css/kdw/msgReadSent.css" rel="stylesheet">

</head>

<body>
	<!-- 여기에 헤더, 사이드바 등 공통 요소를 import-->
	<%@ include file="../header.jsp"%>
	<%@ include file="../asidebar.jsp"%>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>보낸쪽지</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item active">보낸쪽지</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<!-- 쪽지쓰기 세션 부분 -->
		<div class="card">
			<section class="read-message-section">
				<div class="message-container">
					<form id="readMessage-form">
						<!-- 쪽지쓰기 Button -->
						<div class="form-group">
							<a href="/msgWrite" class="msgWrite-btn">쪽지쓰기</a>
						</div>
						<!-- 취소 Button : 이전 페이지로 돌아가기 -->
					    <div class="form-group">
					        <a href="<%= request.getHeader("Referer") %>" class="cancel-btn">취소</a>
					    </div>
						<!-- Title -->
						<div class="form-group">
							<div class="message-title-group">
								<!-- Title TEXT -->
								<div class="message-info">${sentMessageInfo.msg_title}</div>
							</div>
						</div>
						<!-- Receiver -->
						<div class="form-group">
							<div class="message-info-group">
								<!-- Receiver Text -->
								<div class="message-info-prepend">
									<span class="message-info-text">받는사람</span>
								</div>
								<!-- Receiver Display -->
								<div class="message-info">${sentMessageInfo.msg_receiver}</div>
							</div>
						</div>
						<!-- Sender -->
						<div class="form-group">
							<div class="message-info-group">
								<!-- Sender Text -->
								<div class="message-info-prepend">
									<span class="message-info-text">보낸사람</span>
								</div>
								<!-- Sender Display -->
								<div class="message-info" id="senderText">${sentMessageInfo.msg_sender}</div>
							</div>
						</div>
						<!-- Sent Time -->
						<div class=time-group>
							<div class="time-form-group">
								<div class="message-info-group">
									<!-- Sent Time Text -->
									<div class="message-time-info-prepend">
										<span class="message-time-info-text">보낸 시간</span>
									</div>
									<!-- Sent Time Display -->
									<div class="message-time-info">${sentMessageInfo.msg_createdate}</div>
								</div>
							</div>
							<!-- Read Time -->
							<div class="time-form-group">
								<div class="message-info-group">
									<!-- Read Time Text -->
									<div class="message-time-info-prepend">
										<span class="message-time-info-text">읽은 시간</span>
									</div>
									<!-- Read Time Display -->
									<div class="message-time-info">${sentMessageInfo.msg_readdate}</div>
								</div>
							</div>
						</div>
						<!-- Attachments -->
						<div class="form-group">
							<div class="mb-3">
								<div class="file-attachment">
									<!-- File Attachment Input -->
									<input class="form-control" type="file" id="formFileMultiple"
										name="attachments" multiple disabled>
								</div>
							</div>
						</div>
						<!-- Content -->
						<div class="form-group">
							<div class="content-group">
								<%-- Message 내용부분 텍스트 or 이미지 읽기 --%>
								<c:choose>
									<c:when test="${fn:contains(sentMessageInfo.msg_content, ',')}">
										<%-- 만약 msg_content가 콤마로 구분된 목록이라면, 이를 배열로 취급 --%>
										<c:forEach var="content"
											items="${fn:split(sentMessageInfo.msg_content, ',')}">
											<c:choose>
												<c:when
													test="${fn:endsWith(content, '.jpg') or fn:endsWith(content, '.png')}">
													<img src="${content}" alt="Message Image">
												</c:when>
												<c:otherwise>
													<p>${content}</p>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when
												test="${fn:endsWith(sentMessageInfo.msg_content, '.jpg') or fn:endsWith(sentMessageInfo.msg_content, '.png')}">
												<img src="${sentMessageInfo.msg_content}"
													alt="Message Image">
											</c:when>
											<c:otherwise>
												<p>${sentMessageInfo.msg_content}</p>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</main>
	<!-- ======= Footer ======= -->
	<%@ include file="../footer.jsp"%>
	<!-- End Footer -->

	<!-- 스크롤하면 우측 아래 생기는 버튼 : 클릭하면 페이지의 맨 위로 이동 -->
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center">
		<i class="bi bi-arrow-up-short"></i>
	</a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.min.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
</body>
</html>