<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${ctx}/resources/css/password.css">
<section id="wrapper">
	<%@ include file="./mypage-header.jsp"%>
	<section class="myinfo mt-4 mb-5">
		<div class="myinfo-container p-3">
			<h3 class="text-center">금액 충전하기</h3>
			<form class="money-container-form"
				action="client-money?id=${member.id}" method="post">
				<table class="money-container table table-borderless text-center">
					<tbody>
						<tr>
							<td class="fs-6">잔여금액</td>
							<td class="fs-6"><fmt:formatNumber value="${member.money}"
									pattern="#,##0" />원</td>
						</tr>
						<tr>
							<td class="fs-6">충전할금액</td>
							<td class="fs-6"><input class="w-75 cinput input-form"
								type="number" name="money" required></td>
						</tr>
					</tbody>
				</table>
				<!-- <div class="buttondiv text-center">
					<input type="submit" class="btn ok" onclick="passWord()" value="충전하기"/>
					<input type="reset" class="btn reset" value="취소" />
				</div> -->
				<div class="buttondiv text-center">
					<a href="" class="show-prompt-box btn ok">충전하기</a> <a
						href="javascript:history.back()" class="btn reset">뒤로가기</a>
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
									alert('충전되었습니다.');
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