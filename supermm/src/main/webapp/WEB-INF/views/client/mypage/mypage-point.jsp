<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/client-header.jsp"%>
<section id="wrapper">
   <%@ include file="./mypage-header.jsp" %>
    
    <section class="myinfo mt-4 mb-5">
      <div class="myinfo-container p-3">
        <h3 class="text-center">내포인트</h3>
        <form class="money-container-form" action="member-point?mnum=${member.mnum}" method="post">
			<table class="money-container table table-borderless text-center">
				<tbody>
					<tr>
						<td class="fs-6">잔여포인트</td>
						<td class="fs-6"><fmt:formatNumber value="${member.mpoint}"
							pattern="#,##0"/>원</td>
					</tr>
					<tr>
						<td class="fs-6">포인트를 얻으려면?</td>
						<td class="fs-6">
							1. 상품구매시 구매한 상품가격의 1% 적립 <br/>
							2. 리뷰게시판에 리뷰를 남기면 100P 적립
						</td>
					</tr>
				</tbody>
			</table>
			<div class="inputdiv text-center">
				<a class="btn ok" href="client-product-list">쇼핑하기</a>
				<a class="btn reset" href="javascript:history.back()">뒤로가기</a>
			</div>
		</form>
      </div>
    </section>
</section>

<%@ include file="../inc/footer.jsp"%>