<%@page import="com.supermm.model.ClientCriteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>슈퍼멍뭉</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js'></script>
<script src="${ctx}/resources/js/script.js"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="${ctx}/resources/images/favicon.svg" />
<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="${ctx}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/resources/css/LineIcons.3.0.css" />
<link rel="stylesheet" href="${ctx}/resources/css/tiny-slider.css" />
<link rel="stylesheet" href="${ctx}/resources/css/glightbox.min.css" />
<link rel="stylesheet" href="${ctx}/resources/css/style.css">
<link rel="stylesheet" href="${ctx}/resources/scss/main.css" />


<script>
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
</head>
<!-- Preloader -->
<div class="preloader">
	<div class="preloader-inner">
		<div class="preloader-icon">
			<span></span> <span></span>
		</div>
	</div>
</div>
<!-- /End Preloader -->

<!-- Start Header Area -->
<header class="header navbar-area">
	<!-- Start Header Middle -->
	<div class="header-middle">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-3 col-7">
					<!-- Start Header Logo -->
					<a class="navbar-brand" href="client-main"> <img
						src="${ctx}/resources/images/logo/logo.png" alt="Logo">
					</a>
					<!-- End Header Logo -->
				</div>
				<div class="col-lg-5 col-md-7 d-xs-none">
					<form action='client-product-list' method="get" id="moveForm" name="moveForm">
						<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMake.cri.amount}">
						<input type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">
						<input type="hidden" name="searchType" value="${pageMake.cri.searchType}">
					</form>
					
					<!-- Start Main Menu Search -->
					<form id="searchForm" method="post" action='client-product-list'>
						<div class="main-menu-search">
							<!-- navbar search start -->
							<div class="navbar-search search-style-5">
								<div class="search-select">
									<div class="select-position">
										<select name="searchType">
											<option value="N"
												<c:out value="${pageMake.cri.searchType == 'N' ? 'selected':''}"/>>상품명</option>
										</select>
									</div>
								</div>
								<div class="search-input">
									<input type="text" name="keyWord" id="keyWord"
										placeholder="상품명을 입력하세요" value="${cri.keyWord}">
								</div>
								<div class="search-btn">
									<button id="btn-search">
										<i class="lni lni-search-alt"></i>
									</button>
								</div>
							</div>
							<!-- navbar search Ends -->
						</div>
					</form>
					<!-- End Main Menu Search -->
				</div>
				<div class="col-lg-4 col-md-2 col-5">
					<div class="middle-right-area">
						<div class="nav-hotline">
							<i class="lni lni-phone"></i>
							<h3>
								고객센터: <span>(042) 123-4567</span>
							</h3>
						</div>
						<div class="navbar-cart">
							<div class="user">
								<a href="javascript:void(0)" class="main-btn">🐶</a>
								<!-- User-menu -->
								<div class="user-menu">
									<div class="dropdown-user">
										<ul class="user-menu-list">
											<!-- 로그인 하지 않는 상태 -->
											<c:if test="${member == null}">
												<li><a href="client-login">로그인</a></li>
												<li><a href="client-register">회원가입</a></li>
												<li><a href="client-login">마이페이지</a></li>
											</c:if>
											<!-- 로그인 상태 -->
											<!-- 관리자 로그인 상태  -->
											<c:if test="${member != null}">
												<c:if test="${member.adminchk eq 1}">
													<li><a href="client-logout">로그아웃</a></li>
													<li><a href="admin-main">관리자페이지</a></li>
												</c:if>
												<c:if test="${member.adminchk ne 1}">
													<li><a href="client-logout">로그아웃</a></li>
													<li><a href="client-mypage">마이페이지(${member.id}님)</a></li>
												</c:if>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
							<!--  <div class="wishlist">
                                    <a href="javascript:void(0)">
                                        <i class="lni lni-heart"></i>
                                        <span class="total-items">0</span>
                                    </a>
                                </div> -->
							<div class="cart-items">
								<a href="javascript:void(0)" class="main-btn">🛒<span
									class="total-items">${count}</span>
								</a>
								<!-- Shopping Item -->
								<div class="shopping-item">
									<div class="dropdown-cart-header">
										<c:if test="${member == null}">
											<p>로그인 하고 확인해주라멍</p>
										</c:if>
									</div>
									<c:if test="${member != null}">
										<span>${count} 멍</span>
										<a href="cart"><span style="color: #AB93C9">${member.id}
												님의 장바구니로</span></a>
										<c:forEach var="cartList" items="${cartlist}">
											<ul class="shopping-list">
												<li>
													<div class="cart-img-head">
														<a
															href="<c:url value='client-product-detail?pnum=${cartList.pnum}'/>"><img
															src="<c:url value="${cartList.pimage}"/>" alt="#"></a>
													</div>
													<div class="content">
														<a
															href="<c:url value='cart-delete?cartnum=${cartList.cartnum}'/>"
															onClick="alert('삭제하시겠습니까?')"><img
															src="https://img.icons8.com/sf-black-filled/20/ab93c9/x.png" /></a>
														<h4>
															<a href="product-details">${cartList.pname}</a>
														</h4>
														<p class="quantity">
															1x - <span class="amount">${cartList.price}</span>
														</p>
													</div>
												</li>
											</ul>
											<div class="bottom">
												<div class="total">
													<span>Total</span> <span class="total-amount">${priceAll}</span>
												</div>
											</div>
										</c:forEach>
										<div class="button">
											<a href="checkout" class="btn animate">구매하기</a>
										</div>
									</c:if>
								</div>

								<!--/ End Shopping Item -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Header Middle -->
	<!-- Start Header Bottom -->
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8 col-md-6 col-12">
				<div class="nav-inner">
					<!-- Start Mega Category Menu -->
					<div class="mega-category-menu">
						<span class="cat-button"><i class="lni lni-menu"></i>CATEGORY</span>
						<ul class="sub-category">
							<c:forEach items="${prodCateList}" var="prodCateList">
								<li class="prodcate_btn" style="margin: 0">
									<a style="border: none;"class="page-link"
									href="/client-product-list-category?pcategory_fk1=${prodCateList}">
									${prodCateList}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- End Mega Category Menu -->
					<!-- Start Navbar -->
					<nav class="navbar navbar-expand-lg">
						<button class="navbar-toggler mobile-menu-btn" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="toggler-icon"></span> <span class="toggler-icon"></span>
							<span class="toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse sub-menu-bar"
							id="navbarSupportedContent">
							<ul id="nav" class="navbar-nav ms-auto">
								<li class="nav-item"><a href="client-main" class="active"
									aria-label="Toggle navigation">HOME</a></li>
								<li class="nav-item"><a href="about-us"
									aria-label="Toggle navigation">ABOUT</a></li>
								<li class="nav-item"><a href="client-product-list"
									aria-label="Toggle navigation">SHOP</a></li>
								<li class="nav-item"><a href="#"
									aria-label="Toggle navigation">NOTICE</a></li>
								<li class="nav-item"><a href="client-faq"
									aria-label="Toggle navigation">FAQ</a></li>
								<li class="nav-item"><a href="contact"
									aria-label="Toggle navigation">CONTACT</a></li>
							</ul>
						</div>
						<!-- navbar collapse -->
					</nav>
					<!-- End Navbar -->
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-12">
				<!-- Start Nav Social -->
				<div class="nav-social">
					<h5 class="title">FOLLOW US:</h5>
					<ul>
						<li><a href="javascript:void(0)"><i
								class="lni lni-facebook-filled"></i></a></li>
						<li><a href="javascript:void(0)"><i
								class="lni lni-twitter-original"></i></a></li>
						<li><a href="javascript:void(0)"><i
								class="lni lni-instagram"></i></a></li>
						<li><a href="javascript:void(0)"><i class="lni lni-skype"></i></a>
						</li>
					</ul>
				</div>
				<!-- End Nav Social -->
			</div>
		</div>
	</div>
	<!-- End Header Bottom -->
</header>
<!-- End Header Area -->

<!-- ========================= JS here ========================= -->
<script src="${ctx}resources/js/bootstrap.min.js"></script>
<script src="${ctx}resources/js/tiny-slider.js"></script>
<script src="${ctx}resources/js/glightbox.min.js"></script>
<script src="${ctx}resources/js/main.js"></script>
<script type="text/javascript">
            //========= Hero Slider 
            tns({
                container: '.hero-slider',
                slideBy: 'page',
                autoplay: true,
                autoplayButtonOutput: false,
                mouseDrag: true,
                gutter: 0,
                items: 1,
                nav: false,
                controls: true,
                controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
            });
    
            //======== Brand Slider
            tns({
                container: '.brands-logo-carousel',
                autoplay: true,
                autoplayButtonOutput: false,
                mouseDrag: true,
                gutter: 15,
                nav: false,
                controls: false,
                responsive: {
                    0: {
                        items: 1,
                    },
                    540: {
                        items: 3,
                    },
                    768: {
                        items: 5,
                    },
                    992: {
                        items: 6,
                    }
                }
            });
    
        </script>
<script>
            const finaleDate = new Date("February 15, 2023 00:00:00").getTime();
    
            const timer = () => {
                const now = new Date().getTime();
                let diff = finaleDate - now;
                if (diff < 0) {
                    document.querySelector('.alert').style.display = 'block';
                    document.querySelector('.container').style.display = 'none';
                }
    
                let days = Math.floor(diff / (1000 * 60 * 60 * 24));
                let hours = Math.floor(diff % (1000 * 60 * 60 * 24) / (1000 * 60 * 60));
                let minutes = Math.floor(diff % (1000 * 60 * 60) / (1000 * 60));
                let seconds = Math.floor(diff % (1000 * 60) / 1000);
    
                days <= 99 ? days = `0${days}` : days;
                days <= 9 ? days = `00${days}` : days;
                hours <= 9 ? hours = `0${hours}` : hours;
                minutes <= 9 ? minutes = `0${minutes}` : minutes;
                seconds <= 9 ? seconds = `0${seconds}` : seconds;
    
                document.querySelector('#days').textContent = days;
                document.querySelector('#hours').textContent = hours;
                document.querySelector('#minutes').textContent = minutes;
                document.querySelector('#seconds').textContent = seconds;
    
            }
            timer();
            setInterval(timer, 1000);
        </script>
</body>

</html>