<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 
<%@ include file="../inc/client-header.jsp"%>


<script>




  

	$(".notice-page a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/client-board-list");
		moveForm.submit();
	});
	
    /************* 검색 ****************/
    var sf = $("#searchForm");
    
    $("#btn-search").on("click", function(e){
       if(!sf.find("input[name='keyWord']").val()){
          alert("키워드를 입력하세요!!");
          $("#keyWord").focus();
          return false;
       }
       sf.submit();
    });
    
    
    

</script>

	
<main class="board container w-100 p-5">
   <form action='notice-list' method="get" id="moveForm">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMake.cri.amount}">
		<input type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">
		<input type="hidden" name="searchType" value="${pageMake.cri.searchType}">
   </form>
	<h4>봉사게시판</h4>
	<!--검색창  -->
	<table class="table">
		<thead>
			<form id="searchForm" method="get" action='client-board-list'>
				<div class="search">
					<select name="searchType">
						<option
							<c:out value="${pageMake.cri.searchType == null ? 'selected':''}"/>>선택</option>
						<option value="N"
							<c:out value="${pageMake.cri.searchType == 'N' ? 'selected':''}"/>>제목</option>
							<option value="C"
							<c:out value="${pageMake.cri.searchType == 'C' ? 'selected':''}"/>>내용</option>
							<option value="W"
							<c:out value="${pageMake.cri.searchType == 'W' ? 'selected':''}"/>>작성자</option>

					</select> <input class="board-search" type="text" name="keyWord"
						id="keyWord" placeholder="검색어를 입력하세요" value="${cri.keyWord}" />
					<button id="btn-search" class="button board-search-button">검색</button>
				</div>
			</form>

			<tr class="text-center">
				<th class="w10">NO</th>
				<th class="expand">제목</th>
				<th class="w30">작성자</th>
				<th class="w30">작성일</th>
				<th class="w10">조회수</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${list}" var="list">
					<tr class="text-center">
						<td width="100"><nobr /> <c:out value="${list.bno}"/></td>
						<td width="100"><nobr /><a class="move link-dark" href='/client-board-detail?bno=<c:out value="${list.bno}"/>'>
								<c:out value="${list.btitle}" /></a></td>
						<td width="100"><nobr /> <c:out value="${list.bwriter_id}" /></td>
						<td width="100"><nobr /> <fmt:formatDate pattern="yyyy-MM-dd" value="${list.bregdate}" /></td>
						<td width="100"><nobr /> <c:out value="${list.bhit}" /></td>
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
					<li class="next pageInfo_btn"><a
						href="?pageNum=${pageMake.realStart}&amount=5"><i
							class="lni lni-angle-double-left"></i></a></li>
				</c:if>
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMake.prev}">
					<li class="prev pageInfo_btn"><a
						href="?pageNum=${pageMake.startPage-1}&amount=5"><i
							class="lni lni-chevron-left"></i></a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMake.startPage}"
					end="${pageMake.endPage}">
					<li
						class="pageInfo_btn ${pageMake.cri.pageNum == num ? 'activePage':'' }"><a
						href="?pageNum=${num}&amount=5">${num}</a></li>
				</c:forEach>
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn"><a
						href="?pageNum=${pageMake.endPage+1}&amount=5"><i
							class="lni lni-chevron-right"></i></a></li>
				</c:if>
				<!-- 맨끝으로 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn"><a
						href="?pageNum=${pageMake.realEnd}&amount=5"><i
							class="lni lni-angle-double-right"></i></a></li>
				</c:if>
			</ul>
			<c:if test="${member != null}">
			<button class="write">
				<a href="<c:url value='client-board-register'/>">글쓰기</a>
			</button>
			</c:if>

		</div>
	</div> 

</main>







<%@ include file="../inc/footer.jsp"%>



