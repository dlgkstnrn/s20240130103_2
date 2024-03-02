<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>글쓰기</title> <!-- 페이지 제목은 변경하지 않았습니다. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jQuery CDN -->
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  
  
  <!-- Template Main CSS File -->
  <link href="assets/css/lsl/lslboardFreeContents.css" rel="stylesheet"> 
   <link href="assets/css/style.css" rel="stylesheet"> <!-- 헤더, 푸터, 사이드바 css -->
  
  
  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
    <!-- ======= Header ======= -->
    <%@ include file="../header.jsp" %>
    
    
    <!-- ======= Sidebar ======= -->
    <%@ include file="../asidebar.jsp" %>

    <!-- ======= Main ======= -->
<main id="main" class="main">
    <div class="pagetitle">
        <h1>게시판 </h1>
        <nav style="--bs-breadcrumb-divider: '-';">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="main">Home</a></li>
                <li class="breadcrumb-item"><a href="boardFree">FREE</a></li>
                <li class="breadcrumb-item"><a href="boardAsk">ASK</a></li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="community-post-detail">
        <div class="row card main-card card-body">
            <div class="card-header community-post-header">
                <h3 class="card-title post-header-title">${boardFreeContents.cboard_title}</h3>
                <div class="card-subtitle post-user-container">
                    <i class="bi bi-person-circle post-user-profile" 
                    alt="${boardFreeContents.user_profile}"></i>
                    <div class="card-title-header">
                        <h5 class="card-title post-user-name">
                            <a href="#">${boardFreeContents.user_nic}</a>
                        </h5>
                        <div class="card-subtitle post-subtitle">
                            <p class="post-updated-at">
                                작성일
                                <fmt:formatDate value="${boardFreeContents.cboard_date}"
										pattern="yyyy.MM.dd a hh:mm" />
                            </p>
                            <p class="post-veiw-count">조회수 
                                ${boardFreeContents.cboard_viewcnt}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="community-post-header-body">
                <span class="post-content">${boardFreeContents.cboard_content}</span>
            </div>


            <section class="community-post-answer">
                <div class="answer-info-header">
                    <div class="answer-info-title">
                        댓글 <span class="answer-info-title-count">23</span>
                    </div>
                    <div class="comment-editor">
                        <i class="bi bi-person-circle comment-user-profile" alt="유저 프로필"></i>
                        <input type="text" name="comment" id="inputField"
                            placeholder="id님, 댓글을 작성해보세요." class="form-control" required="">
                    </div>
                    <div class="btn-container is-editor-open">
                        <form action="boardCommentreset" method="get">
                            <button id="resetBtn" class="hidden btn btn-secondary">취소</button>
                        </form>
                        <form action="boardCommentsubmit" method="get">
                            <button id="submitBtn" class="hidden btn btn-primary">등록</button>
                        </form>
                    </div>
                </div>
            </section>

            <!-- 댓글 시작 -->
            <div id="reply" class="re-comment-body">
                <div id="replyBoardFreeList" class="comment-card">
                    <c:forEach items="${replyBoardFreeList}" var="replyBoardFreeList">
                    <div class="comment-header">
                        <i class="bi bi-person-circle comment-user-profile" alt="유저 프로필"></i>
                        <div class="comment-user-container">
                            <p class="card-title comment-user-name">
                                <a href="#">${replyBoardFreeList.USER_NIC}</a>
                            </p>
                            <p class="card-subtitle comment-updated-at">작성일
                                 <fmt:formatDate value="${replyBoardFreeList.creply_date}"
                                pattern="yyyy.MM.dd a hh:mm" /></p>
                        </div>
                        <div class="re-btn-container">
                            <form action="/boardFreeCommentRepl" method="GET">
                                <button type="submit" class="btn btn-outline-primary">
                                    <i class="bi bi-reply-fill">Replay</i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="card-body comment-body">
                        <p class="markdown-body">${replyBoardFreeList.creply_content}</p>
                    </div>
                
                    
                <div class="reply-comment">
					<form action="ref-reply" method="get">
						<input type="hidden" name="user-profile" value="${replyBoardFreeList.USER_PROFILE}">
						<input type="hidden" name="user-name" value="${replyBoardFreeList.USER_NIC}">
						<input type="hidden" name="group" value="${replyBoardFreeList.creply_group}"> <input
							type="hidden" name="level" value="${replyBoardFreeList.creply_level}"> <input
							type="hidden" name="indent" value="${replyBoardFreeList.creply_indent}">
						<div class="reply-header">
							<i class="bi bi-person-circle reply-user-profile" alt="유저 프로필"></i>
							<span class="reply-user-name">${replyBoardFreeList.USER_NIC}</span> <span
								class="reply-updated-at">작성일 
                                <fmt:formatDate value="${replyBoardFreeList.creply_date}"
                                pattern="yyyy.MM.dd a hh:mm" /></span>
						</div>
						<div class="reply-body">
							<span class="reply-content">${replyBoardFreeList.creply_content}</span><i class="bi bi-reply-fill"></i>
						</div>
					</form>
				</div>
            </c:forEach>
            </div>
			</div>
			
			<script>
								// 사용자 ID를 가져오는 함수 (예: 세션에서)
								var currentUserId = '<%= session.getAttribute("user_id") %>'; 

								// 현재 사용자와 글쓴 사용자의 ID가 같을 때만 버튼을 표시합니다.
								if (currentUserId !== null && currentUserId === postAuthorId) 
							        // 삭제 버튼 표시
							        document.querySelector('.bfcDelete').removeAttribute('hidden');
							        // 수정 버튼 표시
							        document.querySelector('.bfcModify').removeAttribute('hidden');
							</script>
							<c:if test="${session.getAttribute('user_no') == users.user_no}">
								<button type="hidden" class="btn bfcDelete">삭제</button>
                                <button type="hidden" class="btn bfcModify">수정</button>
                            </c:if>
                                <button type="button" class="btn bfcList" onclick="goBack()">목록</button>
                                <script>
                                    function goBack() {
                                      window.history.back();
                                    }
                                    </script>
            </div>
            </section>
</main>


    <!-- ======= End Main ======= -->
    
    
    <!-- ======= Footer ======= -->
    <%@ include file="../footer.jsp" %>
    <!-- End Footer -->
   
   
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
   
   
    <!-- Vendor JS Files -->
    <script defer src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script defer src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script defer src="assets/vendor/chart.js/chart.umd.js"></script>
    <script defer src="assets/vendor/echarts/echarts.min.js"></script>
    <script defer src="assets/vendor/quill/quill.min.js"></script>
    <script defer src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script defer src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script defer src="assets/vendor/php-email-form/validate.js"></script>
    
    
    <!-- Template Main JS File -->
    <script defer src="assets/js/lsl/main.js"></script>
</body>
</html>
