<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>

<%@ include file="../inc/admin-header.jsp"%>

<main class="admin-input board container w-75 p-5">
	<h4 class="text-center mb-3">공지사항</h4>
	<form id="detailForm" class="input-form" style="border:none"
		action="<c:url value='notice-update?nno=${list.nno}'/>" method="post">
		<table class="table">
			<tbody>
				<tr>
					<td colspan="12">
						<div class="content">
							<span class="m-2 fw-bold">번호</span> 
							<input class="w-20" value="${list.nno}" style="border:none; margin-left:20px" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						<div class="content d-flex">
							<span class="m-2 fw-bold">제목</span>
							<input class="w-20"
								type="text" name="ntitle" value="${list.ntitle}" style="border:none; margin-left:20px" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						<div class="content d-flex">
							<span class="m-2 fw-bold">작성자</span>
							<input class="w-20" type="text" name="nwriter_id" value="${list.nwriter_id}" readonly="readonly" style="border:none; margin-left:10px"/>
							<span class="m-2 fw-bold">조회수</span>
							<input class="w-20" type="text" name="nwriter_id" value="${list.nhit}" readonly="readonly" style="border:none; margin-left:10px"/>
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="12"><textarea class="w-100" rows="20"
							name="ncontent" id="notice_textarea" style="border: none; padding:10px" readonly>${list.ncontent}</textarea>
					</td>
				</tr>
				<!-- <script>
					CKEDITOR.replace('notice_textarea');
					 CKEDITOR.editorConfig = function(config){
		                  config.enterMode = CKEDITOR.ENTER_BR;
		               };
				</script>
 -->
			</tbody>
		</table>
		<div class="text-center ">
			<div class="text-center inputdiv">
				<a class="btn ok"  href="notice-update?nno=${list.nno}">수정</a>
				<a href="<c:url value='/notice-delete?nno=${list.nno}'/>" class="btn reset">삭제</a>
				<a href="notice-list" class="btn ok">목록</a>
			</div>
		</div>
	</form>
	<form id="infoForm" action="/notice-update" method="get">
		<input type="hidden" id="nno" value='<c:out value="${list.nno}"/>'>
	</form>
</main>




<%@ include file="../inc/footer.jsp"%>