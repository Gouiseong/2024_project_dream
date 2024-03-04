<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>
<section class="home_section">
	<div class="aa">
		<div class="menu-bar">
			<ul>
				<li>
					<a href="../article/list?boardId=1&page=1"">글 보러가기</a>
				</li>
				<li>
					<a href="../paint/painting">그림 그리기</a>
				</li>
				<li>
					<a href="#">ai그림 가져오기</a>
				</li>

				<!-- 필요한 만큼 메뉴 항목을 추가하세요 -->
			</ul>
		</div>
	</div>


</section>
<div class="img">
	<div class="menu-bar">
		<ul>
			<li>
				<a href="../article/list?boardId=1&page=1">
					<img class="moons_img" src="https://fly.storage.tigris.dev/pai-images/f4d16d6590dc4ab4a00765f71ae8fe7f.jpeg" alt="">
					<span class="img_text">글 보러가기</span>
				</a>
			</li>
			<li>
				<a href="../paint/painting">
					<img src="https://fly.storage.tigris.dev/pai-images/5ac9f174ae264c9286c468ca6ebcf10c.jpeg" alt="귀여운고양이" />
					<span class="img_text">그림 그리기</span>
				</a>
			</li>
			<li>
				<a href="#">ai그림 가져오기</a>
			</li>

			<!-- 필요한 만큼 메뉴 항목을 추가하세요 -->
		</ul>
	</div>
	<img class="moons_img" src="https://fly.storage.tigris.dev/pai-images/f4d16d6590dc4ab4a00765f71ae8fe7f.jpeg"
		alt="눈감고있는 소녀">

	<img src="https://fly.storage.tigris.dev/pai-images/75dd8f778e7447b38813bf823d08a2bc.jpeg" alt="눈 뜬 고양이" />
	<img src="https://fly.storage.tigris.dev/pai-images/0c015f25590246878c51916a1931a5bb.jpeg" alt="책읽는 강아지" />
	<img src="https://fly.storage.tigris.dev/pai-images/2374d939ee014eeeb3b8db767d0f91ba.jpeg" alt="책읽는 강아지 애니" />
	<img src="https://fly.storage.tigris.dev/pai-images/9dff66ac5d10418793018daac8fe5634.jpeg" alt="잠자는 고양이" />
</div>
<%@ include file="../common/foot.jspf"%>