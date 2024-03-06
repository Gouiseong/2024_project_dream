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
				<c:if test="${rq.isLogined() }">
					<li class="board-item" onclick="../member/">
						<a href="../article/list?boardId=3&page=1">내 일지</a>
					</li>
				</c:if>

				<!-- 필요한 만큼 게시판 목록을 추가하세요 -->
			</ul>
		</div>
	</div>
	<div class="container">

		<div class="center">
			<!-- 게시글들 -->
			<a href="">

				<c:if test="${rq.isLogined() }">

					<a class="hover:underline" href="../article/write">
						<span class="write">글쓰기</span>
					</a>

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

			<ul class="flex login-btn-container">
			
				<c:if test="${!rq.isLogined() }">
					<a class="hover:underline" href="../member/login">
						<li id="login-btn">로그인</li>
					</a>
				</c:if>
			</ul>
			<ul class="flex">

				<c:if test="${rq.isLogined() }">
					<a class="hover:underline" href="../member/myPage">
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

<div class="slideshow-container">
	<!-- 슬라이드 1 -->
	<div class="slide">
		<img src="https://fly.storage.tigris.dev/pai-images/f9664893160c4c57a2bdc9796946edad.jpeg" alt="Slide 1">
	</div>
	<!-- 슬라이드 2 -->
	<div class="slide">
		<img src="https://fly.storage.tigris.dev/pai-images/bbaabf6914ee44d49ee02ed2c6f93c5f.jpeg" alt="Slide 2">
	</div>
	<!-- 슬라이드 3 -->
	<div class="slide">
		<img src="https://fly.storage.tigris.dev/pai-images/6f339e1be2d94c57a75bd55c05dc41fc.jpeg" alt="Slide 3">
	</div>
	<!-- 이전, 다음 버튼 -->
	<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	<a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>

<!-- JavaScript 코드 -->
<script>
    let slideIndex = 0;
    showSlides();

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function showSlides() {
        let slides = document.getElementsByClassName("slide");
        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlides, 3000); // 4초마다 자동으로 슬라이드 전환
    }
</script>
<%@ include file="../common/foot.jspf"%>