<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- <script src="//cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script> -->


<%@ include file="../inc/admin-header.jsp"%>
<main class="admin-input board container w-75 p-5">
	<h4 class="text-center mb-3">공지사항</h4>
	<form id="registerForm" class="input-form" style="border:none" action="<c:url value='notice-register'/>"
		method="post">
		<table class="table">
			<tbody>
				<tr>
					<td colspan="12">
						<div class="content d-flex">
							<span class="m-2 fw-bold">제목</span>
							<input class="w-20"
								type="text" name="ntitle" style="border:none; margin-left:20px"/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						<div class="content d-flex">
							<span class="m-2 fw-bold">작성자</span> <input class="w-20"
								type="text" name="nwriter_id" value="${member.id}" readonly style="border:none; margin-left:10px"/>
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="12"><textarea class="w-100" rows="20"
							name="ncontent" id="notice_textarea" style="border: none; padding:10px"></textarea>
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

		<div class="text-center inputdiv">
			<input type="submit" class="btn ok" value="등록" />
			<input type="reset" class="btn reset" value="취소" /></td>
			<input type="button" class="btn golist" onclick="javascript:history.back()" value="뒤로" /></td>
		</div>
	</form>
</main>

<%@ include file="../inc/footer.jsp"%>