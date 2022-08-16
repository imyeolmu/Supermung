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
				<form class="card input-form rounded shadow-sm"
					action="<c:url value='member-list'/>" method="post">
					<h4 class="mb-5">회원정보</h4>
					<table class="container table table-borderless">
						<tbody>
							<c:set value="${minfo}" var="minfo" />
							<tr>
								<td>NO</td>
								<td>${minfo.mnum}</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>${minfo.id}</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>${minfo.pw}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${minfo.name}</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${minfo.birth}</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>${minfo.gender}</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${minfo.email}</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${minfo.phone}</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>${minfo.addr1}</td>
							<tr>
								<td>주소</td>
								<td>${minfo.addr2},${minfo.addr3}</td>
							</tr>
							<tr>
								<td>가입일</td>
								<td><fmt:formatDate value="${minfo.regdate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>충전금액</td>
								<td><fmt:formatNumber value="${minfo.money}"
										pattern="#,##0" />P</td>
							</tr>
							<tr>
								<td><a class="member-point" href="member-point?mnum=${minfo.mnum}" onClick="alert('수정하시겠습니까?')">회원포인트</a></td>
								<td><fmt:formatNumber value="${minfo.mpoint}"
										pattern="#,##0" />P</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center inputdiv">
								<a href="member-list" class="btn ok">목록</a></td>
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