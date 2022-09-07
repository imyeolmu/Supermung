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


<%@ include file="../inc/client-header.jsp"%>

<!--메인  -->
<main class="board-detail container w-50 p-4">
	<h5 class="mb-3">봉사게시판</h5>
	<form id="registerForm" action="<c:url value='client-board-register'/>"	method="post">
		<table class="table">
			<tbody>

				<tr>
					<th>제목</th>
					<td><input class= "w-120" type="text" name="btitle"/></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td><input class="w-120" type="text" name="bwriter_id"/>
				</td>
				</tr>
				<tr>
					<td colspan="12">
						
							<textarea class = "w-100" rows="20" name="bcontent" id="notice_textarea"
								 ></textarea>

						
					</td>
				</tr>
			<!-- 	<script>
					CKEDITOR.replace('notice_textarea');
					 CKEDITOR.editorConfig = function(config){
		                  config.enterMode = CKEDITOR.ENTER_BR;
		               };
				</script> -->
		               
			</tbody>
		</table>
		<div class="one-menu w-100 ">
			<div class="inputdiv">
				<input type="submit" class="two-menu" value="등록"  onClick="alert('등록하시겠습니까?')"/>
				<button class="three-menu" type="button">
					<a href="client-board-list"> 목록</a>
				</button>
			</div>

		</div>
	</form>
</main>



<%@ include file="../inc/footer.jsp"%>