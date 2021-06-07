<%@ page language="java" contentType="text/html; charset=UTF-8;"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.text.*"%>

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
	
	request.setCharacterEncoding("UTF-8");
	String orderTitle=(String) request.getParameter("orderTitle");

	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	DecimalFormat df = new DecimalFormat("###,###");
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	int i=1;
	String content=null;		// 상품명
	String thumImg=null;	// 썸네일 이미지 경로
	String title=null;
	float prog=0;			// 진행바 value 값
	int goal=0;			// 목표 금액
	int recent=0;			// 현재 금액
	int like=0;
	int contID=0;
	String detailImg=null;
	String userName=null;
	String userEmail=null;
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
    <link rel="stylesheet" href="./assets/css/order.css">
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
                <h1 class="title">상품정보</h1>
                <div class="pdtPicWrap">
                    <ul class="pdtPicList">
                    <%
                    try {
						conn = DatabaseUtil.getConnection();
						String sql = null;
						sql = "SELECT * FROM FUNDCONTENT WHERE FUNDTITLE=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, orderTitle);
						rs = pstmt.executeQuery();
						rs.next();
						
						goal=rs.getInt("goal");
						recent=rs.getInt("recent");
						prog = recent / goal*100;
						prog=Math.round(prog);
						
						for(i=1;i<=4;i++){
							
							title=rs.getString("fundTitle");
							contID=rs.getInt("contentID");
							content = rs.getString("fundContent"); // user 테이블에서 유저아이디를 가진 포인트 가져옴
							detailImg=rs.getString("detailImg"+i);
                    %>
                        <li><img src="<%=detailImg%>"></li>
                    <%
                    	}
						conn = DatabaseUtil.getConnection();
						sql = "SELECT * FROM USER WHERE ID=?";
						pstmt2 = conn.prepareStatement(sql);
						pstmt2.setString(1, userID);
						rs2 = pstmt2.executeQuery();
						rs2.next();
						
						int point=rs2.getInt("point");
                    %>
                    </ul>
                </div>
                <div class="pdfInfoWrap">
                    <ul>
                        <li><span>상품명 : </span><span><%=content%></span></li>
                        <li><span>현재 모금액 : </span><span><%=df.format(recent)%>원</span></li>
                        <li><span>목표 모금액 : </span><span><%=df.format(goal)%>원</span></li>
                    </ul>
                </div>
                <% 
                	sql="SELECT * FROM USER WHERE ID=?";
                	pstmt.clearParameters();
                	pstmt=conn.prepareStatement(sql);
                	pstmt.setString(1,userID);
					rs2 = pstmt2.executeQuery();
					rs2.next();
					userName=rs2.getString("Name");
					userEmail=rs2.getString("Email");
                %>
                <div class="inputUserInfo">
                    <h1 class="userInfoTitle">주문정보</h1>
                    <form action="./orderAction.jsp" method="POST">
	                    <li><span>이름</span><input type="text" maxlength="7" class="name" name="name" value="<%=userName%>" required/></li>
	                    <li><span>휴대폰 번호</span><input type="text" name="cellPhone" id="cellPhone" placeholder="'-' 제외하고 입력하세요." maxlength="13" class="phone" required/></li>
	                    <li><span>우편번호</span><input type="text" name="zip" readonly class="zipcode" required/><button type="button" onclick="openZipSearch()">검색</button></li>
	                    <li><span>도로명 주소</span><input required type="text" name="roadAdd" class="load" readonly /></li>
	                    <li><span>상세주소</span><input type="text" name="detailAdd" class="detail" required/></li>
	                    <li style="margin-top: 60px;"><span>현재 포인트 : </span><span><%=point%> P</span></li>        
	                    <li><span>사용 포인트 : </span><input type="number" class="paymoney" name="point" required/></li>
	                    <li><span>후원 금액 : </span><input type="number" class="paymoney" name="pay" required/></li>
	                    <input name="orderTitle" value="<%=orderTitle%>" type="hidden">
	                    <input name="orderContent" value="<%=content%>" type="hidden">
	                    <input name="email" value="<%=userEmail%>" type="hidden">
	                    <button type="submit" class="pay">결제</button>
                    </form>
                    <%
                    }
                    catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							if (conn != null)
								conn.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
						try {
							if (pstmt != null)
								pstmt.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
						try {
							if (rs != null)
								rs.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					}%>
                    <a href="./index.jsp" class="cancel">취소</a>
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
                    $('[name=roadAdd]').val(data.address);
                    $('[name=detailAdd]').val(data.buildingName);
                }
            }).open();
        }
        

		function pointPop(){
			popupX=(document.body.offsetWidth/2)-250;
			popupY=(document.body.offsetHeight/2)-150;
			
			window.open("./point.jsp", 'point', 'width=500, height=300, left='+popupX+',top='+popupY+',scrollbars=no, resizable=no'); 
			return false;
		}
		
		
    </script>

</body>

</html>