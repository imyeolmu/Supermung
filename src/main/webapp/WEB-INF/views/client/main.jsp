<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./inc/client-header.jsp"%>

    <!-- Start Hero Area -->
    <section class="hero-area">
        <div class="slider-head">
            <!-- Start Hero Slider -->
            <div class="hero-slider">
                <!-- Start Single Slider -->
                <div class="single-slider"
                    style="background-image: url(../resources/images/hero/banner01.png);">
                </div>
                <!-- End Single Slider -->
                <!-- Start Single Slider -->
                <div class="single-slider"
                style="background-image: url(../resources/images/hero/banner02.png);">
            </div>
                    <!-- End Single Slider -->
                <!-- Start Single Slider -->
                <div class="single-slider"
                style="background-image: url(../resources/images/hero/banner03.png);">
            </div>
                    <!-- End Single Slider -->
            </div>
                <!-- End Hero Slider -->
        </div>
    </section>
    <!-- End Hero Area -->

<!-- Start Banner Area -->
<section class="banner section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="single-banner custom-responsive-margin">
                    <a href="about-us.html"><img src="../resources/images/hero/brandstory.png" class="content1"/></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <div class="single-banner custom-responsive-margin">
                    <a href="login.html"><img src="../resources/images/hero/event.png" class="content1"/></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Banner Area -->

    <!-- Start Trending Product Area -->
    <section class="trending-product section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>BEST SELLER</h2>
                    </div>
                </div>
            </div>
	            <div class="row">
			<c:forEach items="${list}" var="list">
				 <c:if test="${list.pspec eq '인기'}">
	              		<div class="col-lg-3 col-mb-12 col-12">
	                    <div class="container single-product">
	                        <div class="product-image">
	                            <img src="${list.pimage}" alt="#">
	                     
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
	                       
	                            <span class="category">${list.pcategory_fk1}</span>
	                   
	                            <h4 class="title" style="margin-top: 10px">
	                                <a href="<c:url value='client-product-detail?pnum=${list.pnum}'/>"><MARQUEE  scrolldelay=150>${list.pname}</MARQUEE></a>
	                            </h4>
	                            
	                            <div class="price">
	                                <span><fmt:formatNumber value="${list.price}"
															pattern="#,##0" />원</span>
	                            </div>
	                       	</div>
	                        </div>
	                    </div>
	                </c:if>
			</c:forEach>
	             </div>
        </div>
    </section>
    <!-- End Trending Product Area -->

    <!-- Start Trending Product Area -->
    <section class="blog-section section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>New</h2>
                    </div>
                </div>
            </div>
	            <div class="row">
			<c:forEach items="${list}" var="list">
				 <c:if test="${list.pspec eq '최신'}">
	              		<div class="col-lg-3 col-md-6 col-12" >
	                    <div class="single-product">
	                        <div class="product-image">
	                            <img src="${list.pimage}" alt="#">
	                     
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
	                       
	                            <span class="category">${list.pcategory_fk1}</span>
	                   
	                            <h4 class="title" style="margin-top: 10px">
	                                <a href="<c:url value='client-product-detail?pnum=${list.pnum}'/>"><MARQUEE  scrolldelay=150>${list.pname}</MARQUEE></a>
	                            </h4>
	                            
	                            <div class="price">
	                                <span><fmt:formatNumber value="${list.price}"
															pattern="#,##0" />원</span>
	                            </div>
	                       	</div>
	                        </div>
	                    </div>
	                </c:if>
			</c:forEach>
	             </div>
        </div>
    </section>
    <!-- End Trending Product Area -->
    
      <!-- Start Blog Section Area -->
    <section class="blog-section section" style="background-color:#f9f9f9">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>NOTICE</h2>
                    </div>
                </div>
            </div>
            <div class="row">
             <c:forEach items="${nlist}" var="nlist">
                <div class="col-lg-12 col-md-6 col-12">
                    <!-- Start Single Blog -->
                    <div class="single-blog">
                        <div class="blog-content">
                            <a class="category" href="javascript:void(0)">
                            <fmt:formatDate value="${nlist.nregdate}" pattern="yyyy-MM-dd"/>
                            </a>
                        <div class="button" style="float:right">
                                <a href="javascript:void(0)" class="btn">자세히</a>
                            </div>
                            <h4><a href="blog-single-sidebar">${nlist.ntitle}</a></h4>
                        </div>
                    </div>
                    <!-- End Single Blog -->
                </div>
                 </c:forEach>
            </div>
        </div>
    </section>
    <!-- End Blog Section Area -->
    
    
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
<%@ include file="./inc/footer.jsp"%>
