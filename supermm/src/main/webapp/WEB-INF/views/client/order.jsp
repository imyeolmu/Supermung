<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="./inc/client-header.jsp"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.checkout-wrapper {
	min-height: 1000px;
}
</style>

<!--====== Checkout Form Steps Part Start ======-->
<section class="checkout-wrapper section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="checkout-steps-form-style-1">
					<ul id="accordionExample">
						<li>
							<h6 class="title" data-bs-toggle="collapse"
								data-bs-target="#collapseThree" aria-expanded="true"
								aria-controls="collapseThree">주문상품</h6>
							<section class="checkout-steps-form-content collapse show"
								id="collapseThree" aria-labelledby="headingThree"
								data-bs-parent="#accordionExample">
								<div class="row">
									<div class="col-md-12">
										<div class="single-form form-default shopping-cart">
											<div class="container cart-list-head" style="border: none">
												<!-- Cart List Title -->
												<div class="cart-list-title">
													<div class="row text-center">
														<div class="col-lg-2 col-md-1 col-12">
															<p>이미지</p>
														</div>
														<div class="col-lg-2 col-md-2 col-12">
															<p>상품명</p>
														</div>
														<div class="col-lg-2 col-md-2 col-12">
															<p>수량</p>
														</div>
														<div class="col-lg-2 col-md-2 col-12">
															<p>가격</p>
														</div>
														<div class="col-lg-2 col-md-2 col-12">
															<p>포인트</p>
														</div>
														<div class="col-lg-2 col-md-2 col-12">
															<p>합산</p>
														</div>
													</div>
												</div>
												<div class="cart-single-list">
													<div class="row align-items-center text-center">
														<c:forEach items="${orderList}" var="ol">
															<input type="hidden" class="individual_price_input" value="${ol.price}"><!-- 가격 -->
															<input type="hidden" class="individual_pcount_input" value="${ol.pcount}"><!-- 수량 -->
															<input type="hidden" class="individual_salePrice_input"	value="${ol.salePrice}"><!-- 판매가(가격-할인가) -->
															<input type="hidden" class="individual_totalPrice_input" value="${ol.salePrice * ol.pcount}"><!-- 전체가격(판매가*수량) -->
															<input type="hidden" class="individual_point_input" value="${ol.point}"><!-- 포인트 -->
															<input type="hidden" class="individual_totalPoint_input" value="${ol.totalPoint}"><!-- 전체포인트 -->
															<input type="hidden" class="individual_pnum_input" value="${ol.pnum}">
															<input type="hidden" class="individual_priceAll_input" value="${priceAll}">
															<input type="hidden" class="individual_pointAll_input" value="${pointAll}">
															<div class="col-lg-2 col-md-1 col-12">
																<p class="product-des" style="margin-bottom: 10px">
																	<span><img src="<c:url value="${ol.pimage}"/>"></span>
																</p>
															</div>
															<div class="col-lg-2 col-md-1 col-12">
																<p class="product-des">
																	<span>${ol.pname}</span>
																</p>
															</div>
															<div class="col-lg-2 col-md-2 col-12">
																<p class="product-des">
																	<span class="individual_pcount_input">${ol.pcount}</span>
																</p>
															</div>
															<div class="col-lg-2 col-md-2 col-12">
																<p class="product-des">
																	<span><fmt:formatNumber pattern="###,###,###" value="${ol.price}"/>원</span>
																</p>
															</div>
															<div class="col-lg-2 col-md-2 col-12">
																<p class="product-des">
																	<span class="individual_totalPoint_input"><fmt:formatNumber pattern="###,###,###" value="${ol.point}"/>원</span>
																</p>
															</div>
															<div class="col-lg-2 col-md-2 col-12">
																<p class="product-des">
																	<span class="individual_totalPrice_input"><fmt:formatNumber pattern="###,###,###" value="${ol.totalPrice}"/>원</span>
																</p>
															</div>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</li>
						<li>
							<h6 class="title collapsed" data-bs-toggle="collapse"
								data-bs-target="#collapseFour" aria-expanded="false"
								aria-controls="collapseFour">주문자정보</h6>
							<section class="checkout-steps-form-content collapse"
								id="collapseFour" aria-labelledby="headingFour"
								data-bs-parent="#accordionExample">
								<div class="row">
									<div class="col-md-12">
										<div class="single-form form-default">
											<label>주문자</label>
											<div class="row">
												<div class="col-md-12 form-input form">
													<input type="text" placeholder="주문자"
														value="${clientInfo.name}">
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="single-form form-default">
											<label>이메일</label>
											<div class="form-input form">
												<input type="email" placeholder="이메일"
													value="${clientInfo.email}">
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="single-form form-default">
											<label>휴대폰번호</label>
											<div class="form-input form">
												<input type="text" placeholder="휴대폰번호"
													value="${clientInfo.phone}">
											</div>
										</div>
									</div>
								</div>
							</section>
						</li>
						<li>
							<h6 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapsefive" aria-expanded="false" aria-controls="collapsefive">배송정보</h6>
							<section class="checkout-steps-form-content collapse" id="collapsefive" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
								<input class="recipient_input" value="${clientInfo.name}" type="hidden">
								<input class="address1_input" type="hidden" value="${clientInfo.addr1}">
								<input class="address2_input" type="hidden" value="${clientInfo.addr2}">
								<input class="address3_input" type="hidden" value="${clientInfo.addr3}">
								<div class="row">
									<div class="col-md-12">
										<div class="single-form form-default">
											<label>이름</label>
											<div class="row">
												<div class="col-md-12 form-input form">
													<input class="recipient_input" type="text" placeholder="이름"
														value="${clientInfo.name}" name="recipient">
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="single-form form-default">
											<label>이메일</label>
											<div class="form-input form">
												<input type="email" placeholder="이메일"
													value="${clientInfo.email}">
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="single-form form-default">
											<label>휴대폰번호</label>
											<div class="form-input form">
												<input type="text" placeholder="휴대폰번호"
													value="${clientInfo.phone}">
											</div>
										</div>
									</div>
									<div class="addressInfo_div single-form form-default">
											<label for="reg-pass">우편번호</label>
										<div class="col-sm-6 d-flex">
												<div class="form-input form">
													<input class="address1_input form-control" type="text"
														name="addr1" readonly value="${clientInfo.addr1}">
												</div>
											<div class="button col-sm-4">
												<button type="button" class="btn ms-5"
													style="width: 100px" onclick="search_daum_address();">주소 찾기</button>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="single-form form-default">
												<label for="reg-pass"> 주소</label>
													<div class="form-input form">
														<input class=" address2_input form-control mb-1" type="text"
															name="addr2" readonly value="${clientInfo.addr2}">
													<label for="reg-pass"></label>
													<input class="form-control address3_input" type="text"
														name="addr3" placeholder="상세주소" readonly value="${clientInfo.addr3}">
												</div>
											</div>
										</div>
									</div>
									<script>
										function search_daum_address() {

											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															var addr = ''; // 주소 변수
															var extraAddr = ''; // 참고항목 변수

															if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																addr = data.roadAddress;
															} else { // 사용자가 지번 주소를 선택했을 경우(J)
																addr = data.jibunAddress;
															}

															// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
															if (data.userSelectedType === 'R') {
																// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																if (data.bname !== ''
																		&& /[동|로|가]$/g
																				.test(data.bname)) {
																	extraAddr += data.bname;
																}
																// 건물명이 있고, 공동주택일 경우 추가한다.
																if (data.buildingName !== ''
																		&& data.apartment === 'Y') {
																	extraAddr += (extraAddr !== '' ? ', '
																			+ data.buildingName
																			: data.buildingName);
																}
																// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																if (extraAddr !== '') {
																	extraAddr = ' ('
																			+ extraAddr
																			+ ')';
																}
																// 주소변수 문자열 과 참고항목 문자열 합치기 
																addr += extraAddr;

															} else {
																addr += ' ';
															}

															// 우편번호와 주소 정보를 해당 필드에 넣는다.
															$("[name=addr1]")
																	.val(
																			data.zonecode);
															$("[name=addr2]")
																	.val(
																			data.roadAddress);

															// 커서를 상세주소 필드로 이동한다.
															$("[name=addr3]")
																	.attr(
																			"readonly",
																			false);
															$("[name=addr3]")
																	.focus();

														}
													}).open();
										}
									</script>
									<div class="single-form form-default button">
										<button class="btn">저장</button>
									</div>
								</div>
							</section>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="checkout-sidebar">
					<div class="checkout-sidebar-coupon">
						<p>포인트 적용(보유 포인트 : <fmt:formatNumber pattern="###,###,###" value="${clientInfo.mpoint}"/>)</p>
						<div class="single-form form-default">
							<div class="form-input form">
								<input class="order_point_input totalPoint_span" type="number" value="0">
							</div>
							<div class="button">
								<a class="order_point_input_btn order_point_input_btn_N btn" data-state="N" style="margin: 0;">모두적용</a>
								<a class="order_point_input_btn order_point_input_btn_Y btn" data-state="Y" style="display: none;">적용취소</a>
							</div>
						</div>
						<script>
							/* 포인트 입력 */
							//0 이상 & 최대 포인트 수 이하
							$(".order_point_input").on("propertychange change keyup paste input", function(){
								const maxPoint = parseInt('${clientInfo.mpoint}');	
								
								let inputValue = parseInt($(this).val());	
								
								if(inputValue < 0){
									$(this).val(0);
								} else if(inputValue > maxPoint){
									$(this).val(maxPoint);
								}
								
								/* 주문 조합정보란 최신화 */
								setTotalInfo();	
							});	
							
							/* 포인트 모두사용 취소 버튼 
							 * Y: 모두사용 상태 / N : 모두 취소 상태
							 */
							$(".order_point_input_btn").on("click", function(){
								const maxPoint = parseInt('${clientInfo.mpoint}');	
								
								let state = $(this).data("state");	
								
								if(state == 'N'){
									console.log("n동작");
									/* 모두사용 */
									//값 변경
									$(".order_point_input").val(maxPoint);
									//글 변경
									$(".order_point_input_btn_Y").css("display", "inline-block");
									$(".order_point_input_btn_N").css("display", "none");
								} else if(state == 'Y'){
									console.log("y동작");
									/* 취소 */
									//값 변경
									$(".order_point_input").val(0);
									//글 변경
									$(".order_point_input_btn_Y").css("display", "none");
									$(".order_point_input_btn_N").css("display", "inline-block");		
								}	
								
								/* 주문 조합정보란 최신화 */
								setTotalInfo();	
								
							});
							
							</script>
					</div>
					<div class="checkout-sidebar-price-table mt-30">
						<h5 class="title">결제금액</h5>
						<div class="sub-total-price">
							<div class="total-price">
								<p class="value">상품금액</p>
								<p class="totalPrice_span">0</p>
							</div>
							<div class="total-price shipping">
								<p class="value">할인금액</p>
								<p class="usePoint_span">0</p>
							</div>
						</div>
						<div class="total-payable">
							<div class="payable-price">
								<p class="value">적립예정포인트</p>
								<p class="totalPoint_span">0</p>
							</div>
							<div class="payable-price">
								<p class="value">최종결제금액</p>
								<p class="finalTotalPrice_span">0</p>
							</div>
						</div>
						<script>
						$(document).ready(function(){
							
							/* 주문 조합정보란 최신화 */
							setTotalInfo();
							
						});
						
						/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
						function setTotalInfo(){
							let totalPrice = 0;				// 총 가격
							let totalCount = 0;				// 총 갯수
							let totalPoint = 0;				// 총 포인트
							let usePoint = 0;				// 사용 포인트(할인가격)
							
							$(".cart-single-list").each(function(index, element){
								// 총 가격
								totalPrice += parseInt($(element).find(".individual_priceAll_input").val());
								// 총 갯수
								totalCount += parseInt($(element).find(".individual_pcount_input").val());
								// 총 마일리지
								totalPoint += parseInt($(element).find(".individual_pointAll_input").val());
							});	
							
							/* 사용 포인트 */
							usePoint = $(".order_point_input").val();
							
							finalTotalPrice = totalPrice - usePoint;	
							
							/* 값 삽입 */
							// 총 가격
							$(".totalPrice_span").text(totalPrice.toLocaleString());
							// 총 포인트
							$(".totalPoint_span").text(totalPoint.toLocaleString());
							// 최종 가격(총 가격-할인)
							$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
							// 할인가(사용 포인트)
							$(".usePoint_span").text(usePoint.toLocaleString());
						}
						</script>
						<form class="order_form price-table-btn button" action="/order" method="post">
							<input name="id" value="${clientInfo.id}" type="hidden">
							<input name="recipient" type="hidden">
							<input name="memberAddr1" type="hidden">
							<input name="memberAddr2" type="hidden">
							<input name="memberAddr3" type="hidden">
							<input name="usePoint" type="hidden">
							<button class="btn btn-alt order_btn" type="button">결제하기</button>
							<c:if test="${clientInfo.money < priceAll}">
								<script>
									alert('잔액이 부족합니다. 금액을 충전하고 다시 결제해주세요.');
									window.location = '/client-money';
								</script>
							</c:if>
							<c:if test="${clientInfo.money eq priceAll || clientInfo.money > priceAll}">							
							<script>
								/* 주문 요청 */
								$(".order_btn").on("click", function(){
										/* 주소 정보 & 받는이*/
									$(".checkout-steps-form-content").each(function(index, element){
												$("input[name='recipient']").val($(element).find(".recipient_input").val());
												$("input[name='memberAddr1']").val($(element).find(".address1_input").val());
												$("input[name='memberAddr2']").val($(element).find(".address2_input").val());
												$("input[name='memberAddr3']").val($(element).find(".address3_input").val());
									
									});
									
									/* 사용 포인트 */
									$("input[name='usePoint']").val($(".order_point_input").val());	
									
									/* 상품정보 */
									let form_contents = ''; 
									$(".cart-single-list").each(function(index, element){
										let pnum = $(element).find(".individual_pnum_input").val();
										let pcount = $(element).find(".individual_pcount_input").val();
										let pnum_input = "<input name='orders[" + index + "].pnum' type='hidden' value='" + pnum + "'>";
										form_contents += pnum_input;
										let pcount_input = "<input name='orders[" + index + "].pcount' type='hidden' value='" + pcount + "'>";
										form_contents += pcount_input;
									});	
									$(".order_form").append(form_contents);	
									
									/* 서버 전송 */
									$(".order_form").submit();	
									
								});
								</script>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="./inc/footer.jsp"%>