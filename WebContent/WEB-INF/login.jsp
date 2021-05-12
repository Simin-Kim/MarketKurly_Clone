<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESFY</title>
    <!-- ico -->
    <link rel="shortcut icon" href="./assets/img/logo.ico" type="image/x-icon">
    <!-- css -->
    <link rel="stylesheet" href="./assets/css/common.css">
    <link rel="stylesheet" href="./assets/css/font.css">
    <link rel="stylesheet" href="./assets/css/login.css">
    <link rel="stylesheet" href="./assets/css/headerFooter.css" />
</head>

<body>
    <div id="wrap">
        <div class="headerSect">
            <div class="headerWrap">
                <div class="header">
                    <ul>
                        <li class="linkLogin"><a href="./login.jsp">로그인</a></li>
                        <li class="linkSign"><a href="./signUp.jsp">회원가입</a></li>
                        <li class="linkAS"><a href="./cart.jsp">장바구니</a></li>
                    </ul>
                </div>
                <div class="headerLogo"><a href="./index.jsp"><img src="./assets/img/logo.svg" alt=""></a></div>
                <div class="gnbWrap">
                    <ul class="gnb">
                        <li class="veget">
                            <a href="./veggie.jsp">
                                <img src="./assets/img/vegetable.svg" alt="">
                                <span class="txt">채소</span>
                            </a>
                        </li>
                        <li class="fruit">
                            <a href="./fruit.jsp">
                                <img src="./assets/img/fruit.svg" alt="">
                                <span class="txt">과일 · 견과 · 쌀</span>
                            </a>
                        </li>
                        <li class="seafood">
                            <a href="./seafood.jsp">
                                <img src="./assets/img/seafood.svg" alt="">
                                <span class="txt">수산 · 해산물</span>
                            </a>
                        </li>
                        <li class="meat">
                            <a href="./meat.jsp">
                                <img src="./assets/img/meat.svg" alt="">
                                <span class="txt">정육 · 계란</span>
                            </a>
                        </li>
                        <li class="spices">
                            <a href="./spices.jsp">
                                <img src="./assets/img/spices.svg" alt="">
                                <span class="txt">면 · 양념 · 오일</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mainWrap">
            <div class="main">
                <form action="./loginAction.jsp" method="POST" id="loginForm">
                    <h3 class="loginTitle">로그인</h3>
                    <div class="loginBox">
                        <input class="id" type="text" name="id" value maxlength="16" required="" placeholder="아이디를 입력해주세요"
                            label="아이디">
                        <input class="pw" type="password" name="password" required="" fld_esssential="" option="regPass"
                            label="비밀번호" maxlength="16" class="reg_pw bad" placeholder="비밀번호를 입력해주세요"
                            aria-autocomplete="list">
                    </div>
                    <div class="finder">
                        <a href='./idFind.jsp'><span class="id_finder">아이디 찾기</span></a>
                        <span class="bar"></span>
                        <a href='./pwFind.jsp'><span class="pw_finder">비밀번호 찾기</span></a>
                    </div>
                    <div id="formSubmit" class="loginBtnWrap">
                        <button type="submit" class="loginBtn">로그인</button>
                    </div>
                </form>
                <a href="./signUp.jsp" class="signBtn"><span>회원가입</span></a>
            </div>
        </div>
        <div class="footerWrap">
            <div class="footer">
                <div class="company">
                    <a href="./index.jsp"><img src="./assets/img/logo.svg"></a>
                    <span class="address">레스피 | 대표 : 강현욱, 김시민, 이동혁<br>주소 : 충청북도 청주시 서원구 충대로 1
                        <br>사업자 등록번호 : 456-78-1234
                        <br>통신판매업 : 2021-충북청주-0123
                    </span>
                </div>
                <div class="sc">
                    <h2 class="titSc">고객센터</h2>
                    <span class="scNum">1588-8282</span>
                    <span class="scTime">오전 9시 ~ 오후 5시</span>
                </div>
            </div>
            <p class="right">
                (C) KURLY CORP. All Product Images & Recipes RIGHTS RESERVED<br>
            </p>
        </div>
    </div>

    <script src="./assets/js/goods.js"></script>
    <script>
    </script>

</body>

</html>