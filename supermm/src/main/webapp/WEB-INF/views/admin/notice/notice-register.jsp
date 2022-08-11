<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>

<%@ include file="../inc/admin-header.jsp"%>
<!-- main -->
<main class="board-detail container w-50 p-5">
	<h5 class="mb-3">공지사항</h5>
	<table class="table">
		<form id="registerForm" action="/notice-register" method="post">
			<tbody>


				<tr>
					<th>제목</th>
					<td><input class="w-70" type="text" name="ntitle" /></td>

				</tr>

				<tr>
					<th>작성자</th>
					<td><input class="w-70 " type="text" name="nwriter_id" />
				<tr>
					<th>첨부파일</th>
					<td class="text-align-left text-indent"><input type="files"
						name="nfiles" /></td>
				</tr>
				<tr>
					<td colspan="7">
						<div class="content">
							<input class="w-30 cinput" type="text" name="ncontent" />
						</div>
					</td>
				</tr>

			</tbody>
		</form>
	</table>
	<div class="one-menu w-100">
		<button class="three-menu">
			<a href="#" onClick='no_addnotice()' />등록
		</button>
		<button class="three-menu" type="button">
			<a href="notice-list" onClick='no_notice()' /> 목록
		</button>
	</div>

</main>

<script>
	function no_addnotice() {

		var form = document.getElementById("registerForm");

		form.action = "<c:url value='/notice-register'/>";
		form.submit();

	}

	function no_notice() {

		var form = document.getElementById("registerForm");

		form.action = "<c:url value='/notice-list'/>";
		form.attr("method", "get");
		form.submit();

	}
</script>


<%@ include file="../inc/footer.jsp"%>