<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>

<!-- Start Category Input Area -->
<div class="admin-input section">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card input-form rounded shadow-sm" method="post">
					<div class="title">
						<h4 class="mb-5">카테고리 등록</h4>
						<p>
							<span>카테고리 코드</span> <input class="w-50 cinput" type="text"
								name="">
						</p>
						<p>
							<span>카테고리 이름</span> <input class="w-50 cinput" type="text"
								name="">
						</p>
					</div>
					<div class="inputdiv">
						<input type="submit" class="btn ok" value="등록" /> <input
							type="reset" class="btn reset" value="취소" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- End Account Login Area -->

<%@ include file="../inc/footer.jsp"%>