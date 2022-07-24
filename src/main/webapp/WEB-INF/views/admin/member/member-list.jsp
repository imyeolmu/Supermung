<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/admin-header.jsp"%>

<!-- main 부분 여기여기 폼 부분 -->
<main class="board container w-100 p-5">
	<h4>회원 목록</h4>
	<!-- 검색창  -->
	<table class="table">
		<thead>
			<div class="search">
				<select>
					<option value="name">회원명</option>
					<option value="birthday">생년월일</option>
					<option value="gender">성별</option>
					<option value="addr">주소</option>
					<option value="regdate">가입일</option>
				</select> <input class="board-search" type="text" name="q" value=""
					placeholder="검색어를 입력하세요" /> <input
					class="button board-search-button" type="submit" value="검색" />
			</div>
			<tr class="text-center">
				<th class="w10">NO</th>
				<th class="expand">아이디</th>
				<th class="w30">비밀번호</th>
				<th class="expand">이름</th>
				<th class="w30">생년월일</th>
				<th class="w10">성별</th>
				<th class="w60">이메일</th>
				<th class="w60">전화번호</th>
				<th class="w30">우편번호</th>
				<th class="w60">주소</th>
				<th class="w40">가입일</th>
				<th class="w10">삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-center">
				<!-- 회원번호(primarykey) 클릭하면 수정페이지로 넘어가기 -->
				<td width="100"><nobr /><a href="member-update"
					class="pro-hre">1</a></td>
				<td width="100"><nobr />user</td>
				<td width="100"><nobr />password</td>
				<td width="100"><nobr />이름</td>
				<td width="100"><nobr />생년월일</td>
				<td width="100"><nobr />여</td>
				<td width="100"><nobr />user@google.com</td>
				<td width="100"><nobr />010-1234-1234</td>
				<td width="100"><nobr />우편번호</td>
				<td width="100"><nobr />도로명(지번) 상세주소</td>
				<td width="100"><nobr />2022-07-21</td>
				<td><input type="checkbox" name="del" id="del"></td>
			</tr>
		</tbody>
	</table>
	</div>
	<div class="notice-footer w-100">
		<div class="indexer align-right">
			<p class="notice-page">
				<span>1</span> / 1 pages
			</p>
			<button class="bloc" type="submit">삭제</button>
			<!-- <button class="write"><a href="reg.html">포인트</a></button> -->
			<ul class="text-center pager">
				<button class="prev" onclick="alert('이전 페이지가 없습니다.');">
					<i class="lni lni-chevron-left"></i>
				</button>
				<li><a class="-text- orange bold" href="?p=1&t=&q=">1</a></li>
				<button class="next" onclick="alert('다음 페이지가 없습니다.');">
					<i class="lni lni-chevron-right"></i>
				</button>
			</ul>
		</div>
	</div>
</main>

<%@ include file="../inc/footer.jsp"%>