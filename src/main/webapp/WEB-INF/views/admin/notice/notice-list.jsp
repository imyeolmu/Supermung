<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/admin-header.jsp"%>

		
		
<script type="text/javascript">
		
	$(".notice-page a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/product-list");
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
	<h4>공지사항</h4>
	<!-- 검색창  -->
	<table class="table">
		<thead>
		<form id="searchForm" method="post" action='notice-list'>
         <div class="search">
            <select name="searchType">
				<option
					<c:out value="${pageMake.cri.searchType == null ? 'selected':''}"/>>선택</option>
				<option value="N"
					<c:out value="${pageMake.cri.searchType == 'N' ? 'selected':''}"/>>제목</option>
				<option value="G"
					<c:out value="${pageMake.cri.searchType eq 'C' ? 'selected':''}"/>>내용</option>
            </select>
            <input class="board-search" type="text" name="keyWord" id="keyWord"
               placeholder="검색어를 입력하세요" value="${cri.keyWord}"/> 
            <button id="btn-search" class="button board-search-button">검색</button>
         </div>
         </form>
		
		
		
		</div>
		<tr class="text-center">
			<th class="w10">NO</th>
			<th class="expand">제목</th>
			<th class="w30">작성자</th>
			<th class="w30">작성일</th>
			<th class="w10">조회수</th>
		</tr>
		</thead>
		<tbody>
			<form id="nextForm" method="post">
				<c:forEach items="${list}" var="list">
					<tr class="text-center">
						<td width="100"><nobr /> <c:out value="${list.nno}" /></td>

						<td width="100"><nobr /><a class="move link-dark"
							href='/notice-detail?nno=<c:out value="${list.nno}"/>'><nobr />
								<c:out value="${list.ntitle}" /></a></td>
						<td width="100"><nobr /> <c:out value="${list.nwriter_id}" /></td>

						<td width="100"><nobr /> <fmt:formatDate
								pattern="yyyy-MM-dd" value="${list.nregdate}" /></td>
						<td width="100"><nobr /> <c:out value="${list.nhit}" /></td>

					</tr>
				</c:forEach>
			</form>
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
			<button class="write">
				<a href="notice-register">글쓰기</a>
			</button>
		</div>
	</div>
	

</main>




<script type="text/javascript">


// 조회하기
    let moveForm = $("#moveForm");
    let sForm = $("#serachForm");
    let nForm=$("#nextForm");
    
    
   
 
    $(".move").on("click", function(e){
        e.preventDefault();
        
        moveForm.append("<input type='hidden' name='nno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/notice-detail");
        moveForm.submit();
    });
    

	</script>
</main>




<%@ include file="../inc/footer.jsp"%>



