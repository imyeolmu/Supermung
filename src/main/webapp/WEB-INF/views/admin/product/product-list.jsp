<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>

<!-- main 부분 여기여기 폼 부분 -->
<main class="board container w-100 p-5">
	<h4>상품 목록</h4>
	<!-- 검색창  -->
	<table class="table">
		<thead>
		<thead>
			<div class="search">
				<select>
					<option value="title">상품이름</option>
					<option value="writerId">카테고리</option>
				</select> <input class="board-search" type="text" name="q" value=""
					placeholder="검색어를 입력하세요" /> <input
					class="button board-search-button" type="submit" value="검색" />
			</div>
			<tr class="text-center">
				<th class="w60">NO</th>
				<th class="w30">카테고리</th>
				<th class="expand">상품이름</th>
				<th class="w30">제조회사</th>
				<th class="w30">상품사진</th>
				<th class="w10">상품수량</th>
				<th class="w30">상품가격</th>
				<th class="w10">상품스펙</th>
				<th class="w50">상품소개</th>
				<th class="w30">적립포인트</th>
				<th class="w30">등록날짜</th>
				<th class="w10">삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-center">
				<!-- 상품번호(primarykey) 클릭하면 수정페이지로 넘어가기 -->
				<td><a href="product-update" class="pro-hre">1</a></td>
				<td width="100"><nobr />카테고리</td>
				<td width="100"><nobr />개껌</td>
				<td width="100"><nobr />슈퍼멍뭉</td>
				<td width="100"><nobr />사진파일명</td>
				<td width="100"><nobr />100개</td>
				<td width="100"><nobr />10,000</td>
				<td width="100"><nobr />Best</td>
				<td width="100"><nobr />너무 맛있게먹네요</td>
				<td width="100"><nobr />100</td>
				<td width="100"><nobr />2022-07-21</td>
				<td width="100"><nobr /><input type="checkbox" name="del" id="del"></td>
			</tr>
		</tbody>
	</table>
	<div class="notice-footer w-100">
		<div class="indexer align-right">
			<p class="notice-page">
				<span>1</span> / 1 pages
			</p>
			<button class="bloc" type="submit">삭제</button>
			<button class="write">
				<a href="product-input">등록</a>
			</button>
			<ul class="text-center pager">
				<button class="prev" onclick="alert('이전 페이지가 없습니다.');">
					<i class="lni lni-chevron-left"></i>
				</button>
				<li><a class="-text- orange bold" href="?p=1&t=&q=">1</a></li>
				<button class="next" onclick="alert('다음 페이지가 없습니다.');">
					<i class="lni lni-chevron-right"></i>
				</button>
			</ul>
		</div>
	</div>
</main>

<%@ include file="../inc/footer.jsp"%>