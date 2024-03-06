<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYPAGE"></c:set>
<%@ include file="../common/head.jspf"%>

<div>${loginedMember }</div>
<div>${loginedMember.loginId }</div>
<div>${rq.loginedMember }</div>
<div>${rq.loginedMember.loginId }</div>
<div>${rq.loginedMember.getLoginId() }</div>
<section class="mt-8 text-xl px-4 ">
	<%-- <div class="">
		<table class="table-box-1 " border="1">
			<colgroup>
				<col width="200" />
			</colgroup>

			<tbody>
				<tr>
					<th>가입일</th>
					<td>${loginedMember.regDate }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${loginedMember.loginId }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${loginedMember.name }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${loginedMember.nickname }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${loginedMember.cellphoneNum }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${loginedMember.email }</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<a href="../member/checkPw" class="btn btn-active btn-ghost">회원정보 수정</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div> --%>

	<section class="hero">
		<div class="content">
			<img class="my-picture" src="https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_960_720.png"
				alt="This is a picture of me">
			<div class="info">
				<p class="iama">이름</p>
				<p class="my-name my-info">${loginedMember.name}</p>
				<p class="iama">이메일</p>
				<p class="my-info">${loginedMember.email}</p>
				<p class="iama">전화번호</p>
				<p class="my-info">${loginedMember.cellphoneNum}</p>
				<p class="iama">생년월일</p>
				<p class="my-info">${loginedMember.email}</p>
			</div>

		</div>
		<div class="">
			<button>비밀번호 변경</button>
			<button>정보 수정</button>
			<button>계정 삭제</button>
		</div>
	</section>
	<div class="btns">
		<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>


	</div>
</section>



<%@ include file="../common/foot.jspf"%>