<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/client-header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>


<main class="admin-input board container w-75 p-5">
	<h4 class="text-center mb-3">공지사항</h4>
	<form id=detailForm class="input-form" style="border:none">
		<table class="table">
			<tbody>
				<tr>
					<td colspan="12">
						<div class="content">
							<span class="m-2 fw-bold">번호</span> 
							<input class="w-20" value="${pageInfo.nno}" style="border:none; margin-left:20px" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						<div class="content d-flex">
							<span class="m-2 fw-bold">제목</span>
							<input class="w-20" type="text" name="ntitle" value="${pageInfo.ntitle}" style="border:none; margin-left:20px" readonly/>
							<span class="m-2 fw-bold">작성일</span>
							<input class="w-20" type="text" name="ntitle" value="<fmt:formatDate pattern="yyyy-MM-dd"
                     value="${pageInfo.nregdate}" />" style="border:none; margin-left:20px" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="12">
						<div class="content d-flex">
							<span class="m-2 fw-bold">작성자</span>
							<input class="w-20" type="text" name="nwriter_id" value="${pageInfo.nwriter_id}" readonly="readonly" style="border:none; margin-left:10px"/>
							<span class="m-2 fw-bold">조회수</span>
							<input class="w-20" type="text" name="nwriter_id" value="${pageInfo.nhit}" readonly="readonly" style="border:none; margin-left:10px"/>
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="12"><textarea class="w-100" rows="20"
							name="ncontent" id="notice_textarea" style="border: none; padding:10px" readonly>${pageInfo.ncontent}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="text-center ">
			<div class="text-center inputdiv">
				<a href="client-notice-list" class="btn ok">목록</a>
			</div>
		</div>
	</form>
	<form id="infoForm" method="get">
	      <input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
	      <input type="hidden" name="amount" value="${pageMake.cri.amount}">
	      <input type="hidden" name="amount" value="${pageMake.cri.keyWord}">
	      <input type="hidden" name="nno" value="${pageInfo.nno}">
   </form>

</main>



  <%@ include file="../inc/footer.jsp"%>