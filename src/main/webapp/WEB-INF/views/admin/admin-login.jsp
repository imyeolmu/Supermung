<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./inc/admin-header.jsp"%>

<!-- Start Account Login Area -->
<div class="admin-input section">
	<div class="account-login container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card login-form" method="post">
					<div class="card-body">
						<div class="title">
							<h5 class="text-center">관리자 로그인</h5>
						</div>
						<div class="form-group input-group">
							<label for="reg-fn">아이디</label> <input class="form-control"
								type="text" id="reg-ID" required>
						</div>
						<div class="form-group input-group">
							<label for="reg-fn">비밀번호</label> <input class="form-control"
								type="password" id="reg-pass" required>
						</div>
						<div class="button">
							<button class="btn" type="submit">로그인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- End Account Login Area -->

<%@ include file="./inc/footer.jsp"%>
