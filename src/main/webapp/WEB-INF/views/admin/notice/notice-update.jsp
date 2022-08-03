<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/admin-header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<%@ include file="../inc/admin-header.jsp"%>

<!-- main -->
<main class="board-detail container w-50 p-5">
<form id="updateForm" action=<c:url value="notice-update?nno=${pageInfo.nno}"/> method="post">


	<h5 class="mb-3">공지사항</h5>
	<table class="table">
		<tbody>
		
			<input type="hidden" name="nno" value="${pageInfo.nno }">
			
				<tr>
					<th>제목</th>
					<td><input class="w-100 cinput" type="text" name="ntitle"
						value=" ${pageInfo.ntitle}" /></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td><input class="w-30 cinput" type="text" name="nwriter_id"
						value="${pageInfo.nwriter_id}" />
				<tr>
				<tr>
					<th>첨부파일</th>
					<td class="text-align-left text-indent"><input type="file"
						name="nfiles" value="${pageInfo.nfiles}" /></td>
				</tr>

				<tr>
					<td colspan="7">
						<div class="content">
							<input class="w-30 cinput" type="text" name="ncontent"
								value="${pageInfo.ncontent}" />
						</div>
					</td>
				</tr>
		</tbody>
	</table>
	<div class="one-menu w-100">

		<button class="three-menu">
			<a href="notice-list"on">ìì ìë£</a>
	</div>
	<div>
		<button class="three-menu">
			<a href="notice-detail" id="cancel_btn">ìì ì·¨ì</a>
	</div>
	<div>
		<button class="three-menu">
			<a href="notice-list" id="cancel_btn">ëª©ë¡</a>
	</div>
	</form>

	<form id="infoForm" action="/notice-update" method="post">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">s
		<input type="hidden" name="amount" value="${pageMake.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMake.cri.keyWord}">
		<input type="hidden" name="nno" value="${pageInfo.nno }">

	</form>



	<script>
		let form = $("#infoForm"); 
		let uForm = $("#updateForm");

		
		$("#list_btn").on("click", function(e) {
			form.find("#nno").remove();
			form.attr("action", "/notice-list");
			form.submit();
		});

	
		$("#update_btn").on("click", function(e) {
			uForm.submit();
		});

		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/notice-detail");
			form.submit();
		});
	</script>



</main>

<%@ include file="../inc/footer.jsp"%>