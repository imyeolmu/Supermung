<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.supermm.model.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/admin-header.jsp"%>

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
				<th class="w40">포인트</th>
				<th class="w10">삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="dto" items="${list}">
			<tr class="text-center">
				<!-- 회원번호(primarykey) 클릭하면 수정페이지로 넘어가기 -->
				<td width="100"><nobr /><a href="member-info?no=${dto.no}"
					class="pro-hre">${dto.no}</a></td>
				<td width="100"><nobr />${dto.id}</td>
				<td width="100"><nobr />${dto.pw}</td>
				<td width="100"><nobr />${dto.name}</td>
				<td width="100"><nobr />${dto.age}</td>
				<td width="100"><nobr />${dto.gender}</td>
				<td width="100"><nobr />${dto.email}</td>
				<td width="100"><nobr />${dto.phone}</td>
				<td width="100"><nobr />${dto.zipCode}</td>
				<td width="100"><nobr />${dto.roadAddr}${dto.roadAddr}${dto.detailAddr}</td>
				<td width="100"><nobr />${dto.regDate}</td>
				<td width="100"><nobr /><a href="member-point?no=${dto.no}"
					class="pro-hre">${dto.point}</a></td>				
				<td><input type="checkbox" name="del" id="del"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
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