<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>

<!-- Start Product Input Area -->
<div class="admin-input section">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card input-form rounded shadow-sm" action=""
					method="post" enctype="multipart/form-data">
					<h4 class="mb-5">상품 수정</h4>
					<!-- ▲ MultipartRequest 기능을 쓰려면
                            form에 enctype="multipart/form-data 를 넣어줘야한다.
                            이렇게 해야 파라미터를 전달 받을 수 있다. 아니면 null값이 나옴.. -->
					<table class="container table table-borderless">
								<tr>
								<td>대분류</td>
								<td>
									<!-- select/// 등록된 카테고리 for문으로 불러와서 나열 -->
								<select class="form-select form-select-sm cinput" name="pcategory_fk1">
									<c:forEach var="cate" items="${cateList}">
									<c:set var="pcategory_fk1" value="${CategoryVO.getCateName}"/>
									<c:set var="cvo" value="${CategoryVO}"/>
									<c:set var="pvo" value="${ProductVO}"/>
									<c:if test="${cvo.getCateName eq pvo.getPcategory_fk1}">
										<option id="pcategory_fk1" name="pcategory_fk1" 
										value="${cate.pcategory_fk1}">${cate.pcategory_fk1}
										</option>
										</c:if>
									</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td>소분류</td>
								<td>
									<!-- select/// 등록된 카테고리 for문으로 불러와서 나열 --> 
								<select class="form-select form-select-sm cinput" name="pcategory_fk2">
									<option id="pcategory_fk2" name="pcategory_fk2" value="${cate.CateName}"></option>
								
								</select>
								</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input class="form-control form-control-sm cinput"
									type="text" name="pname" id="pname" value="${data.pname}"></td>
							</tr>
							<tr>
								<td>이미지</td>
								<td><input class="form-control form-control-sm cinput"
									type="file" name="pimage" id="pimage" value="${data.pimage}"></td>
							</tr>
							<tr>
								<td>브랜드</td>
								<td><input class="form-control form-control-sm cinput"
									type="text" name="pcompany" id="pcompany" value="${data.pcompany}"></td>
							</tr>
							<tr>
								<td>사양</td>
								<td><select class="form-select form-select-sm cinput"
									name="pspec" id="pspec" value="${data.pspec}">
										<!-- option/// 나열-->
										<option value="none" selected>일반</option>
										<option value="best">인기</option>
										<option value="new">최신</option>
								</select></td>
							</tr>
							<tr>
								<td>수량</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" name="pqty" max="1000000000" min="0" 
									id="pqty" value="${data.pqty}"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" id="price" name="price" max="1000000000" min="0" 
									value="${data.price}"></td>
							</tr>
						<!-- 
							<tr>
								<td>상품소개</td>
								<td><textarea class="form-control form-control-sm cinput"
										name="" rows="3"></textarea></td>
							</tr>
						 -->
							<tr>
								<td>포인트</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" name="ppoint" min="0"
									id="ppoint" value="${data.ppoint}"></td>
							</tr>
							<tr>
								<td colspan="2" class="text-center inputdiv"><input
									type="submit" class="btn ok" value="수정" /> <input type="reset"
									class="btn reset" value="취소" /> <a href="product-list"
									class="btn golist">목록</a></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/footer.jsp"%>