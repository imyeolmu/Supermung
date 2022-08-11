<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<section id="wrapper">
   <%@ include file="./mypage-header.jsp" %>   
    <section class="myinfo mt-4 mb-5">
      <div class="myinfo-container p-3">
        <h3 class="text-center">금액 충전하기</h3>
        <form class="money-container-form" action="client-money?id=${member.id}" method="post">
			<table class="money-container table table-borderless text-center">
				<tbody>
					<tr>
						<td class="fs-6">잔여금액</td>
						<td class="fs-6"><fmt:formatNumber value="${member.money}"
							pattern="#,##0" />원</td>
					</tr>
					<tr>
						<td class="fs-6">충전할금액</td>					
						<td class="fs-6"><input class="w-75 cinput input-form" type="number" name ="money" required></td>
					</tr>
				</tbody>
			</table>
			<div class="buttondiv text-center">
				<input type="submit" class="btn ok" onclick="passWord()" value="충전하기"/>
				<input type="reset" class="btn reset" value="취소" />
				<script>function passWord() {
						var testV = 1;
						var pass1 = prompt('비밀번호를 입력하세요.',''); // 초기시 암호 물어보는 멘트
						while (testV < 3) {
						if (!pass1) 
						history.go(-1);
						if (pass1.toLowerCase() == '${member.pw}') { // 암호지정
						alert('충전이 완료되었습니다.'); // 암호가 맞았을때 나오는 멘트
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
			</div>
		</form>
      </div>
    </section>
</section>
<%@ include file="../inc/footer.jsp"%>