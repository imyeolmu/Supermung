<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>
<style>
.activePage {
	background-color: rgba(171, 147, 201, 0.1);
	
}
</style>
<main class="board container w-100 p-5">
	<h4>회원 목록</h4>
	<!-- 검색창  -->
	<table class="table">
		<thead>
			<div class="search">
				<select>
					<option value="name">회원명</option>
					<option value="birthday">생년월일</option>
					<option value="gender">성별</option>
					<option value="addr">주소</option>
					<option value="regdate">가입일</option>
				</select> <input class="board-search" type="text" name="q" value=""
					placeholder="검색어를 입력하세요" /> <input
					class="button board-search-button" type="submit" value="검색" />
			</div>
			<tr class="text-center">
				<th style="width:5%">NO</th>
				<th style="width:10%">아이디</th>
				<th style="width:10%">비밀번호</th>
				<th style="width:10%">이름</th>
				<th style="width:10%">생년월일</th>
				<th style="width:10%">성별</th>
				<th style="width:10%">이메일</th>
				<th style="width:10%">전화번호</th>
				<th style="width:10%">우편번호</th>
				<th style="width:15%">주소</th>
				<th style="width:13%">회원포인트</th>
				<th style="width:10%">가입일</th>
				<th style="width:7%">삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr class="text-center">
				<!-- 회원번호(primarykey) 클릭하면 수정페이지로 넘어가기 -->
				<td width="100"><nobr /><a href="member-info?mnum=${list.mnum}" class="pro-hre"><c:out value="${list.mnum}"/></a></td>
				<td width="100"><nobr /><a href="member-info?mnum=${list.mnum}" class="pro-hre"><c:out value="${list.id}"/></a></td>
				<!-- 비밀번호 *****로 나오도록 -->
				<td width="100"><nobr /><c:out value="${fn:replace(list.pw,list.pw,'*****')}"/></td>
				<td width="100"><nobr /><c:out value="${list.name}"/></td>
				<!-- 생년월일 날짜 포맷 변경 -->
				<td width="100"><nobr /><fmt:formatDate value="${list.birth}" pattern="yy-MM-dd"/></td>
				<td width="100"><nobr /><c:out value="${list.gender}"/></td>
				<td width="100"><nobr /><c:out value="${list.email}"/></td>
				<td width="100"><nobr /><c:out value="${list.phone}"/></td>
				<td width="100"><nobr /><c:out value="${list.zipcode}"/></td>
				<td width="100"><nobr /><c:out value="${list.addr1}(${list.addr2}), ${list.addr3}"/></td>
				<!-- 숫자 포맷 변경 -->
				<td width="100"><nobr /><a href="member-point?mnum=${list.mnum}" class="pro-hre"><fmt:formatNumber value="${list.mpoint}" pattern="#,##0"/>P</a></td>				
				<!-- 가입일 날짜 포맷 변경 -->
				<td width="100"><nobr /><fmt:formatDate value="${list.regdate}" pattern="yy-MM-dd"/></td>
				<td><input type="checkbox" name="del" id="del"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		<div class="notice-footer w-100">
		<div class="indexer align-right">
		<span>${pageMake.cri.pageNum}/${pageMake.realEnd} pages</span>
			<ul id="pageInfo" class="notice-page pager">
				<!-- 맨앞으로 버튼 -->
				<c:if test="${pageMake.prev}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.realStart}&amount=5"><i class="lni lni-angle-double-left"></i></a></li>
				</c:if>
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMake.prev}">
					<li class="prev pageInfo_btn"><a href="?pageNum=${pageMake.startPage-1}&amount=5"><i class="lni lni-chevron-left"></i></a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMake.startPage}" end="${pageMake.endPage}">
					 <li class="pageInfo_btn ${pageMake.cri.pageNum == num ? 'activePage':'' }"><a href="?pageNum=${num}&amount=5">${num}</a></li>
				</c:forEach>
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.endPage+1}&amount=5"><i class="lni lni-chevron-right"></i></a></li>
				</c:if>
				<!-- 맨끝으로 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.realEnd}&amount=5"><i class="lni lni-angle-double-right"></i></a></li>
				</c:if>
			</ul>
			<button class="bloc" type="submit">삭제</button>
			<button class="write">
				<a href="product-input">등록</a>
			</button>
		</div>
	</div>
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMake.cri.amount}">
	</form>
</main>

<script type="text/javascript">
	$(".notice-page a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/product-list");
		moveForm.submit();
	});
</script>

<%@ include file="../inc/footer.jsp"%>