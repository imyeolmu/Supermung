<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/client-header.jsp"%>
    <!-- Start Faq Area -->
    <section class="faq section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>FAQ</h2>
                        <p>자주 묻는 질문을 한자리에</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <span class="title">[입금/결제]결제 방법은 어떤게 있나요?</span><i
                                        class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>결제 방법은 금액충전 결제, 적립금 결제 2가지의 방법으로 결제가 가능합니다.</p>
                                    <p>
	                                    <!-- 1. 신용카드<br/>
										고객님의 카드번호, 유효기간 등을 승인받으 신 후 이용하실 수 있는 인터넷 안전결제(ISP), 안심클릭서비스를 이용해 결제 시 지정한 패스워드를 입력하여 편리하게 결제할 수 있습니다.
										인터넷안전결제(ISP)를 이용하기 위해서는 국민카드, 비씨카드, 우리카드 홈페이지에서 인증서 등록을 하시면 됩니다.
										안심클릭 해당 카드로 30만원 이상 거래시에는 반드시 공인 인증서가 필요합니다.
										비씨카드, 국민카드, 조흥비자, 롯데카드, 삼성카드, 신한카드, 엘지카드, 현대카드(ISP 안심클릭 해당카드)를 제외한 신용카드는 금액애 상관없이 공인 인증서 없이 결제가 가능합니다.
										신용카드로 결제 시에는 세금 계산서가 별도 발행되지 않으며 카드 영수증은 세금계산서와 동일하게 사용되므로 증빙등의 용도로 사용하실 때에는 신용카드 결제 영수증으로 사용하십시오. -->
										1. 금액충전 결제<br/>
										마이페이지에서 사용할 금액을 충전한 후 결제 페이지에서 충전한 금액으로 결제를 하는 방법으로 충전 후 유효기간은 정해져 있지 않습니다.										
										<br/><br/>2. 포인트 결제<br/>
										포인트는 언제든 사용이 가능합니다.
									</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <span class="title">[회원정보/멤버십] 회원가입은 어떻게 하나요?</span><i class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>
                                    	회원가입은 무료이며 홈페이지 상단의 "회원가입"을 클릭하여 정해진 양식에 따라 고객님의 인적사항을 입력하신 후 회원가입을 하시면 됩니다.<br/>
										회원가입 시 본인의 생년월일을 입력해주시면 해당일에 맞춰 슈퍼멍뭉에서 사용가능한 포인트 10,000P를 받아보실 수 있으며, 회원가입 시 더 많은 혜택을 누리실 수 있습니다.
										회원가입 시 문제가 있거나 궁금하신 사항이 있으면 고객센터로 문의해주시기바랍니다. 감사합니다. 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <span class="title">[주문/배송]주문 및 배송 확인은 어디서 확인 가능한가요?</span><i
                                        class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>
                                    	슈퍼멍뭉은 회원일 경우에만 주문이 가능하며, 주문 및 배송은 로그인 후 상단 마이페이지 주문내역조회에서 확인 가능합니다.<br/>
										또한 상단 주문배송에서 조회 가능하며, 해당 주문번호를 클릭하면 해당 주문에 대한 배송상태 등의 자세한 내역을 확인할 수 있습니다.<br/>
										주문배송 조회에 문제가 있거나 궁금하신 사항이 있으면 고객센터로 문의해주시기바랍니다. <br/>감사합니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <span class="title">[충전금액/포인트]현재 제가 가지고 있는 금액과 포인트는 어디서 확인 가능한가요?</span><i
                                        class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>
                                    	현재 고객님이 보유한 충전금액과 포인트는 로그인 후 상단 마이페이지에서 확인 가능합니다.<br/>
										충전금액과 포인트 사용에 대해 어려움이 있거나 더 궁금한 사항이 있으면 고객센터로 문의해주시기바랍니다.<br/> 감사합니다.
									</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    <span class="title">[취소/환불]주문취소시 결제한 금액과 포인트는 어떻게 되나요?</span><i
                                        class="lni lni-plus"></i>
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>
                                    	결제 시 사용하신 금액과 포인트는 주문을 취소했을 경우 다시 환원됩니다.<br/>
										더 궁금한 사항이 있으시면 고객센터로 문의해주시기 바랍니다.<br/> 감사합니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@ include file="./inc/footer.jsp"%>