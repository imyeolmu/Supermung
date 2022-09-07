<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="${ctx}/resources/css/password.css">
<section id="wrapper">
   <%@ include file="./mypage-header.jsp"%>
   <section class="myinfo mt-4 mb-5">
      <div class="myinfo-container p-3">
         <h3 class="text-center">금액 충전하기</h3>
         <form class="money-container-form" name="chargeMoney" style="margin:0; padding-bottom:25px"
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
                        type="number" name="money" id="money" required></td>
                  </tr>
               </tbody>
            </table>
         </form>
         <div class="buttondiv text-center" style="margin:0; padding-bottom:50px">
            <input type="button" class="charge btn ok" value="충전하기" /> <input
               type="reset" class="btn reset" value="취소" />
            <script>
               IMP.init('imp55744771');
               $(".charge").click(function () {   
                  var amount = Number(document.getElementById("money").value);
                    console.log("amount : ",amount);
                    
                  IMP.request_pay({ //param
                     pg : 'html5_inicis',
                     pay_method : 'card', //생략 가능
                     merchant_uid : 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
                     name : '결제하기',
                     amount : money,
                     amount: amount,         //가격
                        buyer_email: 'iamport@siot.do',
                        buyer_name: '구매자이름',
                        buyer_tel: '010-1234-5678',
                        buyer_addr: '서울특별시 강남구 삼성동',
                        buyer_postcode: '123-456',
                        m_redirect_url: ''
                        }, function (rsp) {
                           console.log(rsp);
                           if (rsp.success) {
                              var msg = '결제가 완료되었습니다.';
                              msg += '고유ID : ' + rsp.imp_uid;
                              msg += '상점 거래ID : ' + rsp.merchant_uid;
                              msg += '결제 금액 : ' + rsp.paid_amount;
                              msg += '카드 승인번호 : ' + rsp.apply_num;
                              
                              document.chargeMoney.submit();
                              
                              } else {
                                 var msg = '결제에 실패하였습니다.';
                                 msg += '에러내용 : ' + rsp.error_msg;
                                 }
                           alert(msg);
                           });
                     });
            </script>
         </div>
      </div>
   </section>
</section>
<%@ include file="../inc/footer.jsp"%>