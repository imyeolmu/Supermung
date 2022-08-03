<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>


<!-- main -->
<main class="board-detail container w-50 p-5">

<form id="detailForm" method=post">
	<h5 class="mb-3">공지사항</h5>
	<table class="table">
			<tbody>
				<tr>
					<th>번호</th>
					<td><c:out value="${pageInfo.nno}" /></td>

				</tr>


				<tr>
					<th>제목</th> 
					<td><c:out value="${pageInfo.ntitle}" /></td>

				</tr>
				<tr>
					<th>작성일</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${pageInfo.nregdate}" /></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td><c:out value="${pageInfo.nwriter_id}" /></td>


					<th>조회수</th>
					<td><c:out value="${pageInfo.nhit}" /></td>
				</tr>

				<tr>
					<td colspan="7">
						<div class="content">
							<c:out value="${pageInfo.ncontent}" />
						</div>
					</td>
				</tr>
		</tbody>
	</table>
	<div class="one-menu w-100">

		<td class="three-menu">
		<a href="notice-update?nno=${pageInfo.nno}">수정</a></td>
		
	
		<button class="three-menu"><a href="notice-list" onClick='list_btn()' />목록
		</button>
		<button class="three-menu">
			<a href="<c:url value='notice-delete?nno=${pageInfo.nno}'/>"onClick='delete_btn()' />삭제
		</button>
	</form>
	</div>
	<form id="infoForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMake.cri.amount}">
		<input type="hidden" name="amount" value="${pageMake.cri.keyWord}">
		<input type="hidden" name="nno" value="${pageInfo.nno}">
	</form>


</main>




<!-- 
<script type="text/javascript">

	function update_btn() {
	
		var form = document.getElementById("detailForm");
	
		form.action = "<c:url value='/notice-update'/>";
		form.attr("method", "post");
		form.submit();
	
		
		
		
	}

	function list_btn() {

		var form = document.getElementById("detailForm");

		form.action = "<c:url value='/notice-list'/>";
		form.submit();

	}

	function delete_btn() {

		var form = document.getElementById("detailForm");

		form.action = "<c:url value='/notice-delete'/>";
		form.attr("method", "post");
		form.submit();

	}
</script> -->
 -->
<%@ include file="../inc/footer.jsp"%>