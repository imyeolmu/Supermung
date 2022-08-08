<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<!-- Start Product Input Area -->
<div class="admin-input section" id="wrap">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card input-form rounded shadow-sm"
					action="<c:url value='product-update?pnum=${prod.pnum}'/>" method="post">
					<h4 class="mb-5">상품 수정</h4>
					<table class="container table table-borderless">
						<tbody>
							<tr>
								<td>카테고리</td>
								<td>
									<select class="form-control form-control-sm cinput"
									type="text" name="pcategory_fk1">
										<option value="${prod.pcategory_fk1}">${prod.pcategory_fk1}</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input class="form-control form-control-sm cinput"
									type="text" name="pname" value="${prod.pname}"></td>
							</tr>
							<tr>
								<td>이미지</td>
								<td><input class="form-control form-control-sm cinput"
									type="text" name="pimage" value="${prod.pimage}"></td>
							</tr>
							<tr>
								<td>브랜드</td>
								<td><input class="form-control form-control-sm cinput"
									type="text" name="pcompany" value="${prod.pcompany}" ></td>
							</tr>
							<tr>
								<td>사양</td>
								<td><select class="form-select form-select-sm cinput"
									name="pspec">
										<!-- option/// 나열-->
										<option value="일반" selected>일반</option>
										<option value="인기">인기</option>
										<option value="최신">최신</option>
								</select></td>
							</tr>
							<tr>
								<td>수량</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" name="pqty" max="1000000000" min="0"  value="${prod.pqty}"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" id="number" name="price" max="1000000000" min="0"  value="${prod.price}"></td>
							</tr>
						
							<tr>
								<td>상품소개</td>
								<td><textarea class="form-control form-control-sm cinput"
										name="pcontent" rows="3" ><c:out value="${prod.pcontent}"/></textarea>
								</td>
							</tr>
							<tr>
								<td>포인트</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" name="ppoint" min="0"  value="${prod.ppoint}"></td>
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