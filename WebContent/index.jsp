<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="product.productDAO"%>
<%@ page import="product.productDTO"%>
<%@ page import="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	productDAO pdctDAO = new productDAO();
	pdctDAO.setRestDay();
	
	productDTO[][] funding = new productDTO[6][8];


%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
					<div class="searchWrap">
	                	<form class="searchForm" action="./search.jsp" method="POST">
	                		<i class="searchIcon"></i>
	                		<input class="searchKey" type="text" placeholder="검색어를 입력하세요." name="search">
                			<button class="searchBtn" type="submit">검색</button>
	                	</form>
                	</div>
					<%
						if ((String) session.getAttribute("id") != null) {
					%>
					<ul class="user">
						<li class="login"><a href="./history.jsp"><span>펀딩/기부내역</span></a></li>
						<li class="signup"><a class="logoImg" onclick="pointPop();"><span>포인트 충전</span></a></li>
						<li class="register"><a href="./reqpj.jsp"><span>프로젝트 의뢰</span></a></li>
						<li><a href="./logout.jsp"><span>로그아웃</span></a></li>
					</ul>
						<%
							} else {
						%>
					<ul class="visitant">
						<li class="login"><a href="./login.jsp"><span>로그인</span></a></li>
						<li class="signup"><a href="./signup.jsp"><span>회원가입</span></a></li>
						<li class="register"><a href="./reqpj.jsp"><span>프로젝트 의뢰</span></a></li>
					</ul>
						<%
							}
						%>
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
		<div class="mainWrap">
			<div class="main fundingWrap">
				<h1 class="title">추천 펀딩상품</h1>
				<ul class="contentList">
				<%
					// User 테이블 연동용
					Connection conn = null;
					conn = DatabaseUtil.getConnection();
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					ResultSet rs2 = null;
					DecimalFormat df = new DecimalFormat("###,###");
					String sql = null;
					
					String content=null;		// 상품명
					String thumImg=null;	// 썸네일 이미지 경로
					String title=null;
					float prog=0;			// 진행바 value 값
					float goal=0;			// 목표 금액
					float recent=0;			// 현재 금액
					int progInt=0;
					int goalInt=0;
					int recentInt=0;
					int like=0;
					int contID=0;
					String likeTitle=null;
					String endDate=null;
					int curDate=0;
					int restDate=0;
					int investor=0;
					int i;
					
					sql = "SELECT * FROM fundcontent WHERE type=? ORDER BY likeCount DESC"; // user 테이블 연동용
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "펀딩");
					rs = pstmt.executeQuery(); 
							
					for(i=0;i<3;i++){
						rs.next();
						title=rs.getString("fundTitle");
						contID=rs.getInt("contentID");
						content = rs.getString("fundContent"); // user 테이블에서 유저아이디를 가진 포인트 가져옴
						thumImg=rs.getString("thumImg");
						goal=rs.getInt("goal");
						recent=rs.getInt("recent");
						goalInt=(int)goal;
						recentInt=(int)recent;
						prog = recent / goal*100;
						progInt=(int)prog;
						restDate=rs.getInt("restDate");
						like=rs.getInt("likeCount");
						investor=rs.getInt("investor");
						prog=Math.round(prog);
				%>
					<li>
						<img class="contentImg" src="<%=thumImg%>">
						<div class="contentText">
							<span class="contentTitle"><%=content%></span>
							<div class="contentInfo">
								<span class="contentPer"><%=progInt%>%<span class="nowMoney"><%=df.format(recentInt)%>원</span></span>
								<span class="restDate"><%=restDate %>일 남음</span>
							</div>
						</div>
						<div class="progress">
							<progress value="<%=prog%>" max=100></progress>
						</div>
						<div class="likeInvest">
							<span class="like"><%=like%></span>
							<span class="investor"><%=investor%>명 참여</span>
						</div>
						<div class="btn">
							<form class="orderForm" action="./order.jsp" method="POST">
								<input type="hidden" name="orderTitle" value="<%=title%>">
								<button type="submit" class="orderBtn">펀딩하기</button>
							</form>
							<form class="likeForm" action="./like.jsp" method="POST">
								<input type="hidden" name="likeTitle" value="<%=title%>">
								<button class="likeBtn" type="submit">좋아요</button>
							</form>
						</div>
					</li>
				<%  }
						rs.close();
					%>
				</ul>
			</div>
			<div class="main donateWrap">
				<h1 class="title">추천 기부상품</h1>
				<ul class="contentList">
				<%
					try {
							sql = "SELECT * FROM fundcontent WHERE type=? ORDER BY likeCount DESC"; // user 테이블 연동용
							pstmt.clearParameters();
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, "기부");
							
							rs = pstmt.executeQuery(); 
							
							for(i=1;i<=3;i++){
								rs.next();
								
								title=rs.getString("fundTitle");
								contID=rs.getInt("contentID");
								content = rs.getString("fundContent"); // user 테이블에서 유저아이디를 가진 포인트 가져옴
								thumImg=rs.getString("thumImg");
								goal=rs.getInt("goal");
								recent=rs.getInt("recent");
								restDate=rs.getInt("restDate");
								goalInt=(int)goal;
								recentInt=(int)recent;
								prog = recent / goal*100;
								progInt=(int)prog;
								like=rs.getInt("likeCount");
								investor=rs.getInt("investor");
								prog=Math.round(prog);
				%>
					<li><img class="contentImg" src="<%=thumImg%>">
						<div class="contentText">
							<span class="contentTitle"><%=content%></span>
							<div class="contentInfo">
								<span class="contentPer"><%=progInt%>%<span class="nowMoney"><%=df.format(recentInt)%>원</span></span>
								<span class="restDate"><%=restDate %>일 남음</span>
							</div>
						</div>
						<div class="progress">
							<progress value="<%=prog%>" max=100></progress>
						</div>
						<div class="likeInvest">
							<span class="like"><%=like%></span>
							<span class="investor"><%=investor%>명 참여</span>
						</div>
						<div class="btn">
							<form class="orderForm" action="./order.jsp" method="POST">
								<input type="hidden" name="orderTitle" value="<%=title%>">
							<button type="submit" class="orderBtn">기부하기</button>
							</form>
							<form class="likeForm" action="./like.jsp" method="POST">
								<input type="hidden" name="likeTitle" value="<%=title%>">
								<button class="likeBtn" type="submit">좋아요</button>
							</form>
						</div>
					</li>
				<%  
					}
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
	
	<script>
		function pointPop(){
			popupX=(document.body.offsetWidth/2)-250;
			popupY=(document.body.offsetHeight/2)-150;
			
			window.open("./point.jsp", 'point', 'width=900, height=600, left='+popupX+',top='+popupY+',scrollbars=no, resizable=no'); 
			return false;
		}
	</script>
</body>

</html>