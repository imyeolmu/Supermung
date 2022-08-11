<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<section id="wrapper">
<%@ include file="./mypage-header.jsp" %>

	<section class="myinfo mt-4 mb-5">
		<div class="myinfo-container p-3">
			<h3 class="fs-3 text-center delete">탈퇴 시 주의사항</h3>
			<form class="row account-login" action="client-delete" method="post">
				<div class="col-sm-12">
					<div class="form-group">
						<ul class="precautions">
							<li class="mb-3">1. 게시판형 서비스(문의하기, 리뷰하기 등)에 등록한 게시물은 탈퇴 후에도 남아 있습니다.<br/>
								&nbsp;&nbsp;&nbsp; 글이 남아 있는 것을 원치 않는다면 비공개 또는 삭제 후 탈퇴하세요. </li> 
							<li class="mb-3">2. 회원정보 데이터는 파기되어 복구할 수 없습니다.</li>
							<li class="mb-4">3. 탈퇴한 아이디로는 다시 가입할 수 없으며, 아이디 및 데이터는 복구할 수 없습니다.<br/>
							   	&nbsp;&nbsp;&nbsp;&nbsp; 회원 탈퇴 시 신중히 진행하세요.<br/>
							   	&nbsp;&nbsp;&nbsp;&nbsp; 탈퇴 도중 문제가 있거나 궁금하신 사항이 있으면 고객센터로 문의해주시기바랍니다.</li>
						</ul>
					</div>
				</div>
				<div class="buttondiv text-center">
					<input type="submit" class="btn ok" onclick="passWord()" value="탈퇴하기"/>
					<a class="btn reset" href="javascript:history.back()">뒤로가기</a>
				</div>
					<script>function passWord() {
						var testV = 1;
						var pass1 = prompt('비밀번호를 입력하세요.',''); // 초기시 암호 물어보는 멘트
						while (testV < 3) {
						if (!pass1) 
						history.go(-1);
						if (pass1.toLowerCase() == '${member.pw}') { // 암호지정
						alert('탈퇴가 완료되었습니다.'); // 암호가 맞았을때 나오는 멘트
						location.href ='/client-main'; // 이동할 웹페이지 지정 - 현재창에서 이동
						break;
						} 
						testV+=1;
						var pass1 = 
						prompt('비밀번호를 다시 입력하세요.',''); // 암호가 틀렸을때 멘트
						}
						if (pass1.toLowerCase()!="password" & testV ==3) 
						history.go(-1);
						return " ";
						} 
					</script>
			</form>
		</div>
	</section>
</section>
<%@ include file="../inc/footer.jsp"%>