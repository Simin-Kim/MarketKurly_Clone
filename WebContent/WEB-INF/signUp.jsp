<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RESFY</title>
    <!-- ico -->
    <link rel="shortcut icon" href="./assets/img/logo.ico" type="image/x-icon" />
    <!-- css -->
    <link rel="stylesheet" href="./assets/css/common.css" />
    <link rel="stylesheet" href="./assets/css/font.css" />
    <link rel="stylesheet" href="./assets/css/signUp.css" />
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
                <div class="headerLogo">
                    <a href="./index.jsp"><img src="./assets/img/logo.svg" alt="" /></a>
                </div>
                <div class="gnbWrap">
                    <ul class="gnb">
                        <li class="veget">
                            <a href="./veggie.jsp">
                                <img src="./assets/img/vegetable.svg" alt="" />
                                <span class="txt">채소</span>
                            </a>
                        </li>
                        <li class="fruit">
                            <a href="./fruit.jsp">
                                <img src="./assets/img/fruit.svg" alt="" />
                                <span class="txt">과일 · 견과 · 쌀</span>
                            </a>
                        </li>
                        <li class="seafood">
                            <a href="./seafood.jsp">
                                <img src="./assets/img/seafood.svg" alt="" />
                                <span class="txt">수산 · 해산물</span>
                            </a>
                        </li>
                        <li class="meat">
                            <a href="./meat.jsp">
                                <img src="./assets/img/meat.svg" alt="" />
                                <span class="txt">정육 · 계란</span>
                            </a>
                        </li>
                        <li class="spices">
                            <a href="./spices.jsp">
                                <img src="./assets/img/spices.svg" alt="" />
                                <span class="txt">면 · 양념 · 오일</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mainWrap">
            <div class="main">
                <a class="back_to_top">
                    <i class="top_icon"></i>
                </a>
                <h3 class="signTitle">회원가입</h3>
                <form action="./signUpAction.jsp" method="POST" id="signUpForm">
                    <table class="signBox">
                        <tbody>
                            <tr>
                                <th>아이디</th>
                                <td>
                                    <input class="id" type="text" name="id" maxlength="16" required=""
                                        placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" label="아이디"/>
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td>
                                    <input class="pw" type="password" name="password" required="" value
                                        label="비밀번호" maxlength="16" class="reg_pw bad"
                                        placeholder="8자 이상의 영문과 숫자를 조합" />
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호 확인</th>
                                <td>
                                    <input class="pwcheck" type="password" name="passwordCheck" required="" value
                                    label="비밀번호" maxlength="16" class="confirm_pw" 
                                    placeholder="비밀번호를 한번 더 입력해주세요" />
                                </td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>
                                    <input class="name" type="text" name="name" value="" required=""
                                        label="이름" placeholder="이름을 입력해주세요" />
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <input class="email" type="email" name="email"required=""
                                        label="이메일" placeholder="이메일을 입력해주세요" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                	<div id="formSubmit" class="regBtnWrap">
                    	<button type="button" class="regBtn" onclick="reg();">가입하기</button>
                	</div>
                </form>
            </div>
        </div>
        <div class="footerWrap">
            <div class="footer">
                <div class="company">
                    <a href="./index.jsp"><img src="./assets/img/logo.svg" /></a>
                    <span class="address">레스피 | 대표 : 강현욱, 김시민, 이동혁<br />주소 : 충청북도
                        청주시 서원구 충대로 1 <br />사업자 등록번호 : 456-78-1234
                        <br />통신판매업 : 2021-충북청주-0123
                    </span>
                </div>
                <div class="sc">
                    <h2 class="titSc">고객센터</h2>
                    <span class="scNum">1588-8282</span>
                    <span class="scTime">오전 9시 ~ 오후 5시</span>
                </div>
            </div>
            <p class="right">
                (C) KURLY CORP. All Product Images & Recipes RIGHTS RESERVED<br />
            </p>
        </div>
    </div>
</body>

<script src="./assets/js/goods.js"></script>
<script>

function reg() {
    let pw = document.querySelector(".pw");
    const pw_vali = /^(?=.*[a-zA-Z])(?=.*\d).{8,15}$/; // 영+숫 8자 이상

    if (pw_vali.test(pw.value)) {
        let pwCheck = document.querySelector(".pwcheck");
        if (pw.value == pwCheck.value) {
            const signUpForm = document.querySelector("#signUpForm");
            signUpForm.submit();
        }
        else {
            alert("비밀번호가 일치하지 않습니다.");
        }
    }
    else {
        alert("비밀번호를 조건에 맞게 다시 입력해주세요.");
    }
}

</script>

</html>