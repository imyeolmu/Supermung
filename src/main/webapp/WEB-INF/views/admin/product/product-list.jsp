<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/admin-header.jsp"%>

<style>
.activePage {
	background-color: rgba(171, 147, 201, 0.1);
	
}
</style>

<!-- main 부분 여기여기 폼 부분 -->
<main class="board container w-100 p-5">
	<h4>상품 목록</h4>
	<!-- 검색창  -->
	<table class="table">
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
				<th style="width:5%">NO</th>
				<th style="width:7%">대분류</th>
				<th style="width:10%">소분류</th>
				<th style="width:25%">상품명</th>
				<th style="width:10%">이미지</th>
				<th style="width:10%">브랜드</th>
				<th style="width:10%">사양</th>
				<th style="width:7%">수량</th>
				<th style="width:10%">가격</th>
				<!-- <th class="w50">상품소개</th> -->
				<th style="width:10%">적립포인트</th>
				<th style="width:7%">삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr class="text-center">
				<!-- 상품번호(primarykey) 클릭하면 수정페이지로 넘어가기 -->
				<td><a href="product-update" class="pro-hre">${list.pnum}</a></td>
				<td width="100"><nobr /><c:out value="${list.pcategory_fk1}"/></td>
				<td width="100"><nobr /><c:out value="${list.pcategory_fk2}"/></td>
				<td width="100"><a href="product-update" class="pro-hre"><nobr /><c:out value="${list.pname}"/></a></td>
				<td width="100"><nobr /><img src="<c:out value='${list.pimage}'/>"/></td>
				<td width="100"><nobr /><c:out value="${list.pcompany}"/></td>
				<td width="100"><nobr /><c:out value="${list.pspec}"/></td>
				<td width="100"><nobr /><fmt:formatNumber value="${list.pqty}" pattern="#,##0"/></td>
				<%-- <td width="100" ><nobr /><c:out value="${list.price}"/></td> --%>
				<td width="100" ><nobr /><fmt:formatNumber value="${list.price}" pattern="#,##0"/></td>
				<td width="100"><fmt:formatNumber value="${list.ppoint}" pattern="#,##0"/></td>
				<!-- <td width="100"><nobr />소개</td> -->
				<td width="100"><nobr /><input type="checkbox" name="del" id="del"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="notice-footer w-100">
		<div class="indexer align-right">
			<ul id="pageInfo" class="notice-page pager">
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
			</ul>
					<!-- <span>1</span> / 1 pages -->
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
	
	//천 단위 콤마 및 소수점 자르기
	function NumberWithCommas(double, decimalPointCipher) {
	    var parts = double.toString().split(".");
	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    parts[1] = parts[1].substr(0, decimalPointCipher);
	    if (decimalPointCipher < 1) {
	        return parts[0];
	    }
	    else {
	        return parts.join(".");
	    }
	}
</script>

<%@ include file="../inc/footer.jsp"%>