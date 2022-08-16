<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${ctx}/resources/css/password.css">
<section id="wrapper">
	<%@ include file="./mypage-header.jsp"%>

	<section class="myinfo mt-4 mb-5">
		<div class="myinfo-container p-3">
			<h3 class="fs-3 text-center delete">탈퇴 시 주의사항</h3>
			<div class="row account-login">
				<div class="col-sm-12">
					<div class="form-group">
						<ul class="precautions">
							<li class="mb-3">1. 게시판형 서비스(문의하기, 리뷰하기 등)에 등록한 게시물은 탈퇴 후에도
								남아 있습니다.<br /> &nbsp;&nbsp;&nbsp; 글이 남아 있는 것을 원치 않는다면 비공개 또는 삭제
								후 탈퇴하세요.
							</li>
							<li class="mb-3">2. 회원정보 데이터는 파기되어 복구할 수 없습니다.</li>
							<li class="mb-4">3. 탈퇴한 아이디로는 다시 가입할 수 없으며, 아이디 및 데이터는 복구할 수
								없습니다.<br /> &nbsp;&nbsp;&nbsp;&nbsp; 회원 탈퇴 시 신중히 진행하세요.<br />
								&nbsp;&nbsp;&nbsp;&nbsp; 탈퇴 도중 문제가 있거나 궁금하신 사항이 있으면 고객센터로
								문의해주시기바랍니다.
							</li>
						</ul>
					</div>
				</div>
				<div class="buttondiv text-center">
					<a href="" class="show-prompt-box btn ok">탈퇴하기</a> <a
						href="javascript:history.back()" class="btn reset">뒤로가기</a>
					<div class="overlay"></div>
					<div class="prompt-wrap">
						<div class="prompt-box">
							<form action="client-delete" method="post">
								<span class="close" onclick="closeModal();"></span>
								<p>비밀번호를 입력하세요</p>
								<input name="clients" class="clients" type="password"
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
									alert('탈퇴되었습니다.');
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
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="../inc/footer.jsp"%>