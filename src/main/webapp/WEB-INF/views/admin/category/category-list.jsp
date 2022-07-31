<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>
<script src="Scripts/jquery-1.6.4.js"></script>
<script type="text/javascript">
	$(".notice-page a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/category-list");
		moveForm.submit();
	});

//천 단위 콤마 및 소수점 자르기
	function NumberWithCommas(double, decimalPointCipher) {
	    var parts = double.toString().split(".");
	    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    parts[1] = parts[1].substr(0, decimalPointCipher);
	    if (decimalPointCipher < 1) {
	        return parts[0];
	    }
	    else {
	        return parts.join(".");
	    }
	}
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
    
</script>     

<!-- main 부분 여기여기 폼 부분 -->
<main class="board container w-100 p-5">
   <form action='category-list' method="get" id="moveForm">
      <input type="hidden" name="pageNum" value="${cri.pageNum}"/>
      <input type="hidden" name="searchType" value="${cri.searchType}"/>
      <input type="hidden" name="keyWord" value="${cri.keyWord}"/>
   </form>
   <h4>카테고리 목록</h4>
   <!-- 검색창  -->
   <table class="table">
      <thead>
      <form id="searchForm" method="post" action='category-list'>
         <div class="search">
            <select name="searchType">
            <option
               <c:out value="${cri.searchType == null ? 'selected':''}"/>>선택</option>
            <option value="N"
               <c:out value="${cri.searchType == 'N' ? 'selected':''}"/>>카테고리이름</option>
            <option value="C"
               <c:out value="${cri.searchType eq 'C' ? 'selected':''}"/>>카테고리코드</option>
            </select>
            <input class="board-search" type="text" name="keyWord" id="keyWord"
               placeholder="검색어를 입력하세요" value="${cri.keyWord}"/> 
            <button id="btn-search" class="button board-search-button">검색</button>
         </div>
      </form>   
      
      <div><b>${cri.pageNum}</b>/${cri.amount}pages</div>
         <tr class="text-center">
            <th class="w60">NO</th>
            <th class="expand">카테고리 이름</th>
            <th class="w100">카테고리 코드</th>
            <th class="w60"><input type="checkbox" id="allCheck"
             name="allCheck" style="margin-left: 38px; margin-right: 10px;"/><label for="allCheck">삭제</label>
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
         <c:set var="cno" value="${pageMake.startPage}"/>
         <c:forEach var="ctvo" items="${cateList}">
         <tr class="text-center">
            <td><a class="goUpdate" href="<c:url value='category-update?cateNum=${ctvo.cateNum}'/>"><c:out value="${ctvo.cateNum}"/></a></td>
            <td>${ctvo.cateName}</td>
            <td>${ctvo.cateCode}</td>
            <td class="checkbox"><input type="checkbox" name="RowCheck" value="${ctvo.cateNum}"/></td>
         </tr>
         <c:set var="cno" value="${cno-1}"/>
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
	 			var url = "/category-delete";    // Controller로 보내고자 하는 URL
	 			var valueArr = new Array();
	 		    var list = $("input[name='RowCheck']");
	 		    for(var i = 0; i < list.length; i++){
	 		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장
	 		            valueArr.push(list[i].value);
	 		        }
	 		    }
	 		    if (valueArr.length == 0){
	 		    	alert("선택된 글이 없습니다.");
	 		    }
	 		    else{
	 				var chk = confirm("선택한 항목을 삭제하시겠습니까?");				 
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
	 	                        location.replace("/category-list")
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
            <a href="<c:url value='category-input'/>">등록</a>
         </button>
      </div>
   </div>
   <form id="moveForm" method="get">
      <input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
      <input type="hidden" name="amount" value="${pageMake.cri.amount}">
   </form>
</main>



<!------------------------------->
<%@ include file="../inc/footer.jsp"%>