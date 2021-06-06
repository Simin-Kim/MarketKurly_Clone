<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
    <link rel="stylesheet" href="./assets/css/reqdone.css">
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
					<div class="searchWrap">
	                	<form class="searchForm" action="./search.jsp" method="POST">
	                		<i class="searchIcon"></i>
	                		<input class="searchKey" type="text" placeholder="검색어를 입력하세요." name="search">
                			<button class="searchBtn" type="submit">검색</button>
	                	</form>
                	</div>
                    <ul class="user">
                        <li class="login"><a href="./history.jsp"><span>펀딩/기부내역</span></a></li>
						<li class="signup"><a class="logoImg" onclick="pointPop();"><span>포인트 충전</span></a></li>
						<li class="register"><a href="./reqpj.jsp"><span>프로젝트
									의뢰</span></a></li>
						<li><a href="./logout.jsp"><span>로그아웃</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mainWrap">
            <div class="main">
                <h1 class="reqtitle">프로젝트 의뢰가 완료되었습니다.</h1>
                <img class="reqimg" src="./assets/img/reqdone.svg">
                <a href="./index.jsp">홈으로</a>
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

	
	<script>
		function pointPop(){
			popupX=(document.body.offsetWidth/2)-250;
			popupY=(document.body.offsetHeight/2)-150;
			
			window.open("./point.jsp", 'point', 'width=500, height=300, left='+popupX+',top='+popupY+',scrollbars=no, resizable=no'); 
			return false;
		}
	</script>
</body>

</html>