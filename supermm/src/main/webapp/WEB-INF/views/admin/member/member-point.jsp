<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/admin-header.jsp"%>

<div class="admin-input section">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card input-form rounded shadow-sm" action="member-point?mnum=${minfo.mnum}" method="post">
				<h4 class="mb-5">회원포인트 충전</h4>
					<table class="container table table-borderless">
						<c:set value="${minfo.mnum}" var="mpinfo" />
							<tbody>
								<tr>
									<td>NO</td>
									<td>${minfo.id}</td>
								</tr>
								<tr>
									<td>아이디</td>
									<td>${minfo.id}</td>
								</tr>
								<tr>
									<td>회원명</td>
									<td>${minfo.name}</td>
								</tr>
								<tr>
									<td>회원포인트</td>
									<td><fmt:formatNumber value="${minfo.mpoint}"
										pattern="#,##0" />P</td>
								</tr>
								<tr>
									<td>포인트충전</td>
									<td><input class="w-50  cinput" type="number" name ="mpoint" required></td>
								</tr>
							</tbody>
					</table>
					<div class="inputdiv">
						<input type="submit" class="btn ok" id="update_btn" value="수정"/>
						<input type="reset" class="btn reset" value="취소" />
						<a href="member-list" class="btn golist" id="list_btn">목록</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- End Account Login Area -->

<%@ include file="../inc/footer.jsp"%>