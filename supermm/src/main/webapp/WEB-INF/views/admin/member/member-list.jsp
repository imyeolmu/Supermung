<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<style>
.activePage {
	border: 4px solid  rgba(171, 147, 201, 0.1);
	background-color:  rgba(171, 147, 201, 0.1);
	border-radius: 4px;
}
</style>


<script type="text/javascript">
$(document).ready(function(){   
	/************* 페이징 ***************/
	var moveForm =$("#moveForm");
	$(".pageInfo_btn a").on("click", function(e){
		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.submit();
	});

	//검색    
	$(".search button").on("click", function(e){
    	e.preventDefault();
    	
    	let searchType = $(".search select").val();
    	let keyWord = $(".search input[name='keyWord']").val();
    	
    	if(!searchType) {
    		alert("검색종류를 선택하세요.");
    		return false;
    	}
    	
    	if(!keyWord) {
    		alert("키워드를 입력하세요.");
    		return false;
    	}
    	
    	moveForm.find = $("input[name='searchType']").val(searchType);
    	moveForm.find("input[name='keyWord']").val(keyWord);
    	moveForm.find("input[name='pageNum']").val(1);
    	moveForm.submit();
    });
    
</script>

<main class="board container w-100 p-5">
	<h4>회원 목록</h4>
	<!-- 검색창  -->
	<table class="table">
		<thead>
			<form id="searchForm" method="post" action="member-list">
				<div class="search">
					<select name="searchType">
						<option value="" <c:out value="${pageMake.cri.searchType == null ? 'selected':''}"/>>선택</option>
						<option value="N"
							<c:out value="${pageMake.cri.searchType eq 'N' ? 'selected':''}"/>>회원명</option>
						<option value="G"
							<c:out value="${pageMake.cri.searchType eq 'G' ? 'selected':''}"/>>성별</option>
					</select> 
					<input class="board-search" type="text" name="keyWord"
						id="keyWord" placeholder="검색어를 입력하세요" value="${pageMake.cri.keyWord}" />
					<button id="btn-search" class="button board-search-button">검색</button>
				</div>
			</form>
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
				<th style="width:13%">충전금액</th>
				<th style="width:13%">회원포인트</th>
				<th style="width:10%">가입일</th>
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
				<td width="100"><nobr /><c:out value="${list.birth}"/></td>
				<td width="100"><nobr /><c:out value="${list.gender}"/></td>
				<td width="100"><nobr /><c:out value="${list.email}"/></td>
				<td width="100"><nobr /><c:out value="${list.phone}"/></td>
				<td width="100"><nobr /><c:out value="${list.addr1}"/></td>
				<td width="100"><nobr /><c:out value="${list.addr2}, ${list.addr3}"/></td>
				<!-- 숫자 포맷 변경 -->
				<td width="100"><nobr /><fmt:formatNumber value="${list.money}" pattern="#,##0"/>P</a></td>				
				<!-- 숫자 포맷 변경 -->
				<td width="100"><nobr /><a href="member-point?mnum=${list.mnum}" class="pro-hre"><fmt:formatNumber value="${list.mpoint}" pattern="#,##0"/>P</a></td>				
				<!-- 가입일 날짜 포맷 변경 -->
				<td width="100"><nobr /><fmt:formatDate value="${list.regdate}" pattern="yy-MM-dd"/></td>
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
					<li class="next pageInfo_btn"><a class="page-link" href="${pageMake.realStart}" style="border:none">
					<i class="lni lni-angle-double-left"></i></a></li>
				</c:if>
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMake.prev}">
					<li class="prev pageInfo_btn">
					<a class="page-link" href="${pageMake.startPage-1}" style="border:none"><i class="lni lni-chevron-left"></i></a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMake.startPage }" end="${pageMake.endPage }">
				<li class="pageInfo_btn ${pageMake.pageNum eq num ? 'activePage' : ''}">
				<a class="page-link" href="${num}" style="border:none">${num}</a>
				</li>
				</c:forEach>
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn">
					<a class="page-link" href="${pageMake.endPage+1}" style="border:none"><i class="lni lni-chevron-right"></i></a></li>
				</c:if>
				<!-- 맨끝으로 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn">
					<a class="page-link" href="${pageMake.realEnd}" style="border:none">
					<i class="lni lni-angle-double-right"></i></a></li>
				</c:if>
         </ul>
		</div>
	</div>
	<form action="member-list" method="get" id="moveForm"  name="moveForm">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMake.cri.amount}">
		<input type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">
		<input type="hidden" name="searchType" value="${pageMake.cri.searchType}">
	</form>

</main>

<%@ include file="../inc/footer.jsp"%>