<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./inc/admin-header.jsp"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>>
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

    });

</script>  


<main class="board container w-100 p-5">
	<form action='admin-order' method="get" id="moveForm" name="moveForm">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMake.cri.amount}">
		<input type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">
		<input type="hidden" name="searchType" value="${pageMake.cri.searchType}">
	</form>
	<form action='orderCancel' method="post" id="deleteForm">
		<input type="hidden" name="orderId">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMake.cri.amount}">
		<input type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">
		<input type="hidden" name="memberId" value="${member.id}">
	</form>
	<h4>주문현황</h4>
	<!-- 검색창  -->
		 <form id="searchForm" method="post" action='admin-order'>
         <div class="search">
            <select name="searchType">
				<option
					<c:out value="${pageMake.cri.searchType == null ? 'selected':''}"/>>선택</option>
				<option value="O"
					<c:out value="${pageMake.cri.searchType == 'O' ? 'selected':''}"/>>주문번호</option>
				<option value="I"
					<c:out value="${pageMake.cri.searchType == 'I' ? 'selected':''}"/>>주문아이디</option>
				<option value="S"
					<c:out value="${pageMake.cri.searchType == 'S' ? 'selected':''}"/>>배송상태</option>
            </select>
            <input class="board-search" type="text" name="keyWord" id="keyWord"
               placeholder="검색어를 입력하세요" value="${cri.keyWord}"/> 
            <button id="btn-search" class="button board-search-button">검색</button>
         </div>
      </form>   
	<table class="table mt-5">
		<thead>
		<thead>
			<tr class="text-center">
				<th style="width:21%">주문번호</th>
				<th style="width:20%">주문아이디</th>
				<th style="width:20%">주문날짜</th>
				<th style="width:20%">주문상태</th>
				<th style="width:19%">취소</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr class="text-center">
				<td class="list"><c:out value="${list.orderId}"/></td>
				<td width="100"><nobr /><c:out value="${list.id}"/></td>
				<!-- 날짜 포맷 변경 -->
				<td width="100"><nobr /><fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd"/></td>
				<td width="100"><nobr /><c:out value="${list.orderState}"/></td>
				<td width="100">
					<form action="orderCancel" method="post">
					<c:if test="${list.orderState eq '배송준비'}">
						<button class="delete_btn btn" data-orderid="${list.orderId}" type="submit" style="padding: 0;"><i class="lni lni-cross-circle"></i></button>
					</c:if>
					</form>
				</td>		
			</tr>
				<script>
					$(".delete_btn").on("click", function(e){
						
						e.preventDefault();
						
						let id = $(this).data("orderid");
						
						$("#deleteForm").find("input[name='orderId']").val(id);
						$("#deleteForm").submit();
					});
				</script>		
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
</main>

<%@ include file="./inc/footer.jsp"%>