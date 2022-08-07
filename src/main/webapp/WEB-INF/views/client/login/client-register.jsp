<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/client-header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>





<div class="account-login section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<div class="register-form">
					<div class="title">
						<h3>회원가입</h3>

					</div>
					<form class="row" id="joinForm" method="post">

						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-fn">이름</label> <input class="form-control"
									type="text" name="name" required>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<div>

									<label for="reg-fn">아이디</label> <input
										class="form-control id_input" type="text" name=id> 
										<span class="id_input_re_1" style="display: none; color: green;">사용	가능한 아이디 입니다</span> 
										<span class="id_input_re_2" style="display: none; color: red;">아이디가 이미 존재합니다</span>

								</div>
							</div>
						</div>
						<script type="text/javascript">
		
									  $('.id_input').on('input propertychange paste', function(){
										    
										 					    	
										 var id = $('.id_input').val();
										    var data = {id : id}
																				
											 $.ajax({
												type : "post",
												url : "/memberIdChk",
												data: data,
												
												success:function(result){
																					    		
													if(result != 'fail'){
														$('.id_input_re_1').css("display", "inline-block");
											    		$('.id_input_re_2').css("display", "none");				
												} else {
														$('.id_input_re_1').css("display", "inline-block");
														$('.id_input_re_2').css("display", "none");				
												}
																		  
										}
																			    	
									   }); 
																			    
									 });
								</script>



						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass">비밀번호</label> <input class="form-control"
									type="password" name="pw" autocomplete="off" required>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass-confirm">비밀번호확인</label> <input
									class="form-control" type="password" name="" required>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass-confirm">생년월일</label> <input
									class="form-control" type="text" name="birth"
									placeholder="ex)981020">
							</div>
						</div>




						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass-confirm">성별</label> <input
									class="form-control" type="text" name="gender" required>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-pass">전화번호</label> <input class="form-control"
									type="tel" name="phone" required
									placeholder="ex) 010-1234-5678">
							</div>
						</div>
						<div class="col-sm-8">
							<div class="form-group">
								<label for="reg-pass">이메일</label> <input class="form-control"
									type="email" name="email" required placeholder="1234@daum.net"
									disable="disabled">
							</div>
						</div>
						<div class="col-sm-3">

							<div class="button">
								<button type="button" class="btn m-3"
									onclick="join_daum_address();">인증번호</button>
							</div>
						</div>
						
						
						
						<div class="col-sm-8">
							<div class="form-group">
								<label for="reg-pass">우편번호</label> <input
									class="form-control adress1" type="adress" name="addr1"
									readonly="readonly">
							</div>
						</div>
						<div class="col-sm-3">

							<div class="button">
								<button type="button" class="btn m-3"
									onclick="join_daum_address();">주소 찾기</button>
							</div>
						</div>



						<div class="col-sm-12 ">
							<div class="form-group">
								<div>
									<label for="reg-pass"> 주소</label> <input
										class="form-control address2" type="address" name="addr2"
										readonly="readonly">
								</div>

							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-pass"></label><input
									class="form-control address3" type="address" name="addr3"
									placeholder="상세주소" readonly="readonly">
							</div>
						</div>
						-->
						<!--카카오 주손 api  -->

						<!-- <script>

                        function join_daum_address(){
                     	   
                     	   new daum.Postcode({
                     	        oncomplete: function(data) {
                     	        	
                     	    	/* ar addr = ''; // 주소 변수
                                    var extraAddr = ''; // 참고항목 변수

                               
                                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                        addr = data.roadAddress;
                                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                        addr = data.jibunAddress;
                                    }

                                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                    if(data.userSelectedType === 'R'){
                                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                            extraAddr += data.bname;
                                        }
                                        // 건물명이 있고, 공동주택일 경우 추가한다.
                                        if(data.buildingName !== '' && data.apartment === 'Y'){
                                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                        }
                                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                        if(extraAddr !== ''){
                                            extraAddr = ' (' + extraAddr + ')';
                                        }
                                        // 주소변수 문자열 과 참고항목 문자열 합치기 
                                       add += extraAddr
                                    
                                    } else {
                                        add += ' ';
                                    }

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    $(".adress1").val(data.zonecode);
                                    $(".adress2").val(addr);
                                    
                                    // 커서를 상세주소 필드로 이동한다.
                             		$(".adress3").attr("readonly",false);
                             		$(".adress3").fous();  */ */
                                }
                            }).open();
                        }
                     	        	
     
				</script> -->
						<div class="button">
							<button id="join_btn" class="btn">가입 완료</button>
						</div>
						<script>
                           	$("#join_btn").click(function)(){
                           		$("#join_form").submit("/client-main");
                           		
                           	
                           	});
                           	
                         
                           	</script>




						<p class="outer-link">
							로그인이 이미 되어 있으신가요? <a href="client-login">로그인 하기</a>
						</p>
				</div>
			</div>
		</div>
		</form>
	</div>
</div>

<script>

                        function join_daum_address(){
                     	   
                     	   new daum.Postcode({
                     	        oncomplete: function(data) {
                     	        	
                     	    	 ar addr = ''; // 주소 변수
                                    var extraAddr = ''; // 참고항목 변수

                               
                                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                        addr = data.roadAddress;
                                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                        addr = data.jibunAddress;
                                    }

                                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                    if(data.userSelectedType === 'R'){
                                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                            extraAddr += data.bname;
                                        }
                                        // 건물명이 있고, 공동주택일 경우 추가한다.
                                        if(data.buildingName !== '' && data.apartment === 'Y'){
                                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                        }
                                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                        if(extraAddr !== ''){
                                            extraAddr = ' (' + extraAddr + ')';
                                        }
                                        // 주소변수 문자열 과 참고항목 문자열 합치기 
                                       add += extraAddr
                                    
                                    } else {
                                        add += ' ';
                                    }

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    $(".adress1").val(data.zonecode);
                                    $(".adress2").val(addr);
                                    
                                    // 커서를 상세주소 필드로 이동한다.
                             		$(".adress3").attr("readonly",false);
                             		$(".adress3").fous();  */ */
                                }
                            }).open();
                        }
                     	        	
     
				</script>


<%@ include file="../inc/footer.jsp"%>