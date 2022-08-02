<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./inc/client-header.jsp"%>
    <!-- Start Mypage Area -->
    <section id="mypage" class="mypage section">
        <div class="container">
                <div class="mypage-main">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-12">
                            <div class="single-info-head">
                                <!-- Start Single Info -->
                                <div class="single-info">
                                    <h5><i class="lni lni-user"></i>마이페이지</h5>
                                    <!-- 링크클릭 :>  회원정보수정하는 페이지로이동하기 -->
                                    <div class="button">
                                        <a href="javascript:void(0)" class="btn">회원정보수정</a>
                                    </div>
                                    <!-- 링크클릭 :>  장바구니 페이지로이동 -->
                                    <div class="button">
                                        <a href="javascript:void(0)" class="btn">장바구니로</a>
                                    </div>
                                </div>
                                <!-- End Single Info -->
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-12 col-12">
                            <div class="mypage-wish">
                                <div class="wish-main">
                                    <!-- 이미지 클릭시에 상품상세정보사이트로 넘어가기-->
                                    <form class="form" method="post" action="">
                                        <h4>위시리스트</h4>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-12">
                                                <!-- 데이터 등록 후.. 위시리스트 클릭하면 추가되게-->
                                                <div class="single-product">
                                                    <img class="product-image" src="https://via.placeholder.com/335x335" alt="#">
                                                    <!-- 하트 클릭시 위시리스트에서 해제 -->
                                                    <div class="button">
                                                        <a href="product-details"><i class="lni lni-heart-filled"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        <div class="col-lg-8 col-md-12 col-12">
                            <div class="mypage-review">
                                <div class="review-main">
                                        <h4>나의리뷰</h4>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-12">
                                                <!-- 나의 리뷰 내역 불러오기 for문 -->
                                                <div class="my-review">
                                                    <p>리뷰내역 쑐라쑐라
                                                    </p>                                                
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@ include file="./inc/footer.jsp"%>