<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>>
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
						<form action="#">
							<input type="text" placeholder="검색어를 입력하세요">
							<button type="submit">
								<i class="lni lni-search-alt"></i>
							</button>
						</form>
					</div>
					<!-- End Single Widget -->
					<!-- Start Single Widget -->
					<div class="single-widget">
						<h3>카테고리</h3>
						<ul class="list">
							<c:set value="${plist}" var="plist" />
							<c:forEach items="${cateList}" var="cateList">
								<%-- <c:if test="${cateList.cateParent ne null}"> --%>
										<%-- <c:if test="${cateList.cateName eq plist.pcategory_fk2 ne null}"> --%>
									<li>
											<a href="client-product-list-category?cateCode=${cateList.cateCode}">
											<c:out value="${cateList.cateName}"/></a>
									</li>
										<%-- </c:if> --%>
								<%-- </c:if> --%>
							</c:forEach>
						</ul>
					</div>
					<!-- End Single Widget -->
					<!-- Start Single Widget -->
					<!-- <div class="single-widget range">
						<h3>Price Range</h3>
						<input type="range" class="form-range" name="range" step="1"
							min="100" max="10000" value="10"
							onchange="rangePrimary.value=value">
						<div class="range-inner">
							<label>$</label> <input type="text" id="rangePrimary"
								placeholder="100" />
						</div>
					</div> -->
					<!-- End Single Widget -->
					<!-- Start Single Widget -->
					<!-- <div class="single-widget condition">
						<h3>Filter by Price</h3>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault1"> <label class="form-check-label"
								for="flexCheckDefault1"> $50 - $100L (208) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault2"> <label class="form-check-label"
								for="flexCheckDefault2"> $100L - $500 (311) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault3"> <label class="form-check-label"
								for="flexCheckDefault3"> $500 - $1,000 (485) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault4"> <label class="form-check-label"
								for="flexCheckDefault4"> $1,000 - $5,000 (213) </label>
						</div>
					</div> -->
					<!-- End Single Widget -->
					<!-- Start Single Widget -->
					<!-- <div class="single-widget condition">
						<h3>Filter by Brand</h3>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault11"> <label class="form-check-label"
								for="flexCheckDefault11"> Apple (254) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault22"> <label class="form-check-label"
								for="flexCheckDefault22"> Bosh (39) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault33"> <label class="form-check-label"
								for="flexCheckDefault33"> Canon Inc. (128) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault44"> <label class="form-check-label"
								for="flexCheckDefault44"> Dell (310) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault55"> <label class="form-check-label"
								for="flexCheckDefault55"> Hewlett-Packard (42) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault66"> <label class="form-check-label"
								for="flexCheckDefault66"> Hitachi (217) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault77"> <label class="form-check-label"
								for="flexCheckDefault77"> LG Electronics (310) </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="flexCheckDefault88"> <label class="form-check-label"
								for="flexCheckDefault88"> Panasonic (74) </label>
						</div>
					</div> -->
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
										<!-- <button class="nav-link active" id="nav-list-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-list" type="button" role="tab"
                                                aria-controls="nav-list" aria-selected="false"><i
                                                    class="lni lni-list"></i></button> -->
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
										<div class="single-product" style="height: 370px">
											<div class="product-image">
												<img src="<c:out value='${list.pimage}'/>" />
												<div class="button">
													<a href="client-product-detail" class="btn"><i
														class="lni lni-cart"></i>장바구니로</a>
												</div>
											</div>
											<div class="product-info">
												<span class="category"></span>
												<h4 class="title">
													<a href="<c:url value='client-product-detail?pnum=${list.pnum}'/>"><c:out value="${list.pname}" /></a>
												</h4>
												<!-- <ul class="review">
												<li><i class="lni lni-star-filled"></i></li>
												<li><i class="lni lni-star-filled"></i></li>
												<li><i class="lni lni-star-filled"></i></li>
												<li><i class="lni lni-star-filled"></i></li>
												<li><i class="lni lni-star"></i></li>
												<li><span>4.0 Review(s)</span></li>
											</ul> -->
												<div class="price">
													<span><fmt:formatNumber value="${list.price}"
															pattern="#,##0" /></span>
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
</section>
<!-- End Product Grids -->
<%@ include file="../inc/footer.jsp"%>