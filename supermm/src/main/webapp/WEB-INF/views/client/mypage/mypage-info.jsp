<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="${ctx}/resources/css/password.css">
<section id="wrapper">
<%@ include file="./mypage-header.jsp" %>
	<section class="myinfo mt-4 mb-5">
		<div class="myinfo-container p-3">
			<h3 class="fs-4 text-center">내정보</h3>
			 <form class="row account-login" action="client-mypage?id=${member.id}" method="post">
				<div class="col-sm-12">
					<div class="form-group">
						<label for="reg-fn">이름</label>
						<input class="form-control" type="text" name="name" value="${member.name}" readonly>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="reg-pass">비밀번호</label>
						<input class="form-control" type="password" name="pw" autocomplete="off" value="${member.pw}" required>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="reg-pass-confirm">비밀번호확인</label>
						<input class="form-control" type="password" name="pw2">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="reg-pass-confirm">생년월일</label>
						<input class="form-control" type="text" name="birth" placeholder="ex)981020" value="${member.birth}" readonly>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="reg-pass-confirm">성별</label>
						<div class="d-flex mt-3">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender" value="${member.gender}" checked>
								<label class="form-check-label pe-5" style="color: #333">${member.gender}</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="reg-pass">전화번호</label>
						<input class="form-control" type="tel" name="phone" required placeholder="ex) 010-1234-5678" value="${member.phone}">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="reg-pass">이메일</label>
						<input class="form-control" type="email" name="email" required placeholder="1234@daum.net" value="${member.email}">
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group">
						<label for="reg-pass">우편번호</label> <input
							class="form-control address1" type="text" name="addr1"
							readonly="readonly" value="${member.addr1}">
					</div>
				</div>
				<div class="col-sm-3">
					<div class="button">
						<button type="button" class="btn"
							onclick="search_daum_address();">주소 찾기</button>
					</div>
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
				            $("[name=addr1]").val(data.zonecode);
				            $("[name=addr2]").val(data.roadAddress);

				            // 커서를 상세주소 필드로 이동한다.
				            $("[name=addr3]").attr("readonly", false);
				            $("[name=addr3]").focus();

				        }
				    }).open();
				}

				</script>
				<div class="col-sm-12 ">
					<div class="form-group">
						<div>
							<label for="reg-pass"> 주소</label>
							<input class="form-control address2 mb-1" type="text" name="addr2" readonly value="${member.addr2}">
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="reg-pass">상세주소</label>
						<input class="form-control address3" type="text" name="addr3" placeholder="상세주소" readonly value="${member.addr3}">
					</div>
				</div>
				<div class="buttondiv text-center">
					<a href="" class="show-prompt-box btn ok">수정하기</a>
					<div class="overlay"></div>
					<div class="prompt-wrap">
						<div class="prompt-box">
							<span class="close" onclick="closeModal();"></span>
							<p>비밀번호를 입력하세요</p>
							<input name="clients input-form" class="clients" type="password"
								placeholder="비밀번호">
							<button class="btn" type="submit">확인</button>
							<script>
								//Password protect form page
								(function() {
											
								//Display modal on click
								$('.show-prompt-box').click(function(e){
								  e.preventDefault();
								  $('.overlay, .prompt-box, .prompt-wrap').fadeIn();
								});
			
								//Fade out overlay and prompt-box
								$('.overlay, .close').click(function(){
								  $('.overlay, .prompt-box').fadeOut();
								  $('.code-error').removeClass('is-error');
								  e.stopPropagation();
								});
			
			
								//Get value and compare to password
								$('.btn').click(function() {
								  var codeWord = $('.clients').val();		
			
								  if (codeWord.toLowerCase() == '${member.pw}') {
									alert('수정되었습니다.');
								   	return true;
								} else{
								    $('.prompt-box').addClass('shake');
								    setTimeout(function() {
								        $('.prompt-box').removeClass('shake')
								    }, 1000);
								    return false;
									
								}
			
								});
			
								})(); 
							</script>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</section>

<%@ include file="../inc/footer.jsp"%>