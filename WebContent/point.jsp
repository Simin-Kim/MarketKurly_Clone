<<<<<<< Updated upstream
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="User.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
>>>>>>> Stashed changes
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- css -->
<link rel="stylesheet" href="./assets/css/common.css">
<link rel="stylesheet" href="./assets/css/font.css">
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<!-- innerStyle -->
<style>
div.main {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100%;
	margin-top: 40px;
}

div.main h1.title {
	margin-bottom: 40px;
	font-size: 30px;
	font-family: 'NotoKrB';
	text-align: center;
}

div.main div.nowWrap{
    text-align: center;
    margin-bottom: 10px;
}

div.main div.chrgWrap{
    text-align: center;
    margin-bottom: 20px;
}
div.main span {
	font-size: 20px;
	font-family: 'NotoKrM';
}

div.main span.now {
	margin-bottom: 20px;
}

div.main span.charge {
	margin-bottom: 40px;
}

div.main span.charge input {
	width: 90px;
	height: 30px;
	border-radius: 3px;
	padding: 0 10px;
	font-size: 20px;
	font-family: 'NotoKrM';
}

div.main button.reg {
	width: 70px;
	height: 30px;
	border: 3px solid #000;
	border-radius: 3px;
	font-size: 16px;
	font-family: 'NotoKrB';
	margin-left: 60px;
}
</style>
</head>

<body>
<<<<<<< Updated upstream
	<%
		// User 테이블 연동용
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			conn = DatabaseUtil.getConnection();
			String sql = "SELECT * FROM USER WHERE ID=?"; // user 테이블 연동용
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			int point = 0;
			DecimalFormat df = new DecimalFormat("###,###");

			if (rs.next()) { // user 테이블에 담긴 데이터 있는지 확인

				point = rs.getInt("point"); // user 테이블에서 유저아이디를 가진 포인트 가져옴

				/*String sql2 = "SELECT * FROM USER WHERE point=?"; // user 테이블 연동용
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, point); // 가져온 상품번호로 Products 테이블 연동
				rs2 = pstmt.executeQuery(); */
			}
	%>
	<div class="main">
		<form action="./charge.jsp" method="post">
			<h1 class="title">포인트 충전</h1>
			<div class="nowWrap">
			<span class="nowText">현재 포인트 :</span><span class="nowPoint"><%=df.format(point)%></span>
			</div>
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
			<div class="chrgWrap">
			<span class="charge">충전 포인트 : <input type="number" name="chrgPoint" required></span></div>
			<button id="chargeBtn" class="reg" type="submit">충전</button>
		</form>		
	</div>
=======
	<%	
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
	} 
	
	%>
    <div class="main">
        <h1 class="title">포인트 충전</h1>
        <span class="now">현재 포인트 : <<% %>></span>
        <span class="charge">충전 포인트 : <input type="number"></span>
        <button class="reg" type="submit">충전</button>
    </div>
>>>>>>> Stashed changes

</body>

</html>