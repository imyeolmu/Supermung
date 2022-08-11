<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./inc/client-header.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!--====== Checkout Form Steps Part Start ======-->
  <section class="checkout-wrapper section">
      <div class="container">
          <div class="row justify-content-center">
              <div class="col-lg-8">
                  <div class="checkout-steps-form-style-1">
                      <ul id="accordionExample">
                          <li>
                              <h6 class="title" data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                  aria-expanded="true" aria-controls="collapseThree">주문자정보</h6>
                              <section class="checkout-steps-form-content collapse show" id="collapseThree"
                                  aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                  <div class="row">
                                      <div class="col-md-12">
                                          <div class="single-form form-default">
                                              <label>주문하시는분</label>
                                              <div class="row">
                                                  <div class="col-md-12 form-input form">
                                                      <input type="text" placeholder="주문하시는분" value="${member.name}">
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="single-form form-default">
                                              <label>이메일</label>
                                              <div class="form-input form">
                                                  <input type="email" placeholder="이메일" value="${member.email}">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="single-form form-default">
                                              <label>휴대폰번호</label>
                                              <div class="form-input form">
                                                  <input type="text" placeholder="휴대폰번호" value="${member.phone}">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="col-md-12">
                                          <div class="single-form button">
                                              <button class="btn" data-bs-toggle="collapse"
                                                  data-bs-target="#collapseFour" aria-expanded="false"
                                                  aria-controls="collapseFour">다음</button>
                                          </div>
                                      </div>
                                  </div>
                              </section>
                          </li>
                          <li>
                              <h6 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour"
                                  aria-expanded="false" aria-controls="collapseFour">배송정보</h6>
                              <section class="checkout-steps-form-content collapse" id="collapseFour"
                                  aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                  <div class="row">
                                       <div class="col-md-12">
                                          <div class="single-form form-default">
                                              <label>받으시는분</label>
                                              <div class="row">
                                                  <div class="col-md-12 form-input form">
                                                      <input type="text" placeholder="받으시는분" value="${member.name}">
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="single-form form-default">
                                              <label>이메일</label>
                                              <div class="form-input form">
                                                  <input type="eamil" placeholder="이메일" value="${member.email}">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="col-md-6">
                                          <div class="single-form form-default">
                                              <label>휴대폰번호</label>
                                              <div class="form-input form">
                                                  <input type="text" placeholder="휴대폰번호" value="${member.phone}">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="col-sm-6">
										<div class="single-form form-default">
											<label for="reg-pass">우편번호</label>
											<input class="form-control zipcode" type="address" name="zipcode" readonly value="${member.zipcode}">
										</div>
									</div>
									<div class="col-sm-2">
										<div class="button">
											<button type="button" class="btn mt-4"
												onclick="search_daum_address();">주소찾기</button>
										</div>
									</div>
									<div class="col-sm-12 ">
										<div class="single-form form-default">
											<div>
												<label for="reg-pass"> 주소</label>
												<input class="form-control address1" type="address" name="addr1" readonly value="${member.addr1}">
												<input class="form-control address2 mt-1" type="address" name="addr2" readonly value="${member.addr2}">
											</div>
											<script>
											function search_daum_address() {

											    new daum.Postcode({
											        oncomplete: function (data) {
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
											                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
											                    extraAddr += data.bname;
											                }
											                // 건물명이 있고, 공동주택일 경우 추가한다.
											                if (data.buildingName !== '' && data.apartment === 'Y') {
											                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
											                }
											                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											                if (extraAddr !== '') {
											                    extraAddr = ' (' + extraAddr + ')';
											                }
											                // 주소변수 문자열 과 참고항목 문자열 합치기 
											                addr += extraAddr;

											            } else {
											                addr += ' ';
											            }

											            // 우편번호와 주소 정보를 해당 필드에 넣는다.
											           	$("[name=zipcode]").val(data.zonecode);
											            $("[name=addr1]").val(data.roadAddress);				            
											            $("[name=addr2]").val(addr.jibunAddress);
											            
											            // 커서를 상세주소 필드로 이동한다.
											            $("[name=addr3]").attr("readonly", false);
											            $("[name=addr3]").focus();

											        }
											    }).open();
											}

											</script>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="single-form form-default">
											<label for="reg-pass"></label>
											<input class="form-control address3" type="address" name="addr3" placeholder="상세주소" readonly value="${member.addr3}">
										</div>
									</div>
                                      <div class="col-md-12">
                                          <div class="steps-form-btn button">
                                              <button class="btn" data-bs-toggle="collapse"
                                                  data-bs-target="#collapseThree" aria-expanded="false"
                                                  aria-controls="collapseThree">이전</button>
                                              <a href="javascript:void(0)" class="btn btn-alt">저장</a>
                                          </div>
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
                          <p>포인트 적용하기</p>
                          <form action="#">
                              <div class="single-form form-default">
                                  <div class="form-input form">
                                      <input type="text" placeholder="${member.mpoint}">
                                  </div>
                                  <div class="button">
                                      <button class="btn">사용하기</button>
                                  </div>
                              </div>
                          </form>
                      </div>
                      <div class="checkout-sidebar-price-table mt-30">
                          <h5 class="title">결제금액</h5>
                          <div class="sub-total-price">
                              <div class="total-price">
                                  <p class="value">결제금액</p>
                                  <p class="price">원</p>
                              </div>
                              <div class="total-price shipping">
                                  <p class="value">할인 금액</p>
                                  <p class="price">원</p>
                              </div>
                          </div>

                          <div class="total-payable">
                              <div class="payable-price">
                                  <p class="value">총 결제금액</p>
                                  <p class="price">원</p>
                              </div>
                          </div>
                          <div class="price-table-btn button">
                          <a href="kakaopay" class="btn btn-alt" id="apibtn" onclick="request_pay()">결제하기</a>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
<%@ include file="./inc/footer.jsp"%>