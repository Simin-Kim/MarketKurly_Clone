<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="User.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome" />
<meta name="viewport"
	content="width=device-width, initial-scale=1,shrink-to-fit=no">
<title>FUNDO</title>
<!-- css -->
<link rel="stylesheet" href="./assets/css/common.css">
<link rel="stylesheet" href="./assets/css/font.css">
<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/footer.css">
<link rel="stylesheet" href="./assets/css/index.css">
</head>

<body>
	<div id="wrap">
		<div class="headerWrap">
			<div class="header">
				<ul class="sectL">
					<li class="logo"><a class="logoImg" href="./index.jsp"></a></li>
					<li class="funding"><a href="./funding.jsp"><span>펀딩하기</span></a></li>
					<li class="donate"><a href="./donate.jsp"><span>기부하기</span></a></li>

				</ul>
				<div class="sectR">
					<div class="search"></div>
					<ul class="user">
						<%
							if ((String) session.getAttribute("id") != null) {
						%>
						<li class="login"><a href="./history.jsp"><span>펀딩/기부내역</span></a></li>
						<li class="signup"><a class="logoImg" href="./point.jsp"
							onclick="window.open(this.href, 'point', 'width=500,height=300,toolbars=no,scrollbars=no'); return false;"><span>포인트
									충전</span></a></li>
						<li class="register"><a href="./reqpj.jsp"><span>프로젝트
									의뢰</span></a></li>
						<li><a href="./logout.jsp"><span>로그아웃</span></a></li>
						<%
							} else {
						%>
						<li class="login"><a href="./login.jsp"><span>로그인</span></a></li>
						<li class="signup"><a href="./signup.jsp"><span>회원가입
							</span></a></li>
						<li class="register"><a href="./reqpj.jsp"><span>프로젝트
									의뢰</span></a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
		<div class="bannerwrap">
			<div class="banner">
				<div class="typed_wrap">
					<h1>
						We Give You <span class="typed"></span>
					</h1>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="fundingwrap">
				<h1 class="title">TOP3 펀딩상품</h1>
				<ul class="funding">
					<li><img class="fundingImg" src="./assets/img/coffee.jfif">
						<div class="fundingText" href="">
							<span class="fundingTitle">종이필터없이 커피 만들기, 스테인레스 커피필터</span> <span
								class="fundingPer">100%</span></a>
						</div>
						<div class="progress">
							<progress value="100" max=100></progress>
						</div>
						<div class="btn">
							<button class="fundingBtn">펀딩하기</button>
							<button class="likeBtn">좋아요</button>
						</div></li>
					<li><img class="fundingImg" src="./assets/img/coffee.jfif">
						<div class="fundingText" href="">
							<span class="fundingTitle">종이필터없이 커피 만들기, 스테인레스 커피필터</span> <span
								class="fundingPer">100%</span></a>
						</div>
						<div class="progress">
							<progress value="100" max=100></progress>
						</div>
						<div class="btn">
							<button class="fundingBtn">펀딩하기</button>
							<button class="likeBtn">좋아요</button>
						</div></li>
					<li><img class="fundingImg" src="./assets/img/coffee.jfif">
						<div class="fundingText" href="">
							<span class="fundingTitle">종이필터없이 커피 만들기, 스테인레스 커피필터</span> <span
								class="fundingPer">100%</span></a>
						</div>
						<div class="progress">
							<progress value="100" max=100></progress>
						</div>
						<div class="btn">
							<button class="fundingBtn">펀딩하기</button>
							<button class="likeBtn">좋아요</button>
						</div></li>
				</ul>
			</div>
			<div class="donatewrap">
				<h1 class="title">TOP3 기부상품</h1>
				<ul class="donate">
					<li><img class="donateImg" src="./assets/img/coffee.jfif">
						<div class="donateText" href="">
							<span class="donateTitle">종이필터없이 커피 만들기, 스테인레스 커피필터</span> <span
								class="donatePer">100%</span>
						</div>
						<div class="progress">
							<progress value="100" max=100></progress>
						</div>
						<div class="btn">
							<button class="donateBtn">기부하기</button>
							<button class="likeBtn">좋아요</button>
						</div></li>
					<li><img class="donateImg" src="./assets/img/coffee.jfif">
						<div class="donateText" href="">
							<span class="donateTitle">종이필터없이 커피 만들기, 스테인레스 커피필터</span> <span
								class="donatePer">100%</span></a>
						</div>
						<div class="progress">
							<progress value="100" max=100></progress>
						</div>
						<div class="btn">
							<button class="donateBtn">기부하기</button>
							<button class="likeBtn">좋아요</button>
						</div></li>
					<li><img class="donateImg" src="./assets/img/coffee.jfif">
						<div class="donateText" href="">
							<span class="donateTitle">종이필터없이 커피 만들기, 스테인레스 커피필터</span> <span
								class="donatePer">100%</span>
						</div>
						<div class="progress">
							<progress value="100" max=100></progress>
						</div>
						<div class="btn">
							<button class="donateBtn">기부하기</button>
							<button class="likeBtn">좋아요</button>
						</div></li>
				</ul>
			</div>
		</div>
		<div class="footerwrap">
			<div class="footer">
				<div class="footerlogo">
					<img src="./assets/img/footerlogo.svg" alt="">
				</div>
				<div class="footerinfo">
					<span class="company"> FUN&DO | 대표 : 강현욱, 김시민, 이동혁<br>
						주소 : 충청북도 청주시 서원구 충대로 1<br> 사업자 등록번호 : 456-78-1234<br>
					</span> <span class="call">고객센터 : 2021-8282 오전 9시 ~ 오후 5시</span>
				</div>
			</div>
			<p class="cpright">Copyright 2021 FUN&DO And Wadiz Co., Ltd all
				rights reserved.</p>
		</div>
	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
	<script src="./assets/js/index.js"></script>
</body>

</html>