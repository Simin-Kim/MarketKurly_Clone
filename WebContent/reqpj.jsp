<%@page import="java.io.PrintWriter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%
	if (session.getAttribute("id") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스입니다.');");
		script.println("location.href='./login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

	String userID = (String) session.getAttribute("id");
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FUN&DO</title>
    <!-- css -->
    <link rel="stylesheet" href="./assets/css/common.css">
    <link rel="stylesheet" href="./assets/css/font.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/footer.css">
    <link rel="stylesheet" href="./assets/css/reqpj.css">
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
        <div class="mainWrap">
            <div class="main">
                <a class="funding" href="./reqfun.jsp"><span class="text">펀딩</span></a>
                <a class="donate" href="./reqdo.jsp"><span class="text">기부</span></a>
            </div>
        </div>
        <div class="footerwrap">
            <div class="footer">
                <div class="footerlogo"><img src="./assets/img/footerlogo.svg" alt=""></div>
                <div class="footerinfo">
                    <span class="company">
                        FUN&DO | 대표 : 강현욱, 김시민, 이동혁<br>
                        주소 : 충청북도 청주시 서원구 충대로 1<br>
                        사업자 등록번호 : 456-78-1234<br>
                    </span>
                    <span class="call">고객센터 : 2021-8282 오전 9시 ~ 오후 5시</span>
                </div>
            </div>
            <p class="cpright">Copyright 2021 FUN&DO And Wadiz Co., Ltd all rights reserved.</p>
        </div>
    </div>

</body>

</html>