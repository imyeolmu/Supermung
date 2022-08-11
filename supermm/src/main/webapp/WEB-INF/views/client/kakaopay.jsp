<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./inc/client-header.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<h2>카카오페이 결제창!</h2>
<script>
	IMP.init('imp55744771');
	function requestPay(){			
		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card', //생략 가능
			merchant_uid : "order_no_0006", // 상점에서 관리하는 주문 번호
			name : '결제하기',
			amount : 10000,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) { // callback
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				alert(msg);
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});
	}
</script>
<form action="/mypage-info?id=${myinfo.id}" method="post" name="plusMoney">
<input type="hidden" name="id"  value="${myinfo.id}"> 
<input type="hidden" name="money" value="10000">
<button class="btn btn-outline-danger" type="button" onclick="requestPay()"> 결제하기</button>
</form>
<%@ include file="./inc/footer.jsp"%>