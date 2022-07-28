<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>

<!-- Start Account Login Area -->
<div class="admin-input section">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form action="<c:url value='category-update'/>" class="card input-form rounded " method="post">
					<input type="hidden" name="viewPage" value="${viewPage}"/>
					<input type="hidden" name="keyWord" value="${cvo.keyWord}"/>
					<input type="hidden" name="searchType" value="${cvo.searchType}"/>
					<div class="title">
						<h4 class="mb-5">카테고리 수정</h4>
						<p>
							<span>카테고리 코드</span>
							<!-- db 데이터 값 적어서 불러오기 -->
							<input class="w-50  cinput" type="text"
							id="cateCode" name="cateCode" value="${update.cateCode}" >
						</p>
						<p>
							<span>카테고리 이름</span> <input class="w-50  cinput" type="text"
								name="cateName" id="cateName" value="${update.cateName}">
						</p>
						
					</div>
					<div class="inputdiv">
						<input type="submit" class="btn ok" value="수정" />
						 <input	type="reset" class="btn reset" value="취소" /> <a
							href="javascript:history.back()" class="btn golist">목록</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- End Account Login Area -->

<%@ include file="../inc/footer.jsp"%>