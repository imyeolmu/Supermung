<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/client-header.jsp"%>

<style>
.activePage {
	border: 3px solid #AB93C9;
	background-color: #AB93C9;
	border-radius: 7px;
}
</style>

<script type="text/javascript">
	//페이징
	$(".notice-page a").on("click", function(e) {
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/product-list");
		moveForm.submit();
	});
</script>

<!-- Start Product Grids -->
<section class="product-grids section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-12">
				<!-- Start Product Sidebar -->
				<div class="product-sidebar">
					<!-- Start Single Widget -->
					<div class="single-widget search">
						<h3>상품 검색</h3>
						<form id="searchForm" method="post" action='client-product-list'>
							<input type="text"name="keyWord" id="keyWord" placeholder="상품명을 입력하세요" value="${cri.keyWord}">
							<select name="searchType" style="display:none">
								<option value="N"
									<c:out value="${pageMake.cri.searchType == 'N' ? 'selected':''}"/>>상품명</option>
							</select>
							<button type="submit">
								<i class="lni lni-search-alt"></i>
							</button>
						</form>
					</div>
					<!-- End Single Widget -->
					<!-- Start Single Widget -->
					<form class="single-widget" action="<c:url value='client-product-list-category'/>" method="post">
						<h3>카테고리</h3>
						<ul class="list">
							<c:forEach items="${cateList}" var="cateList">
								<li>
									<a href="client-product-list-category?cateCode=${cateList.cateCode}">
									<c:out value="${cateList.cateName}"/></a>
								</li>
							</c:forEach>
						</ul>
					</form>
					<!-- End Single Widget -->
				</div>
				<!-- End Product Sidebar -->
			</div>
			<div class="col-lg-9 col-12">
				<div class="product-grids-head">
					<div class="product-grid-topbar">
						<div class="row align-items-center">
							<div class="col-lg-7 col-md-8 col-12">
								<div class="product-sorting">
									<label for="sorting">Sort by:</label> 
									<select class="form-control" id="sorting">
										<option>Popularity</option>
										<option>Low - High Price</option>
										<option>High - Low Price</option>
										<option>Average Rating</option>
										<option>A - Z Order</option>
										<option>Z - A Order</option>
									</select>
									<h3 class="total-show-product" style="color:#333">
										Pages: <span>${pageMake.cri.pageNum}/${pageMake.realEnd} pages</span>
									</h3>
								</div>
							</div>
							<div class="col-lg-5 col-md-4 col-12">
								<nav>
									<div class="nav nav-tabs" id="nav-tab" role="tablist">
										<button class="nav-link active" id="nav-grid-tab"
											data-bs-toggle="tab" data-bs-target="#nav-grid" type="button"
											role="tab" aria-controls="nav-grid" aria-selected="true">
											<i class="lni lni-grid-alt"></i>
										</button>
									</div>
								</nav>
							</div>
						</div>
					</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-grid"
							role="tabpanel" aria-labelledby="nav-grid-tab">
							<div class="row">
								<c:forEach items="${list}" var="list">
									<div class="col-lg-4 col-md-6 col-12">
										<!-- Start Single Product -->
										<div class="single-product" style="height: 390px">
											<div class="product-image">
												<img src="<c:out value='${list.pimage}'/>" />
												 <div class="button">
					                             <!-- 로그인 하지 않는 상태 -->
				                                 <c:if test="${member == null}">
				                                 	<a href="<c:url value='insert'/>" onClick="alert('로그인 후 이용해주세요.')" class="btn"><i class="lni lni-cart"></i>장바구니</a>
				                                 </c:if>
				                                 <!-- 로그인 상태 -->
				                                 <c:if test="${member != null}">
				                                    <a href="<c:url value='insert?pnum=${list.pnum}&cartAmount=1'/>" class="btn"><i class="lni lni-cart"></i>장바구니</a>
				                                 </c:if>
					                            </div>
											</div>
											<div class="product-info">
												<span class="category"></span>
												<h4 class="title">
													<span class="category">${list.pcategory_fk1}</span>
													<a href="<c:url value='client-product-detail?pnum=${list.pnum}'/>"><c:out value="${list.pname}" /></a>
												</h4>
												<div class="price">
													<span><fmt:formatNumber value="${list.price}"
															pattern="#,##0" />원</span>
												</div>
											</div>
										</div>
										<!-- End Single Product -->
									</div>
								</c:forEach>
							</div>
							<div class="notice-footer w-100">
								<div class="indexer align-right pagination left">
									<ul id="pageInfo" class="pagination-list">
										<!-- 맨앞으로 버튼 -->
										<c:if test="${pageMake.prev}">
											<li class="next pageInfo_btn"><a
												href="?pageNum=${pageMake.realStart}&amount=12"><i
													class="lni lni-angle-double-left"></i></a></li>
										</c:if>
										<!-- 이전페이지 버튼 -->
										<c:if test="${pageMake.prev}">
											<li class="prev pageInfo_btn"><a
												href="?pageNum=${pageMake.startPage-1}&amount=12"><i
													class="lni lni-chevron-left"></i></a></li>
										</c:if>
										<!-- 각 번호 페이지 버튼 -->
										<c:forEach var="num" begin="${pageMake.startPage}"
											end="${pageMake.endPage}">
											<li
												class="pageInfo_btn ${pageMake.cri.pageNum == num ? 'activePage':'' }"><a
												href="?pageNum=${num}&amount=12">${num}</a></li>
										</c:forEach>
										<!-- 다음페이지 버튼 -->
										<c:if test="${pageMake.next}">
											<li class="next pageInfo_btn"><a
												href="?pageNum=${pageMake.endPage+1}&amount=12"><i
													class="lni lni-chevron-right"></i></a></li>
										</c:if>
										<!-- 맨끝으로 버튼 -->
										<c:if test="${pageMake.next}">
											<li class="next pageInfo_btn"><a
												href="?pageNum=${pageMake.realEnd}&amount=12"><i
													class="lni lni-angle-double-right"></i></a></li>
										</c:if>
									</ul>
									<form action='product-list' method="get" id="moveForm">
										<input type="hidden" name="pageNum"
											value="${pageMake.cri.pageNum}"> <input type="hidden"
											name="amount" value="${pageMake.cri.amount}"> <input
											type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">
										<input type="hidden" name="searchType"
											value="${pageMake.cri.searchType}">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Product Grids -->
<%@ include file="../inc/footer.jsp"%>
