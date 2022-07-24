<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>

<!-- main -->
<main class="board-detail container w-50 p-5">
	<h5 class="mb-3">문의하기</h5>
	<table class="table">
		<tbody>
			<tr>
				<th>제목</th>
				<td colspan="3">멍</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td colspan="3">2019-08-18</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>멍</td>
				<th>조회수</th>
				<td>148</td>
			</tr>
			<tr>
				<td colspan="7">
					<div class="content">안녕하세요 멍멍입니다.</div>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="one-menu w-100">
		<button class="three-menu" type="submit">목록</button>
	</div>
	<form class="form" method="post" action="../../resources/mail/mail.php">
		<div class="container reply">
			<h5 class="ms-3">답변</h5>
			<div class="row">
				<p>안녕하세요안녕하세요안녕하세요안녕하세요 안녕하세요안녕하세요안녕하세요안녕하세요 안녕하세요안녕하세요안녕하세요
					안녕하세요안녕하세요안녕하세요안녕하세요 안녕하세요안녕하세요안녕하세요안녕하세요</p>
			</div>
			<div class="form-group">
				<button type="submit" class="btn">답변수정</button>
				<button type="submit" class="btn">답변삭제</button>
			</div>
		</div>
	</form>
</main>

<%@ include file="../inc/footer.jsp"%>