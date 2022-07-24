<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>

<!-- Start Product Input Area -->
<div class="admin-input section">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-7 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card input-form rounded shadow-sm" action=""
					method="post" enctype="multipart/form-data">
					<h4 class="mb-5">상품 등록</h4>
					<!-- ▲ MultipartRequest 기능을 쓰려면
                            form에 enctype="multipart/form-data 를 넣어줘야한다.
                            이렇게 해야 파라미터를 전달 받을 수 있다. 아니면 null값이 나옴.. -->
					<table class="container table table-borderless">
						<tbody>
							<tr>
								<td>카테고리</td>
								<td>
									<!-- select/// 등록된 카테고리 for문으로 불러와서 나열 --> <select
									class="form-select form-select-sm cinput" name="">
										<option value="">1</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input class="form-control form-control-sm cinput"
									type="text" name=""></td>
							</tr>
							<tr>
								<td>제조회사</td>
								<td><input class="form-control form-control-sm cinput"
									type="text" name=""></td>
							</tr>
							<tr>
								<td>상품이미지</td>
								<td><input class="form-control form-control-sm cinput"
									type="file" name=""></td>
							</tr>
							<tr>
								<td>상품수량</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" name="" max="100" min="0"></td>
							</tr>
							<tr>
								<td>상품가격</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" name="" max="1000000000" min="0"></td>
							</tr>
							<tr>
								<td>상품사양</td>
								<td><select class="form-select form-select-sm cinput"
									name="">
										<!-- option/// 나열-->
										<option value="" selected></option>
								</select></td>
							</tr>
							<tr>
								<td>상품소개</td>
								<td><textarea class="form-control form-control-sm cinput"
										name="" rows="3"></textarea></td>
							</tr>
							<tr>
								<td>상품포인트</td>
								<td><input class="form-control form-control-sm cinput"
									type="number" name="" min="0"></td>
							</tr>
							<tr>
								<td colspan="2" class="text-center inputdiv"><input
									type="submit" class="btn ok" value="등록" /> <input type="reset"
									class="btn reset" value="취소" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- End Account Login Area -->

<%@ include file="../inc/footer.jsp"%>