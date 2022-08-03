<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>슈퍼멍뭉</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/resources/images/favicon.svg" />
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${ctx}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctx}/resources/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${ctx}/resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="${ctx}/resources/css/glightbox.min.css" />
    <link rel="stylesheet" href="${ctx}/resources/scss/main.css" />

</head>

<body>
    <!--[if lte IE 9]>
    <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
    </p>
    <![endif]-->

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <!-- Start Header Area -->
    <header class="header navbar-area">
        <!-- Start Header Bottom -->
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 col-md-6 col-12">
                    <div class="nav-inner">
                        <!-- Start Navbar -->
                        <nav class="navbar navbar-expand-lg">
                            <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                            </button>
                            <div class="col-lg-3 col-md-3 col-7">
                                <!-- Start Header Logo -->
                                <a class="navbar-brand" href="client-main">
                                    <img src="${ctx}/resources/images/logo/logo.png" alt="Logo">
                                </a>
                                <!-- End Header Logo -->
                            </div>
                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                                <ul id="nav" class="navbar-nav ms-auto text-center admin-nav">
                                    <li class="nav-item">
                                        <a href="admin-login" class="active" aria-label="Toggle navigation">HOME</a>
                                    </li>
                                    <li class="nav-item">
                                        <div class="admin">
                                            <a href="admin-info" aria-label="Toggle navigation">관리자정보</a>
                                            <div class="admin-menu">
                                                <div class="dropdown-user">
                                                   <ul class="admin-menu-list">
                                                        <li><a href="admin-info" class="admin-head-menu">관리자정보수정</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="admin">
                                            <a href="member-list" aria-label="Toggle navigation">회원관리</a>
                                            <div class="admin-menu">
                                                <div class="dropdown-user">
                                                    <ul class="admin-menu-list">
                                                        <li><a href="member-list" class="admin-head-menu">회원목록</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="admin">
                                            <a href="category-list" aria-label="Toggle navigation">카테고리관리</a>
                                            <div class="admin-menu">
                                                <div class="dropdown-user">
                                                    <ul class="admin-menu-list">
                                                        <li><a href="category-list" class="admin-head-menu">카테고리목록</a></li>
                                                        <li><a href="category-input" class="admin-head-menu">카테고리등록</a></li>
                                                        <li><a href="categorySub-list" class="admin-head-menu">서브카테고리목록</a></li>
                                                        <li><a href="categorySub-input" class="admin-head-menu">서브카테고리등록</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <div class="admin">
                                            <a href="product-list" aria-label="Toggle navigation">상품관리</a>
                                            <div class="admin-menu">
                                                <div class="dropdown-user">
                                                    <ul class="admin-menu-list">
                                                        <li><a href="product-list" class="admin-head-menu">상품목록</a></li>
                                                        <li><a href="product-input" class="admin-head-menu">상품등록</a></li>
                                                        <li><a href="product-update" class="admin-head-menu">상품수정</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                   <!--  <li class="nav-item">
                                        <div class="admin">
                                            <a href="admin-review-board" aria-label="Toggle navigation">게시판관리</a>
                                            <div class="admin-menu">
                                                <div class="dropdown-user">
                                                    <ul class="admin-menu-list">
                                                        <li><a href="admin-review-board" class="admin-head-menu">리뷰게시판</a></li>
                                                        <li><a href="#" class="admin-head-menu">봉사게시판</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li> -->
                                    <li class="nav-item">
                                        <div class="admin">
                                            <a href="notice-list" aria-label="Toggle navigation">고객센터관리</a>
                                            <div class="admin-menu">
                                                <div class="dropdown-user">
                                                    <ul class="admin-menu-list">
                                                        <li><a href="notice-list" class="admin-head-menu">공지사항</a></li>
                                                        <!-- <li><a href="qna-list" class="admin-head-menu">문의게시판</a></li> -->
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <div class="navbar-cart mt-2">
                                        <div class="user">
                                            <a href="javascript:void(0)" class="main-btn">
                                                <i class="lni lni-user"></i>
                                            </a>
                                            <!-- User-menu -->
                                            <div class="user-menu">
                                                <div class="dropdown-user">
                                                    <ul class="user-menu-list">
                                                        <li><a href="admin-login">로그인</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ul>
                            </div> <!-- navbar collapse -->
                        </nav>
                        <!-- End Navbar -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Header Bottom -->
    </header>
    <!-- End Header Area -->


    <!-- ========================= JS here ========================= -->
    <script src="${ctx}/resources/js/bootstrap.min.js"></script>
    <script src="${ctx}/resources/js/tiny-slider.js"></script>
    <script src="${ctx}/resources/js/glightbox.min.js"></script>
    <script src="${ctx}/resources/js/main.js"></script>
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