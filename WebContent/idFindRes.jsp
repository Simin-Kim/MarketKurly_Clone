<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fun&Do</title>
<!-- ico -->
<link rel="shortcut icon" href="./assets/img/logo.ico"
	type="image/x-icon">
<!-- css -->
<link rel="stylesheet" href="./assets/css/common.css">
<link rel="stylesheet" href="./assets/css/font.css">
<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/footer.css">
<link rel="stylesheet" href="./assets/css/findRes.css">

</head>

<body>
	<div id="wrap">
		<div class="headerSect">
			<div class="headerWrap">
		  		<div class="header">
              	  <ul class="sectL">
                    <li class="logo"><a class="logoImg" href="./index.jsp"></a></li>
                    <li class="funding"><a href="./funding.jsp"><span>펀딩하기</span></a></li>
                    <li class="donate"><a href="./donate.jsp"><span>기부하기</span></a></li>
              	  </ul>
               	 <div class="sectR">
                    <div class="searchWrap">
	                	<form class="searchForm" action="./search.jsp" method="POST">
	                		<i class="searchIcon"></i>
	                		<input class="searchKey" type="text" placeholder="검색어를 입력하세요." name="search">
                			<button class="searchBtn" type="submit">검색</button>
	                	</form>
                	</div>
                    <ul class="visitant">
                        <li class="login"><a href="./login.jsp"><span>로그인</span></a></li>
                        <li class="signup"><a href="./signup.jsp"><span>회원가입</span></a></li>
                        <li class="register"><a href="./reqpj.jsp"><span>프로젝트 의뢰</span></a></li>
                  	  </ul>
               	 </div>
            	</div>
			</div>
		</div>
		<div class="mainWrap">
			<div class="main">
				<h3 class="loginTitle">아이디 찾기</h3>
				<div class="loginBox">
					<%
						if ((String) session.getAttribute("id") != null) {
					%>
					<img src="./assets/img/findTImg.svg" class="idImg"> <span
						class="idTxt">아이디 : <%=(String) session.getAttribute("id")%></span>
					<%
						} else {
					%>
					<img src="./assets/img/findFImg.svg" class="warnImg"> <span
						class="warnTxt">존재하지 않는 정보입니다.<br>다시 시도해주세요.
					</span>
					<%
						}
					%>
				</div>
				<%
					if ((String) session.getAttribute("id") != null) {
				%>
				<a href="./login.jsp">
					<div id="formSubmit" class="findBtnWrap">
						<button type="button" class="findBtn">로그인</button>
					</div>
				</a>
				<%
					} else {
				%>
				<a href="./idfind.jsp">
					<div id="formSubmit" class="findBtnWrap">
						<button type="button" class="findBtn">아이디 다시 찾기</button>
					</div>
				</a>
				<%
					} session.invalidate(); 
				%>
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