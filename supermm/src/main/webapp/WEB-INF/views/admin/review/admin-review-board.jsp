<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>

<!-- main 부분 여기여기 폼 부분 -->
<main class="board container w-100 p-5">
	<h4>리뷰게시판</h4>
	<!-- 검색창  -->
	<table class="table">
		<thead>
			<div class="search">
				<select>
					<option value="title">제목</option>
					<option value="writerId">작성자</option>
				</select> <input class="board-search" type="text" name="q" value=""
					placeholder="검색어를 입력하세요" /> <input
					class="button board-search-button" type="submit" value="검색" />
			</div>
			<tr class="text-center">
				<th class="w60">번호</th>
				<th class="expand">제목</th>
				<th class="w100">작성자</th>
				<th class="w100">작성일</th>
				<th class="w60">조회수</th>
				<th class="w10">공개</th>
				<th class="w10">삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-center">
				<td width="100"><nobr />8</td>
				<td width="100"><nobr /><a href="admin-review-detail" class="pro-hre">리뷰입니다</a></td>
				<td width="100"><nobr />newlec</td>
				<td width="100"><nobr /> 2019-08-18</td>
				<td width="100"><nobr />146</td>
				<td><input type="checkbox" name="open"></td>
				<td><input type="checkbox" name="del"></td>
			</tr>
		</tbody>
	</table>
	<div class="notice-footer w-100">
		<div class="indexer align-right">
			<p class="notice-page">
				<span>1</span> / 1 pages
			</p>
			<button class="bloc" type="submit">공개</button>
			<button class="bloc" type="submit">삭제</button>
			<ul class="text-center pager">
				<button class="prev" onclick="alert('이전 페이지가 없습니다.');">
					<i class="lni lni-chevron-left"></i>
				</button>
				<li><a class="-text- orange bold" href="#">1</a></li>
				<button class="next" onclick="alert('다음 페이지가 없습니다.');">
					<i class="lni lni-chevron-right"></i>
				</button>
			</ul>
		</div>
	</div>
</main>

<%@ include file="../inc/footer.jsp"%>