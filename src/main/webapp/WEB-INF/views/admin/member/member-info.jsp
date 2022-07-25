<%@page import="com.supermm.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/admin-header.jsp"%>

<div class="admin-input section">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card input-form rounded shadow-sm" action="member-list"
					method="post">
					<h4 class="mb-5">회원정보</h4>
					<table class="container table table-borderless">
						<c:forEach var="dto" items="${list}">
							<tbody>
								<tr>
									<td>NO</td>
									<td>${dto.no}</td>
								</tr>
								<tr>
									<td>아이디</td>
									<td>${dto.id}</td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>${dto.pw}</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>${dto.name}</td>
								</tr>
								<tr>
									<td>나이</td>
									<td>${dto.age}</td>
								</tr>
								<tr>
									<td>성별</td>
									<td>${dto.gender}</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>${dto.email}</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td>${dto.phone}</td>
								</tr>
								<tr>
									<td>우편번호</td>
									<td>${dto.zipCode}</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>${dto.roadAddr}${dto.roadAddr}${dto.detailAddr}</td>
								</tr>
								<tr>
									<td>가입일</td>
									<td>${dto.regDate}</td>
								</tr>
								<tr>
									<td><a class="member-point" href="member-point?no=${dto.no}">회원포인트</a></td>
									<td>${dto.point}</td>
								</tr>
								<tr>
									<td colspan="2" class="text-center inputdiv"><a
										href="member-list" class="btn ok">목록</a></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- End Account Login Area -->

<%@ include file="../inc/footer.jsp"%>