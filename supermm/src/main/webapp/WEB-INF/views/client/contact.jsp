<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/client-header.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c54a31a5341f82cc3064afd8908d92b"></script>
    <!-- Start Contact Area -->
    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="contact-head">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>문의하기</h2>
                            <p>슈퍼멍뭉에 대해 문의사항이 있으신 분은<br/> 아래 주소, 전화번호, 이메일로 문의해주시기 바랍니다.</p>
                        </div>
                    </div>
                </div>
                <div class="contact-info">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-12">
                            <div class="single-info-head">
                                <!-- Start Single Info -->
                                <div class="single-info">
                                    <i class="lni lni-map"></i>
                                    <h3>주소</h3>
                                    <ul>
                                        <li>대전 서구 계룡로491번길 86<br>(지번)둔산동 1221</li>
                                    </ul>
                                </div>
                                <!-- End Single Info -->
                                <!-- Start Single Info -->
                                <div class="single-info">
                                    <i class="lni lni-phone"></i>
                                    <h3>전화번호</h3>
                                    <ul>
                                        <li>042-123-4567</li>
                                    </ul>
                                </div>
                                <!-- End Single Info -->
                                <!-- Start Single Info -->
                                <div class="single-info">
                                    <i class="lni lni-envelope"></i>
                                    <h3>이메일</h3>
                                    <ul>
                                        <li>adminsupermm@gmail.com</li>
                                    </ul>
                                </div>
                                <!-- End Single Info -->
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-12 col-12">
                            <div class="contact-form-head">
                                <div class="form-main">
                                    <form class="form" method="post" action="../resources/mail/mail.php">
                                        <div class="row">
                                        <div id="map" style="width:700px;height:500px;"></div>
										<script>
											var container = document.getElementById('map');
											var options = {
												center: new kakao.maps.LatLng(36.34857342067093, 127.3823130825302),
												level: 3
											};
									
											var map = new kakao.maps.Map(container, options);
											// 마커가 표시될 위치입니다 
											var markerPosition  = new kakao.maps.LatLng(36.34857342067093, 127.3823130825302);
											// 마커를 생성합니다
											var marker = new kakao.maps.Marker({
											    position: markerPosition
											});

											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);
										</script>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@ include file="./inc/footer.jsp"%>