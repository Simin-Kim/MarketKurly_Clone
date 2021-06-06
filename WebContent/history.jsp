<%@page import="java.io.PrintWriter"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.text.*"%>

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
    <link rel="stylesheet" href="./assets/css/history.css">
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
						<li class="register"><a href="./reqpj.jsp"><span>프로젝트 의뢰</span></a></li>
						<li><a href="./logout.jsp"><span>로그아웃</span></a></li>
					</ul>
				</div>
			</div>
        </div>
        <div class="mainWrap">
			<div class="main">
				<div class="orderHead">
					<span class="txt">후원 내역</span>
				</div>
				<div class="orderWrap">
					<table class="orderTable">
						<thead>
							<tr>
								<th class="type">후원 종류</th>
								<th class="img">상품 이미지</th>
								<th class="title">상품명</th>
								<th class="goal">목표 모금액</th>
								<th class="recent">현재 모금액</th>
								<th class="pay">내 모금액</th>
								<th class="progress">현황</th>
							</tr>
						</thead>
						<%
							// Cart 테이블 연동용
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							// Products 테이블 연동용
							PreparedStatement pstmt2 = null;
							ResultSet rs2 = null;
							DecimalFormat df = new DecimalFormat("###,###");

							String content=null;
							int point = 0;
							
							String type=null;
							String thumImg=null;
							int goal=0;
							int recent=0;

							try {
								conn = DatabaseUtil.getConnection();
								String sql = "SELECT * FROM OVERVIEW WHERE UserID=?"; // Cart 테이블 연동용
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, userID);
								rs = pstmt.executeQuery();

								while (rs.next()) { // Cart 테이블에 담긴 데이터 안나올때까지 반복

									content = rs.getString("content"); // Cart 테이블에서 유저아이디를 가진 상품번호 가져옴
									point=rs.getInt("point");

									String sql2 = "SELECT * FROM FUNDCONTENT WHERE FUNDCONTENT=?"; // Products 테이블 연동용
									pstmt2 = conn.prepareStatement(sql2);
									pstmt2.setString(1, content); // 가져온 상품번호로 Products 테이블 연동
									rs2 = pstmt2.executeQuery();

									rs2.next();
									type=rs2.getString("type");
									thumImg=rs2.getString("thumImg");
									goal=rs2.getInt("goal");
									recent=rs2.getInt("recent");
									
						%>
						<tbody>
							<tr>
								<td class="type"><span><%=type%></span></td>
								<td class="img"><img src="<%=thumImg%>"></td>
								<td class="title"><span><%=content%></span></td>
								<td class="goal"><span><%=df.format(goal)%>원</span></td>
								<td class="recent"><span><%=df.format(recent)%>원</span></td>
								<td class="pay"><span><%=df.format(point)%></span></td>
								<td class="progress"><%if(goal<=recent){%><span>모금 완료</span><%}else{ %><span>진행 중</span><% }%></td>
							</tr>
						</tbody>
						<%
							}
						%>
					</table>
					<%
						} catch (Exception e) {
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
						}
					%>
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