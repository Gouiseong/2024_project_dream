<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jspf"%>



<%-- <form action="../member/doLogin" method="POST">
			<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
			<table class="login-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="아이디를 입력해주세요" name="loginId" />
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="비밀번호를 입력해주세요" name="loginPw" />
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<input class="btn btn-outline btn-info" type="submit" value="로그인" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>  --%>
<img class="
background_img" src="https://a-static.besthdwallpaper.com/night-sky-moon-scenery-wallpaper-1920x1080-99588_48.jpg"
	alt="" />
<div class="login-page">
	<div class="form">
		<form class="login-form" autocomplete="off" action="../member/doLogin" method="post">
			<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
			<input type="text" placeholder="아이디" name="loginId" />
			<input type="password" placeholder="비밀번호" name="loginPw" />
			<button class="login_btn" type="submit">로그인</button>
			<p class="message">
				<a href="#">비밀번호 찾기</a>
			</p>
			<p class="message">
				<a href="#">회원가입</a>
			</p>
			<div class="easy_login">
				<div>
					<a href="">애플 아이디로 로그인</a>
				</div>
				<div>
					<a href="">구글 아이디로 로그인</a>
				</div>
				<div>네이버 아이디로 로그인</div>
				<div>페이스북 아이디로 로그인</div>
			</div>
		</form>

		<form class="register-form" action="../member/doJoin" method="post">
			<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }" />
			<input type="text" placeholder="이름" name="name" />
			<input type="text" placeholder="아이디" name="loginId" />
			<button class="check_btn" onclick="checkDuplicate()">아이디 중복 확인</button>
			<input type="text" placeholder="이메일" name="email" />
			<input type="password" placeholder="비밀번호" name="loginPw" />
			<input type="password" placeholder="비밀번호 확인" name="loginPwCheck" />
			<input type="text" placeholder="전화번호" name="cellphoneNum" />
			<button class="join_btn">회원가입</button>
			<p class="message">
				<a href="#">로그인</a>
			</p>
		</form>

	</div>


	<script>
		$('.message a').click(function() {
			$('form').animate({
				height : "toggle",
				opacity : "toggle"
			}, "slow");
		});
	</script>

	<%@ include file="../common/foot.jspf"%>