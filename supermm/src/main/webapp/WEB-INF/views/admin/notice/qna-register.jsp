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
		<button class="two-menu" type="submit">등록</button>
		<button class="three-menu" type="submit">취소</button>
	</div>
	<div>
		<table class="table mt-3">
			<tbody>
				<tr>
					<th>다음글</th>
					<td colspan="3" class="text-align-left text-indent">다음글이 없습니다.</td>
				</tr>
				<tr>
					<th>이전글</th>
					<td colspan="3" class="text-align-left text-indent"><a
						class="text-dark text-strong" href="#">멍</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</main>

<%@ include file="../inc/footer.jsp"%>