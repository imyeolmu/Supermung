
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>

<%@ include file="../inc/client-header.jsp"%>

<main class="admin-input board container w-75 p-5">
	<h4 class="text-center mb-3">봉사활동 게시판</h4>
	<form id="detailForm" class="input-form" style="border:none"
		action="<c:url value='client-board-update?bno=${list.bno}'/>" method="post">
		<table class="table">
			<tbody>
				<tr>
					<td colspan="12">
						<div class="content">
							<span class="m-2 fw-bold">번호</span> 
							<input class="w-20" value="${list.bno}" style="border:none; margin-left:20px" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						<div class="content d-flex">
							<span class="m-2 fw-bold">제목</span>
							<input class="w-20"
								type="text" name="btitle" value="${list.btitle}" style="border:none; margin-left:20px" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						<div class="content d-flex">
							<span class="m-2 fw-bold">작성자</span>
							<input class="w-20" type="text" name="bwriter_id" value="${list.bwriter_id}" readonly="readonly" style="border:none; margin-left:10px"/>
							<span class="m-2 fw-bold">조회수</span>
							<input class="w-20" type="text" name="bhit" value="${list.bhit}" readonly="readonly" style="border:none; margin-left:10px"/>
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="12"><textarea class="w-100" rows="20"
							name="bcontent" id="notice_textarea" style="border: none; padding:10px" readonly>${list.bcontent}</textarea>
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
	 <c:if test="${member != null}">
	 <c:if test="${member.id == list.bwriter_id}">
		<div class="text-center ">
			<div class="text-center inputdiv">
				<a class="btn ok"  href="/client-board-update?bno=${list.bno}" >수정</a>
				<a href="<c:url value='/client-board-delete?bno=${list.bno}'/>" onClick="alert('삭제하시겠습니까?')"class="btn reset" >삭제</a>
				<a href="/client-board-list" class="btn golist">목록</a>
			</div>
		</div>
	 	</c:if> 
	 	</c:if> 
	</form>
	<form id="infoForm" action="/client-board-update" method="get">
		<input type="hidden" id="bno" value='<c:out value="${list.bno}"/>'>
	</form>
</main>




<%@ include file="../inc/footer.jsp"%>