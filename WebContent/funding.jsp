<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="util.DatabaseUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.text.*"%>

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
    <link rel="stylesheet" href="./assets/css/product.css">
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
<<<<<<< Updated upstream
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
=======
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
>>>>>>> Stashed changes
				</div>
			</div>
        <div class="mainWrap">
            <div class="main">
                <h1 class="title">펀딩상품</h1>
                <div class="sortingWrap">
                <form action="./funding.jsp" method="POST">
                	<select class="select" name="select" onchange="sortingLoad(this.form);">
                	<%
					String select=null;
	                
					if((String)request.getParameter("select")!=null) {
						select=(String)request.getParameter("select");
	
						if(select!=null){
							String sortLike="like";
							String sortClosing="closing";
							String sortInvestor="investor";
							String sortRecent="recent";
							
							if(select.equals(sortLike)){
								%>
			                		<option value="recent">최신순</option>
			                		<option value="like" selected>좋아요순</option>
			                		<option value="closing">마감임박순</option>
			                		<option value="investor">참여자순</option>
			                		<option value="recent">모금액순</option>
			                	<% 
										}
										else if(select.equals(sortClosing)){
								%>
			                		<option value="recent" >최신순</option>
			                		<option value="like">좋아요순</option>
			                		<option value="closing" selected>마감임박순</option>
			                		<option value="investor">참여자순</option>
			                		<option value="recent">모금액순</option>
								<%		}
										else if(select.equals(sortInvestor)){
								%>
					              	<option value="recent">최신순</option>
					                <option value="like">좋아요순</option>
					                <option value="closing">마감임박순</option>
					                <option value="investor" selected>참여자순</option>
			                		<option value="recent">모금액순</option>
			                	<%		}
										else if(select.equals(sortRecent)){
								%>
					              	<option value="recent">최신순</option>
					                <option value="like">좋아요순</option>
					                <option value="closing">마감임박순</option>
					                <option value="investor">참여자순</option>
			                		<option value="recent" selected>모금액순</option>
								<%
										}
										else{
								%>
			                		<option value="recent" selected>최신순</option>
			                		<option value="like">좋아요순</option>
			                		<option value="closing">마감임박순</option>
			                		<option value="investor">참여자순</option>
			                		<option value="recent">모금액순</option>
								<%
										}
									}
								}
								else{
								%>
			                		<option value="recent" selected>최신순</option>
			                		<option value="like">좋아요순</option>
			                		<option value="closing">마감임박순</option>
			                		<option value="investor">참여자순</option>
			                		<option value="recent">모금액순</option>
			                	<% 
								}
								%>
	            	</select>
                </form>
                </div>
                <%
					// User 테이블 연동용
					Connection conn = null;
					PreparedStatement pstmt = null;
					PreparedStatement pstmt2 = null;
					String sql = null;
					ResultSet rs = null;
					DecimalFormat df = new DecimalFormat("###,###");
					conn = DatabaseUtil.getConnection();
					
					int i=0,j=0;
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
					int restDate=0;
					int investor=0;
					
					try {
						if(select!=null){
							String sortLike="like";
							String sortClosing="closing";
							String sortInvestor="investor";
							String sortRecent="recent";
							
							if(select.equals(sortLike)){
								sql="SELECT * FROM FUNDCONTENT WHERE TYPE=? ORDER BY likeCount DESC";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, "펀딩");
								rs=pstmt.executeQuery();
							}
							else if(select.equals(sortClosing)){
								sql="SELECT * FROM FUNDCONTENT WHERE TYPE=? ORDER BY endDate ASC";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, "펀딩");
								rs=pstmt.executeQuery();
							}
							else if(select.equals(sortInvestor)){
								sql="SELECT * FROM FUNDCONTENT WHERE TYPE=? ORDER BY investor DESC";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, "펀딩");
								rs=pstmt.executeQuery();
							}
							else if(select.equals(sortRecent)){
								sql="SELECT * FROM FUNDCONTENT WHERE TYPE=? ORDER BY recent DESC";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, "펀딩");
								rs=pstmt.executeQuery();
							}
							else{
								sql="SELECT * FROM FUNDCONTENT WHERE TYPE=? ORDER BY contentID ASC"; // user 테이블 연동용
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, "펀딩");
								rs = pstmt.executeQuery();
							}
						}
						else{
							sql="SELECT * FROM FUNDCONTENT WHERE TYPE=? ORDER BY contentID ASC"; // user 테이블 연동용
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, "펀딩");
							rs = pstmt.executeQuery();
						}
						for(i=1;i<=3;i++){
				%>
                <ul class="product">
                <%
                	for(j=1;j<=3;j++){
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
                        <img class="productImg" src="<%=thumImg %>">
                        <div class="productText">
                            <span class="productTitle"><%=content%></span>
							<div class="productInfo">
								<span class="productPer"><%=progInt%>%<span class="nowMoney"><%=df.format(recentInt)%>원</span></span>
								<span class="restDate"><%=restDate %>일 남음</span>
							</div>
                        </div>
                        <div class="progress"><progress value="<%=prog%>" max=100></progress></div>
						<div class="likeInvest">
							<span class="like"><%=like%></span>
							<span class="investor"><%=investor%>명 참여</span>
						</div>
						<div class="btn">
							<form class="orderForm" action="./order.jsp" method="POST">
								<input type="hidden" name="orderTitle" value="<%=title%>">
								<button type="submit" class="doBtn">펀딩하기</button>
							</form>
							<form class="likeForm" action="./like.jsp" method="POST">
								<input type="hidden" name="likeTitle" value="<%=title%>">
								<button class="likeBtn" type="submit">좋아요</button>
							</form>
						</div>
                    </li>
                    <% }%>
                </ul>
                <%} 
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
				}%>
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


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
    <script src="./assets/js/index.js"></script>
	<script>
		function pointPop(){
			popupX=(document.body.offsetWidth/2)-250;
			popupY=(document.body.offsetHeight/2)-150;
			
			window.open("./point.jsp", 'point', 'width=500, height=300, left='+popupX+',top='+popupY+',scrollbars=no, resizable=no'); 
			return false;
		}
		
        function sortingLoad(obj){
         	obj.submit();
        }
	</script>
</body>

</html>