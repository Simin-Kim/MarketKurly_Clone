<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="./assets/css/order.css">
</head>

<body>
    <div id="wrap">
        <div class="headerWrap">
            <div class="header">
                <ul class="sectL">
                    <li class="logo"><a class="logoImg" href="./index.html"></a></li>
                    <li class="funding"><a href="./funding.html"><span>펀딩하기</span></a></li>
                    <li class="donate"><a href="./donate.html"><span>기부하기</span></a></li>
                </ul>
                <div class="sectR">
                    <div class="search"></div>
                    <ul class="user">
                        <li class="login"><a href="./login.html"><span>로그인</span></a></li>
                        <li class="signup"><a href="./signup.html"><span>회원가입</span></a></li>
                        <li class="register"><a href="./reqpj.html"><span>프로젝트 의뢰</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mainWrap">
            <div class="main">
                <h1 class="title">상품정보</h1>
                <div class="pdtPicWrap">
                    <ul class="pdtPicList">
                        <li><img src="./assets/img/coffee.jfif"></li>
                        <li><img src="./assets/img/coffee.jfif"></li>
                        <li><img src="./assets/img/coffee.jfif"></li>
                        <li><img src="./assets/img/coffee.jfif"></li>
                    </ul>
                </div>
                <div class="pdfInfoWrap">
                    <ul>
                        <li><span>상품명 : </span><span></span></li>
                        <li><span>현재 모금액 : </span><span></span></li>
                        <li><span>목표 모금액 : </span><span></span></li>
                    </ul>
                </div>
                <div class="inputUserInfo">
                    <h1 class="userInfoTitle">주문정보</h1>
                    <li><span>이름</span><input type="text" maxlength="7" class="name"></li>
                    <li><span>휴대폰 번호</span><input type="text" name="cellPhone" id="cellPhone"
                            placeholder="'-' 제외하고 입력하세요." maxlength="13" class="phone" /></li>
                    <li><span>우편번호</span><input type="text" name="zip" readonly class="zipcode"><button type="button"
                            onclick="openZipSearch()">검색</button>
                    </li>
                    <li><span>도로명 주소</span><input type="text" name="loadAdd" class="load" readonly></li>
                    <li><span>상세주소</span><input type="text" name="detailAdd" class="detail"></li>
                    <li style="margin-top: 60px;"><span>현재 포인트 : </span><span></span></li>
                    <li><span>결제 포인트 : </span><input type="number" class="paymoney"></li>
                    <button type="submit" class="pay">결제</button>
                    <a href="./index.html" class="cancel">취소</a>
                </div>
            </div>
        </div>
        <div class="footerwrap">
            <div class="footer">
                <div class="footerlogo"><img src="./assets/img/footerlogo.svg"></div>
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

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script>
        function autoHypenPhone(str) {
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if (str.length < 4) {
                return str;
            } else if (str.length < 7) {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            } else if (str.length < 11) {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            } else {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

        var cellPhone = document.getElementById('cellPhone');
        cellPhone.onkeyup = function (event) {
            event = event || window.event;
            var _val = this.value.trim();
            this.value = autoHypenPhone(_val);
        }


        function openZipSearch() {
            new daum.Postcode({
                oncomplete: function (data) {
                    $('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
                    $('[name=loadAdd]').val(data.address);
                    $('[name=detailAdd]').val(data.buildingName);
                }
            }).open();
        }
    </script>

</body>

</html>