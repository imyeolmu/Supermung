<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	//페이징
	$(".notice-page a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/admin-order");
		moveForm.submit();
	});
</script>

<section id="wrapper">
   <%@ include file="./mypage-header.jsp" %>
    
    <section class="myinfo mt-4 mb-5">
      <div class="myinfo-container p-3">
        <h3 class="text-center">구매내역</h3>
			<table class="money-container table table-borderless text-center mt-5">
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
					<c:if test="${list.id eq member.id}">
						<tr class="text-center">
							<td class="list"><c:out value="${list.orderId}"/></td>
							<td width="100"><nobr /><c:out value="${list.id}"/></td>
							<!-- 날짜 포맷 변경 -->
							<td width="100"><nobr /><fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd"/></td>
							<td width="100"><nobr /><c:out value="${list.orderState}"/></td>
							<td width="100">
								<c:if test="${list.orderState eq '배송준비'}">
									<button class="delete_btn btn" data-orderid="${list.orderId}" style="padding: 0;"><i class="lni lni-cross-circle"></i></button>
								</c:if>
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
						</c:if>		
					</c:forEach>
				</tbody>
			</table>
			<div class="notice-footer w-100">
		<div class="indexer align-right">
		<span>${pageMake.cri.pageNum}/${pageMake.realEnd} pages</span>
			<ul id="pageInfo" class="notice-page pager">
				<!-- 맨앞으로 버튼 -->
				<c:if test="${pageMake.prev}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.realStart}"><i class="lni lni-angle-double-left"></i></a></li>
				</c:if>
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMake.prev}">
					<li class="prev pageInfo_btn"><a href="?pageNum=${pageMake.startPage-1}"><i class="lni lni-chevron-left"></i></a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMake.startPage}" end="${pageMake.endPage}">
					 <li class="pageInfo_btn ${pageMake.cri.pageNum == num ? 'activePage':'' }"><a href="?pageNum=${num}">${num}</a></li>
				</c:forEach>
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.endPage+1}"><i class="lni lni-chevron-right"></i></a></li>
				</c:if>
				<!-- 맨끝으로 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.realEnd}"><i class="lni lni-angle-double-right"></i></a></li>
				</c:if>
			</ul>
			 <form action='client-hisgory' method="get" id="moveForm">
				<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMake.cri.amount}">
				<input type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">				
		   </form>
		   <form action='myOrderCancel' method="post" id="deleteForm">
				<input type="hidden" name="orderId">
				<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMake.cri.amount}">
				<input type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">
				<input type="hidden" name="id" value="${member.id}">
		   </form>
		</div>
	</div>
      </div>
    </section>
</section>

<%@ include file="../inc/footer.jsp"%>