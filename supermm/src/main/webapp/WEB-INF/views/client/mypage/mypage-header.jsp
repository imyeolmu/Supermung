<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${myinfo}" var="myinfo" />
<section class="statistics mt-4">
	<div class="row">
		<div class="col-lg-4">
			<div class="box d-flex rounded-2 align-items-center p-3">
				<div class="ms-3">
					<div class="d-flex align-items-center">
						<i class="lni lni-user fs-2 text-center"></i>
						<h3 class="mb-0">${member.id}</h3>
						<span class="d-block ms-2">님</span>
					</div>
					<a class="fs-normal mt-2 mb-0 ms-3" href="client-mypage">내정보</a>
					<a class="fs-normal mt-2 mb-0 ms-3" href="client-delete">탈퇴</a><br/>
					<a class="fs-normal mt-2 mb-0 ms-3" href="client-history">구매내역</a><br/>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div
				class="box d-flex rounded-2 align-items-center mb-4 mb-lg-0 p-3">
				<div class="ms-3">
					<div class="d-flex align-items-center">
						<i class="lni lni-circle-plus fs-2 text-center"></i>
						<h3 class="mb-0"><fmt:formatNumber value="${member.money}"
									pattern="#,##0" /></h3>
						<span class="d-block ms-2">원</span>
					</div>
					<a class="fs-normal mt-2 mb-0 ms-3" href="client-money">금액충전</a><br/>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div
				class="box d-flex rounded-2 align-items-center mb-4 mb-lg-0 p-3">
				<div class="ms-3">
					<div class="d-flex align-items-center">
						<i class="lni lni-coin fs-2 text-center"></i>
						<h3 class="mb-0"><fmt:formatNumber value="${member.mpoint}"
									pattern="#,##0" /></h3>
						<span class="d-block ms-2">P</span>
					</div>
					<a class="fs-normal mt-2 mb-0 ms-3" href="client-point">내포인트</a><br/>
				</div>
			</div>
		</div>
	</div>
</section>