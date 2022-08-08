<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/client-header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/slick.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/slick-theme.min.css" />
<!-- Start Item Details -->
	<form action="<c:url value='/qtyUpdate'/>" method="post" class="quantity_update_form">
		<input type="hidden" name="pnum" class="update_pnum">
		<input type="hidden" name="cartAmount" class="update_cartAmount">
		<input type="hidden" name="id" value="${member.id}">
	</form>

<section class="item-details section">
	<div class="container">
		<div class="top-area">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-12 col-12">
					<div class="product-images">
						<main id="gallery">
							<div class="main-img">
								<img src="<c:url value="${data.pimage}"/>" id="current" alt="#">
							</div>
						</main>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-12">
					<div class="product-info">
						<h2 class="title">${data.pname}</h2>
						<p class="category">
							<i class="lni lni-tag"></i>${data.pcategory_fk1}</p>
						
							<h3 class="price">$ ${data.price}</h3> 
						
							<div>
								<span style="color:#AB93C9; font-weight: bold; margin-left: 2px">Point</span>
								<span class="point mb-2" style="margin-left: 10px; color:gray">${data.ppoint}</span>
							</div>
						<p class="info-text" style="font-size: 0.9em">${data.pcontent}</p>
							
						<div class="bottom-content">
							<div class="row align-items-end">
							<div class="col-lg-4 col-md-4 col-12">
							<div class="button">
								<div class="quantity_div mb-3">
		                         	<input style="padding: 5px; border: 1px solid #ddd; width:50px;
		   							 color: darkgray;"
		                         	type="text" value="1" size="2" class="quantity_input">
		                         	
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
	                            <!-- 로그인 하지 않는 상태 -->
                                 <c:if test="${member == null}">
                                 	<a href="<c:url value='insert'/>" onClick="alert('로그인 후 이용해주세요.')" class="btn"><i class="lni lni-cart"></i>장바구니</a>
                                 </c:if>
                                 <!-- 로그인 상태 -->
                                <c:if test="${member != null}">
                               		<a class="qty_update_btn btn mt-3" data-pnum="${data.pnum}">
		                         	<i class="lni lni-cart"></i>장바구니</a>
		                         	<script>
		                         	/* 수량 수정 버튼 */
		                         	$(".qty_update_btn").on("click", function(){
		                         		let pnum = $(this).data("pnum");
		                         		let cartAmount = $(this).parent("div").find("input").val();
		                         		$(".update_pnum").val(pnum);
		                         		$(".update_cartAmount").val(cartAmount);
		                         		$(".quantity_update_form").submit();
		                         		
		                         	});
		                         	</script>
		                         </c:if>
		                        </div>
		                         </div>
		                         <div class="col-lg-4 col-md-4 col-12">
									<div class="wish-button">
										<button class="btn">
											<i class="lni lni-heart"></i>바로결제
										</button>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-12">
									<div class="wish-button">
										<a href="javascript:history.back()"><button class="btn">
												<i class="lni lni-pointer-left"></i>BACK
											</button></a>
									</div>
								</div>
	                            </div>
	                            </div>
	                            </div>
								</div>
							</div>
						</div>
					</div>
</section>
<!-- Start Article -->
<div id="carousel-related-product" style="padding-left: 20px; padding-right:20px; margin-bottom: 200px;">
	<c:set value="${data.pcategory_fk1}" var="category" />
	<c:forEach items="${list}" var="list" step="8">
		<c:if test="${list.pcategory_fk1 eq category}">
			<div class="single-product me-3" style="height:450px; box-shadow:none;">
				<div class="product-image">
					<img  src="<c:url value="${list.pimage}"/>" alt="#">
					<div
						class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
						<div class="button">
	                            <!-- 로그인 하지 않는 상태 -->
                                 <c:if test="${member == null}">
                                 	<a href="<c:url value='insert'/>" onClick="alert('로그인 후 이용해주세요.')" class="btn"><i class="lni lni-cart"></i>장바구니</a>
                                 </c:if>
                                 <!-- 로그인 상태 -->
                                 <c:if test="${member != null}">
                                    <a href="<c:url value='insert?pnum=${list.pnum}&cartAmount=1'/>" class="btn"><i class="lni lni-cart"></i>장바구니</a>
                                 </c:if>
	                            </div>
					</div>
				</div>
				<div class="product-info">
					<span class="category"></span>
					<h4 class="title">
						<span class="category">${list.pcategory_fk1}</span> <a
							href="<c:url value='client-product-detail?pnum=${list.pnum}'/>">
								${list.pname}</a>
					</h4>
					<div class="price">
						<span><fmt:formatNumber value="${list.price}"
								pattern="#,##0" />원</span>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
</div>

<!-- Start Script -->
<script src="${ctx}/resources/js/jquery-1.11.0.min.js"></script>
<!-- End Script -->

<!-- Start Slider Script -->
<script src="${ctx}/resources/js/slick.min.js"></script>
<script type="text/javascript">
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            infinite:true,
            autoplay:true,
            autoplaySpeed:800,
            dots: false,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 640,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
    </script>

<!-- ========================= JS here ========================= -->
<script type="text/javascript">
        const current = document.getElementById("current");
        const opacity = 0.6;
        const imgs = document.querySelectorAll(".img");
        imgs.forEach(img => {
            img.addEventListener("click", (e) => {
                //reset opacity
                imgs.forEach(img => {
                    img.style.opacity = 1;
                });
                current.src = e.target.src;
                //adding class 
                //current.classList.add("fade-in");
                //opacity
                e.target.style.opacity = opacity;
            });
        });
        
        
        $(function(){
            $('.slider-wrap').slick({
              slide: 'div',        //슬라이드 되어야 할 태그
              infinite : true,     //무한 반복 옵션     
              slidesToShow : 2,        // 한 화면에 보여질 컨텐츠 개수
              slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
              speed : 500,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
              arrows : true,         // 옆으로 이동하는 화살표 표시 여부
              dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
              autoplay : true,            // 자동 스크롤 사용 여부
              autoplaySpeed : 2000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
              pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
              vertical : false,        // 세로 방향 슬라이드 옵션
              prevArrow : "<button type='button' class='slick-prev'>Previous</button>",
              nextArrow : "<button type='button' class='slick-next'>Next</button>",
              draggable : true,     //드래그 가능 여부 
              responsive: [ // 반응형 웹 구현 옵션
                {  
                  breakpoint: 960, //화면 사이즈 960px
                  settings: {
                    slidesToShow: 4
                  } 
                },
                { 
                  breakpoint: 768, //화면 사이즈 768px
                  settings: {    
                    slidesToShow: 5
                  } 
                }
              ]

            });
        })
        
    </script>

<%@ include file="../inc/footer.jsp"%>
