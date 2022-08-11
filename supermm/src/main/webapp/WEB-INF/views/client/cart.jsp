<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<!-- 수량 조정 form -->
	<form action="<c:url value='/cart/update'/>" method="post" class="quantity_update_form">
		<input type="hidden" name="cartnum" class="update_cartnum">
		<input type="hidden" name="cartAmount" class="update_cartAmount">
		<input type="hidden" name="id" value="${member.id}">
	</form>
    <div class="shopping-cart section">
        <div class="container">
            <div class="cart-list-head">
                <!-- Cart List Title -->
                <div class="cart-list-title">
                    <div class="row text-center">
                        <div class="col-lg-1 col-md-1 col-12">
                        	<p>NO</p>
                        </div>
                        <div class="col-lg-2 col-md-1 col-12">
                        	<p>상품이미지</p>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12">
                            <p>상품이름</p>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12">
                            <p>상품수량</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>가격</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>포인트</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>총가격</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>총포인트</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>삭제</p>
				        </div>
                    </div>
                </div>
     
                <!-- End Cart List Title -->
<c:choose>
   <%-- hashmap에 저장해놓은거! 담긴 상품이 없을 때! --%>
	<c:when test="${map.count==0}">
		장바구니가 비어있습니다.
	</c:when>
	<c:otherwise>
	<%-- 담긴 상품이 있을 때 --%>
                	<c:forEach var="cartList" items="${map.list}">
                <!-- Cart Single List list -->
                <div class="cart-single-list">
                    <div class="row align-items-center text-center">
                        <div class="col-lg-1 col-md-1 col-12">
                            <p style="color:#AB93C9; font-weight: bold">${cartList.cartnum}</p>
                        </div>
                        <div class="col-lg-2 col-md-1 col-12">
                            <a href="<c:url value='client-product-detail?pnum=${cartList.pnum}'/>"><img src="<c:url value="${cartList.pimage}"/>" alt="#"></a>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12">
                            <h5 class="product-name">
                            <a href="product-details"></a></h5>
                            <p class="product-des">
                                <span><em style="color:#AB93C9; font-weight: bold">상품이름</br></em >${cartList.pname}</span>
                                
                                <span class="mt-3"><em style="color:#AB93C9; font-weight: bold">상품분류</br></em>${cartList.pspec}</span>
                            </p>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12">
                         <div class="quantity_div">
                         	<input style="padding: 5px; border: 1px solid #ddd; width:50px;
   							 color: darkgray;"
                         	type="text" value="${cartList.cartAmount}" size="2" class="quantity_input">
                         	
                         	<button style="padding:5px 0 5px 0;outline: none; border: 1px solid #ddd; 
                         	 margin-left: -3px"
                         	class="quantity_btn plus_btn">+</button>   
                         	<button style="padding:5px 0 5px 0;margin-left: -3px;
                         	outline: none; border: 1px solid #ddd;"
                         	class="quantity_btn minus_btn">-</button>
                         	<script>
                         	/* 수량버튼 */
                         	$(".plus_btn").on("click", function(){
                         		let quantity = $(this).parent("div").find("input").val();
                         		$(this).parent("div").find("input").val(++quantity);
                         	});
                         	$(".minus_btn").on("click", function(){
                         		let quantity = $(this).parent("div").find("input").val();
                         		if(quantity > 1){
                         			$(this).parent("div").find("input").val(--quantity);		
                         		}
                         	});

                         	</script>   
                         </div>
                         	<a class="qty_update_btn" data-cartnum="${cartList.cartnum}">
                         	<span class="mt-3" style="color: darkgray; margin-top: 5px">수정</span></a>
                         	<script>
                         	/* 수량 수정 버튼 */
                         	$(".qty_update_btn").on("click", function(){
                         		let cartnum = $(this).data("cartnum");
                         		let cartAmount = $(this).parent("div").find("input").val();
                         		$(".update_cartnum").val(cartnum);
                         		$(".update_cartAmount").val(cartAmount);
                         		$(".quantity_update_form").submit();
                         		
                         	});
                         	</script>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>${cartList.price}</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>${cartList.ppoint}</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>${cartList.totprice}</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <p>${cartList.totpoint}</p>
                        </div>
                        <div class="col-lg-1 col-md-2 col-12">
                            <a href="<c:url value='cart-delete?cartnum=${cartList.cartnum}'/>"onClick="alert('삭제하시겠습니까?')"><img src="https://img.icons8.com/sf-black-filled/20/ab93c9/x.png"/></a>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- End Single List list -->
                 <div class="coupon mt-4 text-center">
			         <form action="#" target="_blank">
			         	<div class="button">
			                 <button id="btnDelete" type="button" class="btn"><img src="https://img.icons8.com/ios/30/FFFFFF/broom.png"/>
			                 </br><span style="font-size: 0.5em">장바구니 비우기</span>
			                 
			                 <script>
			                 $(function(){
			                	    $("#btnDelete").click(function(){
			                	        if(confirm("장바구니를 비우시겠습니까?")){
			                	           location.replace("/deleteAll");
			                	        }
			                	    });
			                	});
			                 </script>
			                 
			                 </button>
			            </div>
			         </form>
  			    </div>
            <div class="row">
                <div class="col-12">
                    <!-- Total Amount -->
                    <div class="total-amount">
                        <div class="row">
                            <div class="col-lg-12 col-md-6 col-12">
                                <div class="right">
                                    <ul>
                                        <li>총 가격<span style="color:#AB93C9; font-weight: bold">${map.priceAll}원</span></li>
                                        <li>총 적립 포인트<span style="color:#AB93C9; font-weight: bold">${map.pointAll}원</span></li>
                                        <li class="last" style="color:#3333; font-weight: bold">전체 포인트 사용시 결제금액<span>${map.fee}원</span></li>
                                    </ul>
                                    <div class="button">
                                        <a href="checkout" class="btn">구매하기</a>
                                        <a href="<c:url value='client-main'/>" class="btn btn-alt">계속 쇼핑하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!--/ End Total Amount -->
            </div>
 </c:otherwise>
 </c:choose>
        </div>
    </div>
    </div>
    </form>
<%@ include file="./inc/footer.jsp"%>