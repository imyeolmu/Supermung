<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		/************* 페이징 ***************/
		var moveForm =$("#moveForm");
		$(".page-item a").on("click", function(e){
			e.preventDefault();
			
			moveForm.find("input[name='viewPage']").val($(this).attr("href"));
			moveForm.submit();
		});
		
		/************* 글 수정 **************/
		$(".goUpdate").on("click", function(e){
			e.preventDefault();
			
			moveForm.append("<input type='hidden' name='cateNum' value='"+
					$(this).attr("href")+"'>");
			moveForm.attr("action","category-update");
			moveForm.submit();
			
		});
		
		
		/************* 검색 ****************/
		var sf = $("#searchForm");
		
		$("#btn-search").on("click", function(e){
			if(!sf.find("input[name='keyWord']").val()){
				alert("키워드를 입력하세요!!");
				$("#keyWord").focus();
				return false;
			}
			
			sf.submit();
		});
	});
</script>

<!-- main 부분 여기여기 폼 부분 -->
<main class="board container w-100 p-5">
	<form action='category-list' method="get" id="moveForm">
		<input type="hidden" name="viewPage" value="${page.viewPage}"/>
		<input type="hidden" name="searchType" value="${cvo.searchType}"/>
		<input type="hidden" name="keyWord" value="${cvo.keyWord}"/>
	</form>
	<h4>카테고리 목록</h4>
	<!-- 검색창  -->
	<table class="table">
		<thead>
		<form id="searchForm" method="post" action='category-list'>
			<div class="search">
				<select name="searchType">
				<option
					<c:out value="${cvo.searchType == null ? 'selected':''}"/>>선택</option>
				<option value="N"
					<c:out value="${cvo.searchType == 'N' ? 'selected':''}"/>>카테고리이름</option>
				<option value="C"
					<c:out value="${cvo.searchType eq 'C' ? 'selected':''}"/>>카테고리코드</option>
				</select>
				<input class="board-search" type="text" name="keyWord" id="keyWord"
					placeholder="검색어를 입력하세요" value="${cvo.keyWord}"/> 
				<button id="btn-search" class="button board-search-button">검색</button>
			</div>
		</form>	
		
		<div><b>${page.viewPage}</b>/${page.totalPage}pages</div>
			<tr class="text-center">
				<th class="w60">NO</th>
				<th class="expand">카테고리 이름</th>
				<th class="w100">카테고리 코드</th>
				<th class="w60">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="cno" value="${page.startRowNum}"/>
			<c:forEach var="ctvo" items="${cateList}">
			<tr class="text-center">
				<td><a class="goUpdate" href="<c:url value='${ctvo.cateNum}'/>">${ctvo.cateNum}</a></td>
				<td>${ctvo.cateName}</td>
				<td>${ctvo.cateCode}</td>
				<td><input type="checkbox" name="del" value="${ctvo.cateNum}"></td>
			</tr>
			<c:set var="cno" value="${cno-1}"/>
			</c:forEach>
		</tbody>
	</table>
	<div class="notice-footer w-100">
		<div class="indexer align-right">
			<button class="bloc" type="button"
			id="btn-delete">삭제</button>
			<button class="write" id="btn-input">
				<a href="<c:url value='category-input'/>">등록</a>
			</button>
			
			
			<ul class="text-center pager">
				<li class="page-item ${page.prevPage <=0 ? 'disabled' : ''}">
					<a class="page-link" href="${page.prevPage}"><i class="lni lni-chevron-left"></i></a>
				</li>
				
				<c:forEach var="i" begin="${page.blockStart}" end="${page.blockEnd}">
				  <li class="page-item ${page.viewPage == i ? 'active':''}">
				  	<a class="page-link" href="${i}">${i}</a>
				  </li>
			  </c:forEach>
			  
				<li class="page-item ${page.blockEnd >= page.totalPage ? 'disabled': ''}">
					<a class="page-link" href="${page.nextPage}"><i class="lni lni-chevron-right"></i></a>
				</li>
			</ul>
		</div>
	</div>
	<form name ="updateForm" method="post">
		<input type="hidden" name="cateNum"/>
	</form>
</main>


<!------------------------------->
<%@ include file="../inc/footer.jsp"%>