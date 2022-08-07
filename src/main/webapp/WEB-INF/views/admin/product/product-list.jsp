<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/admin-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.activePage {
	background-color: rgba(171, 147, 201, 0.1);
	
}
</style>

<script type="text/javascript">
	//페이징
	$(".notice-page a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/product-list");
		moveForm.submit();
	});
</script>

<main class="board container w-100 p-5">
	<h4>상품 목록</h4>
	<!-- 검색창  -->
	<table class="table">
		<thead>
		<form id="searchForm" method="post" action='product-list'>
         <div class="search">
            <select name="searchType">
				<option
					<c:out value="${pageMake.cri.searchType == null ? 'selected':''}"/>>선택</option>
				<option value="N"
					<c:out value="${pageMake.cri.searchType == 'N' ? 'selected':''}"/>>상품명</option>
				<option value="G"
					<c:out value="${pageMake.cri.searchType eq 'C' ? 'selected':''}"/>>상품 카테고리</option>
            </select>
            <input class="board-search" type="text" name="keyWord" id="keyWord"
               placeholder="검색어를 입력하세요" value="${cri.keyWord}"/> 
            <button id="btn-search" class="button board-search-button">검색</button>
         </div>
         </form>
			<tr class="text-center">
				<th style="width:10%">NO</th>
				<th style="width:10%">카테고리</th>
				<th style="width:25%">상품명</th>
				<th style="width:10%">이미지</th>
				<th style="width:10%">브랜드</th>
				<th style="width:10%">사양</th>
				<th style="width:7%">수량</th>
				<th style="width:10%">가격</th>
				<!-- <th class="w50">상품소개</th> -->
				<th style="width:10%">적립포인트</th>
				<th style="width:10%;">
					<input type="checkbox" id="allCheck" name="allCheck"/>
					<label for="allCheck">삭제</label>
					<script>
		     		$(function(){
		    			var chkObj = document.getElementsByName("RowCheck");
		    			var rowCnt = chkObj.length;
		    			
		    			$("input[name='allCheck']").click(function(){
		    				var chk_listArr = $("input[name='RowCheck']");
		    				for (var i=0; i<chk_listArr.length; i++){
		    					chk_listArr[i].checked = this.checked;
		    				}
		    			});
		    			$("input[name='RowCheck']").click(function(){
		    				if($("input[name='RowCheck']:checked").length == rowCnt){
		    					$("input[name='allCheck']")[0].checked = true;
		    				}
		    				else{
		    					$("input[name='allCheck']")[0].checked = false;
		    				}
		    			});
		    		});
		             </script>
				</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr class="text-center">
				<!-- 상품번호(primarykey) 클릭하면 수정페이지로 넘어가기 -->
				<td><a href="product-update" class="pro-hre"><c:out value="${list.pnum}"/></a></td>
				<td width="100"><nobr /><c:out value="${list.pcategory_fk1}"/></td>
				<td width="100"><a href="product-update" class="pro-hre"><nobr /><c:out value="${list.pname}"/></a></td>
				<!-- 이미지 주소 불러오기 -->
				<td width="100"><nobr /><img src="<c:out value='${list.pimage}'/>"/></td>
				<td width="100"><nobr /><c:out value="${list.pcompany}"/></td>
				<td width="100"><nobr /><c:out value="${list.pspec}"/></td>
				<!-- 숫자 포맷 변경 -->
				<td width="100"><nobr /><fmt:formatNumber value="${list.pqty}" pattern="#,##0"/></td>
				<td width="100" ><nobr /><fmt:formatNumber value="${list.price}" pattern="#,##0"/></td>
				<td width="100"><fmt:formatNumber value="${list.ppoint}" pattern="#,##0"/></td>
				<!-- <td width="100"><nobr />소개</td> -->
				<td class="checkbox" width="100"><nobr /><input type="checkbox" name="RowCheck" value="${list.pnum}"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="notice-footer w-100">
		<div class="indexer align-right">
		<span>${pageMake.cri.pageNum}/${pageMake.realEnd} pages</span>
			<ul id="pageInfo" class="notice-page pager">
				<!-- 맨앞으로 버튼 -->
				<c:if test="${pageMake.prev}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.realStart}&amount=5"><i class="lni lni-angle-double-left"></i></a></li>
				</c:if>
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMake.prev}">
					<li class="prev pageInfo_btn"><a href="?pageNum=${pageMake.startPage-1}&amount=5"><i class="lni lni-chevron-left"></i></a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMake.startPage}" end="${pageMake.endPage}">
					 <li class="pageInfo_btn ${pageMake.cri.pageNum == num ? 'activePage':'' }"><a href="?pageNum=${num}&amount=5">${num}</a></li>
				</c:forEach>
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.endPage+1}&amount=5"><i class="lni lni-chevron-right"></i></a></li>
				</c:if>
				<!-- 맨끝으로 버튼 -->
				<c:if test="${pageMake.next}">
					<li class="next pageInfo_btn"><a href="?pageNum=${pageMake.realEnd}&amount=5"><i class="lni lni-angle-double-right"></i></a></li>
				</c:if>
			</ul>
			 <input class="bloc" type="button" value="삭제" onclick="deleteValue();">
			  <script>
	         function deleteValue(){
	 			var url = "/product-delete";    // Controller로 보내고자 하는 URL
	 			var valueArr = new Array();
	 		    var list = $("input[name='RowCheck']");
	 		    for(var i = 0; i < list.length; i++){
	 		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장
	 		            valueArr.push(list[i].value);
	 		        }
	 		    }
	 		    if (valueArr.length == 0){
	 		    	alert("선택된 상품이 없습니다.");
	 		    }
	 		    else{
	 				var chk = confirm("선택한 상품을 삭제하시겠습니까?");				 
	 				$.ajax({
	 				    url : url,                    // 전송 URL
	 				    type : 'POST',                // GET or POST 방식
	 				    traditional : true,
	 				    data : {
	 				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
	 				    },
	 	                success: function(jdata){
	 	                    if(jdata = 1) {
	 	                        alert("삭제 되었습니다.");
	 	                        location.replace("/product-list")
	 	                    }
	 	                    else{
	 	                        alert("다시 시도해주세요.");
	 	                    }
	 	                }
	 				});
	 			}
	 		}
	         </script>
			<button class="write">
				<a href="product-input">등록</a>
			</button>
			 <form action='product-list' method="get" id="moveForm">
				<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMake.cri.amount}">
				<input type="hidden" name="keyWord" value="${pageMake.cri.keyWord}">
				<input type="hidden" name="searchType" value="${pageMake.cri.searchType}">
		   </form>
		</div>
	</div>
</main>

<%@ include file="../inc/footer.jsp"%>