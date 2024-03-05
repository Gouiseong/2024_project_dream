<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>




<section class="mt-8 text-xl px-4">
	<div class="mx-auto overflow-x-auto search-container">
		<!-- <div class="mb-4 flex"> -->
		<!-- <div class="badge badge-outline">${articlesCount }개</div> -->
		<!-- <div class="flex-grow"></div> -->
		<form action="../article/list?boardId=${board.id }&page=1">
			<div>
				<input type="hidden" name="boardId" value="${param.boardId }" />
				<div class="a">
					<select data-value="${param.searchKeywordTypeCode }" class=" select select-bordered select-sm w-full max-w-xs"
						name="searchKeywordTypeCode">
						<option value="title">제목</option>
						<option value="body">내용</option>
						<option value="title,body">제목+내용</option>
					</select>
				</div>
				<br>

				<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="검색어를 입력하세요...">
				<button class="btn btn-ghost btn-sm" type="submit">검색</button>
			</div>
		</form>

	</div>

	<div>
		<div class="board">

			<ul class="board-list">
				<li class="board-item">
					<a href="../article/list?boardId=1&page=1">전체 글 보기</a>
				</li>
				<li class="board-item">
					<a href="../article/list?boardId=2&page=1">자유 게시판</a>
				</li>
				<li class="board-item">
					<a href="../article/list?boardId=3&page=1">꿈 게시판</a>
				</li>
				<li class="board-item">
					<a href="../article/list?boardId=3&page=1">꿈 지식</a>
				</li>

				<!-- 필요한 만큼 게시판 목록을 추가하세요 -->
			</ul>
		</div>
	</div>
	<div class="container">

		<div class="center">
			<!-- 게시글들 -->
			<a href="">
				<span class="write">글쓰기</span>
				<c:if test="${rq.isLogined() }">
					<li>
						<a class="hover:underline" href="../article/write">글 쓰기</a>
					</li>
				</c:if>
			</a>
			<table class="article_write">
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 50%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th>제목</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>추천수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="article" items="${articles }">

						<tr class="hover article_table">
							<td>꿈 게시판</td>
							<td>
								<a href="detail?id=${article.id }">${article.title }
									<c:if test="${article.extra__repliesCnt > 0 }">
										<span style="color: red;">[${article.extra__repliesCnt }]</span>
									</c:if>
								</a>
							</td>
							<td>${article.regDate.substring(0,10) }</td>
							<td>${article.extra__writer }</td>
							<td>${article.hitCount }</td>
							<td>${article.goodReactionPoint }</td>

						</tr>
					</c:forEach>
					<!-- 추가적인 게시글 -->
				</tbody>
			</table>
		</div>
		<div class="right">
			<!-- 로그인 버튼 -->

			<ul class="flex">

				<c:if test="${!rq.isLogined() }">
					<a class="hover:underline" href="../member/login">
						<li id="login-btn">로그인</li>
					</a>
				</c:if>
				<span>
					<c:if test="${!rq.isLogined() }">
						<li>
							<a class="hover:underline" href="#">비밀번호 찾기</a>
						</li>
					</c:if>
				</span>
				<span>
					<c:if test="${!rq.isLogined() }">
						<li>
							<a class="hover:underline" href="../member/join">회원가입</a>
						</li>
					</c:if>
				</span>
			</ul>
			<ul class="flex">

				<c:if test="${rq.isLogined() }">
					<a class="hover:underline" href="../member/login">
						<li id="login-btn">마이페이지</li>
					</a>

					<li>
						<a onclick="if(confirm('로그아웃 할래?') == false) return false;" class="hover:underline" href="../member/doLogout">로그아웃</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>

	<!-- 	동적 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
		<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />
		<c:set var="baseUri" value="?boardId=${boardId }" />
		<c:set var="baseUri" value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
		<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />

		<c:if test="${startPage > 1 }">
			<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
			<button class="btn btn-sm btn-disabled">...</button>
		</c:if>

		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
		</c:forEach>

		<c:if test="${endPage < pagesCount }">
			<button class="btn btn-sm btn-disabled">...</button>
			<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
		</c:if>

	</div>

	<!-- 	원래 페이징 -->
	<div class="pagination flex justify-center mt-3">
		<div class="btn-group">
			<c:forEach begin="1" end="${pagesCount }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="?page=${i }&boardId=${param.boardId}">${i }</a>
			</c:forEach>
		</div>
	</div>

</section>


<%@ include file="../common/foot.jspf"%>