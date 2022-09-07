<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/client-header.jsp"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
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
	var prodForm =$("#prodForm");
    var cateForm =$("#cateForm");

	$(".pageInfo_btn a").on("click", function(e){
		e.preventDefault();
		
		prodForm.find("input[name='pageNum']").val($(this).attr("href"));
		prodForm.submit();
	})
    $(".prodcate_btn a").on("click", function(e){
        e.preventDefault();

        cateForm.find("input[name='pcategory_fk1']").val($(this).attr("href"));
        cateForm.submit();
    });
	});
</script>

<!-- Start Product Grids -->
<section class="product-grids section">
<form action='client-product-list-category' method="get" id="cateForm" name="cateForm" >
	<input type="hidden"name="pcategory_fk1" id="pcategory_fk1" value="${prodCateList}">
</form>

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
									<c:out value="${page.cri.searchType == 'N' ? 'selected':''}"/>>상품명</option>
							</select>
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
							<c:forEach items="${prodCateList}" var="prodCateList">
								<li class="prodcate_btn" style="margin: 0">
									<a style="border: none;"class="page-link"
									href="${prodCateList}">
									${prodCateList}</a>
								</li>
							</c:forEach>
						</ul>
						</div>
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
									<h3 class="total-show-product" style="color:#333">
										Pages: <span>${page.cri.pageNum}/${page.realEnd} pages</span>
									</h3>
								</div>
							</div>
							<div class="col-lg-5 col-md-4 col-12">
								<nav>
									<div class="nav nav-tabs" id="nav-tab" role="tablist">
										
									</div>
								</nav>
							</div>
						</div>
					</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-grid"
							role="tabpanel" aria-labelledby="nav-grid-tab">
							<div class="row">
								<c:forEach items="${prodCate}" var="prodCate">
									<div class="col-lg-4 col-md-6 col-12">
										<!-- Start Single Product -->
										<div class="single-product">
											<div class="product-image">
												<img src="<c:out value='${prodCate.pimage}'/>" />
												 <div class="button">
					                             <!-- 로그인 하지 않는 상태 -->
				                                 <c:if test="${member == null}">
				                                 	<a href="<c:url value='insert'/>" onClick="alert('로그인 후 이용해주세요.')" class="btn"><i class="lni lni-cart"></i>장바구니</a>
				                                 </c:if>
				                                 <!-- 로그인 상태 -->
				                                 <c:if test="${member != null}">
				                                    <a href="<c:url value='insert?pnum=${prodCate.pnum}&cartAmount=1'/>" class="btn"><i class="lni lni-cart"></i>장바구니</a>
				                                 </c:if>
					                            </div>
											</div>
											<div class="product-info">
												<span class="category"></span>
												<h4 class="title">
													<span class="category">${prodCate.pcategory_fk1}</span>
													<a href="<c:url value='client-product-detail?pnum=${prodCate.pnum}'/>"><MARQUEE  scrolldelay=120><c:out value="${prodCate.pname}" /></MARQUEE></a>
												</h4>
												<div class="price">
													<span><fmt:formatNumber value="${prodCate.price}"
															pattern="#,##0" />원</span>
												</div>
											</div>
										</div>
										<!-- End Single Product -->
									</div>
								</c:forEach>
							</div>
							<div class="notice-footer w-100">
								<div class="indexer align-right">
								<span>${page.cri.pageNum}/${page.realEnd} pages</span>
									<ul id="pageInfo" class="notice-page pager">
										<!-- 맨앞으로 버튼 -->
										<c:if test="${page.prev}">
											<li class="next pageInfo_btn"><a class="page-link" href="${page.realStart}"style="border:none">
											<i class="lni lni-angle-double-left"></i></a></li>
										</c:if>
										<!-- 이전페이지 버튼 -->
										<c:if test="${page.prev}">
											<li class="prev pageInfo_btn">
											<a class="page-link" href="${page.startPage-1}"style="border:none"><i class="lni lni-chevron-left"></i></a></li>
										</c:if>
										<!-- 각 번호 페이지 버튼 -->
										<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
										<li class="pageInfo_btn ${page.pageNum eq num ? 'activePage' : ''}">
										<a class="page-link" href="${num}" style="border:none">${num}</a>
										</li>
										</c:forEach>
										<!-- 다음페이지 버튼 -->
										<c:if test="${page.next}">
											<li class="next pageInfo_btn">
											<a class="page-link" href="${page.endPage+1}"style="border:none"><i class="lni lni-chevron-right"></i></a></li>
										</c:if>
										<!-- 맨끝으로 버튼 -->
										<c:if test="${page.next}">
											<li class="next pageInfo_btn">
											<a class="page-link" href="${page.realEnd}"style="border:none">
											<i class="lni lni-angle-double-right"></i></a></li>
										</c:if>
						         </ul>
									<form action='client-product-list-category' method="get" id="prodForm" name="prodForm">
										<input type="hidden" name="pageNum"
											value="${page.cri.pageNum}">
											<input type="hidden"
											name="amount" value="${page.cri.amount}">
											<input type="hidden" name="keyWord" value="${page.cri.keyWord}">
											<input type="hidden" name="pcategory_fk1" value="${page.cri.pcategory_fk1}">
										<input type="hidden" name="searchType"
											value="${page.cri.searchType}">
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