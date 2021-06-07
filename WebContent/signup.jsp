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
    <link rel="stylesheet" href="./assets/css/signup.css">
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
                    <ul class="visitant">
                        <li class="login"><a href="./login.jsp"><span>로그인</span></a></li>
                        <li class="signup"><a href="./signup.jsp"><span>회원가입</span></a></li>
                        <li class="register"><a href="./reqpj.jsp"><span>프로젝트 의뢰</span></a></li>
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
                                        placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" label="아이디" />
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td>
                                    <input class="pw" type="password" name="password" required="" value label="비밀번호"
                                        maxlength="16" class="reg_pw bad" placeholder="8자 이상의 영문과 숫자를 조합" />
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
                                    <input class="name" type="text" name="name" value="" required="" label="이름"
                                        placeholder="이름을 입력해주세요" />
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>
                                    <input class="email" type="email" name="email" required="" label="이메일"
                                        placeholder="이메일을 입력해주세요" />
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