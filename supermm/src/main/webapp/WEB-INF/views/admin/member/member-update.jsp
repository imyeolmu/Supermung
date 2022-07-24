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
					<h4 class="mb-5">회원정보</h4>
					<!-- ▲ MultipartRequest 기능을 쓰려면
                            form에 enctype="multipart/form-data 를 넣어줘야한다.
                            이렇게 해야 파라미터를 전달 받을 수 있다. 아니면 null값이 나옴.. -->
					<table class="container table table-borderless">
						<tbody>
							<tr>
								<td>NO</td>
								<td>1</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>user</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>password</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>이름</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>birthday</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>여</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>user@google.com</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>010-1234-1234</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>010-1234-1234</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>도로명(지번) 상세주소</td>
							</tr>
							<tr>
								<td>가입일</td>
								<td>2022-07-21</td>
							</tr>
							<tr>
								<td><a class="member-point" href="member-point">회원포인트</a></td>
								<td>1000P</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center inputdiv"><a
									href="member-list" class="btn ok">목록</a></td>
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