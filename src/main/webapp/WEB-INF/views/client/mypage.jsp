<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="./inc/client-header.jsp"%>
<div class="admin-input section">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card input-form rounded shadow-sm"
					action="<c:url value='member-list'/>" method="post">
					<h4 class="mb-5">회원정보</h4>
					<table class="container table table-borderless">
						<tbody>
							<c:set value="${myinfo}" var="myinfo" />
							<tr>
								<td>NO</td>
								<td>${myinfo.mnum}</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>${myinfo.id}</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>${myinfo.pw}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${myinfo.name}</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><fmt:formatDate value="${myinfo.birth}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>성별</td>
								<td>${myinfo.gender}</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${myinfo.email}</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${myinfo.phone}</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>${myinfo.zipcode}</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>${myinfo.addr1}(${myinfo.addr2}),${myinfo.addr3}</td>
							</tr>
							<tr>
								<td>가입일</td>
								<td><fmt:formatDate value="${myinfo.regdate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>포인트</td>
								<td><fmt:formatNumber value="${myinfo.mpoint}"
										pattern="#,##0" />P</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center inputdiv">
								<input type="reset" class="btn golist mt-3" value="탈퇴" />
								<input type="submit" class="btn ok mt-3" id="update_btn" value="수정"/>
								<input type="reset" class="btn reset mt-3" value="취소" />
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="./inc/footer.jsp"%>