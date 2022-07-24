<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./inc/admin-header.jsp"%>

<!-- Start Account Register Area -->
<div class="account-login section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<div class="register-form">
					<div class="title">
						<h3>관리자 정보 변경</h3>
					</div>
					<form class="row" method="post">
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-fn">이름</label> <input class="form-control"
									type="text" id="reg-fn" required>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-ID">ID</label> <input class="form-control"
									type="text" id="reg-ln" required>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg ">비밀번호</label> <input class="form-control"
									type="password" id="reg-pass" required>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-pass-confirm">비밀번호 확인</label> <input
									class="form-control" type="password" id="reg-pass-confirm"
									required>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-pass">전화번호</label> <input class="form-control"
									type="tel" id="telInput" required
									placeholder="예) 010-1234-5678">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-pass">이메일</label> <input class="form-control"
									type="email" id="reg-email" required
									placeholder="1234@daum.net">
							</div>
						</div>
						<div class="button">
							<button class="btn" type="submit">변경 완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Account Register Area -->

<%@ include file="./inc/footer.jsp"%>