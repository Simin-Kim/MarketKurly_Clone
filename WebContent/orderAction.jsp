<%@ page language="java" contentType="text/html; charset=UTF-8;"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.text.*"%>

<% 
String userID = (String) session.getAttribute("id");

request.setCharacterEncoding("UTF-8");
int pay = Integer.parseInt((String)request.getParameter("point"));
String payStr=(String)request.getParameter("point");
int money = Integer.parseInt((String)request.getParameter("pay"));
String moneyStr = (String)request.getParameter("pay");
int payment=money-pay;
String orderTitle=(String) request.getParameter("orderTitle");
String orderContent=(String) request.getParameter("orderContent");
String name=(String) request.getParameter("name");
String phoneNum=(String) request.getParameter("cellPhone");
String roadAdd=(String) request.getParameter("roadAdd");
String detailAdd=(String) request.getParameter("detailAdd");
String email=(String) request.getParameter("email");
String address=roadAdd+detailAdd;
String zip=(String) request.getParameter("zip");

Connection conn = null;
PreparedStatement pstmt = null;
PreparedStatement pstmt2 = null;
ResultSet rs = null;
ResultSet rs2 = null;
Statement stmt =null;

try {
	conn = DatabaseUtil.getConnection();
	String sql = "SELECT * FROM USER WHERE ID=?"; 
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	rs = pstmt.executeQuery();

	// 결제 포인트에 따른 유저의 포인트 차감
	if (rs.next()) { 
		int point = rs.getInt("point"); 

		point-=pay;
		
		sql= "UPDATE USER SET POINT=? WHERE ID=?";
		pstmt2 = conn.prepareStatement(sql);
		pstmt2.setInt(1, point);
		pstmt2.setString(2, userID);
		pstmt2.executeUpdate();
		pstmt2.clearParameters();  
	}
	
	// 상품의 모금액 증가
	sql="SELECT * FROM FUNDCONTENT WHERE FUNDTITLE=?";
	pstmt2=conn.prepareStatement(sql);
	pstmt2.setString(1,orderTitle);
	rs2=pstmt2.executeQuery();
	rs2.next();
	int recent=rs2.getInt("recent");
	recent+=money;
	String content=rs2.getString("fundContent");
	pstmt2.clearParameters(); 
	
	sql="UPDATE FUNDCONTENT SET INVESTOR=INVESTOR+1 WHERE FUNDTITLE=?";
	pstmt2=conn.prepareStatement(sql);
	pstmt2.setString(1,orderTitle);
	pstmt2.executeUpdate();
	pstmt2.clearParameters(); 
	
	sql="UPDATE FUNDCONTENT SET RECENT=? WHERE FUNDTITLE=?";
	pstmt2=conn.prepareStatement(sql);
	pstmt2.setInt(1,recent);
	pstmt2.setString(2,orderTitle);
	pstmt2.executeUpdate();
	pstmt2.clearParameters();
	
	// DB overview에 결제내역 저장
	sql="INSERT INTO OVERVIEW(userID,point,content) VALUES(?, ?, ?)";
	pstmt2=conn.prepareStatement(sql);
	pstmt2.setString(1,userID);
	pstmt2.setInt(2,money);
	pstmt2.setString(3,content);
	pstmt2.executeUpdate();
	pstmt2.clearParameters();  
	
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

<!DOCTYPE html>
<html>
<head>
  <!-- toastr css 라이브러리 -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
	<script></script>
</head>
<body>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		IMP.init('imp80665345');
		IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    pay_method : 'vbank',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '<%=orderContent%>',
	    amount : <%=payment%>,
	    buyer_email : '<%=email%>',
	    buyer_name : '<%=name%>',
	    buyer_tel : '<%=phoneNum%>',
	    buyer_addr : '<%=address%>',
	    buyer_postcode : '<%=zip%>',
		}, function(rsp) {
		if ( rsp.success ) {
			toastr.options.escapeHtml = false;
			toastr.options.closeButton = false;
			toastr.options.newestOnTop = false;
			toastr.options.progressBar = false;
			toastr.success('결제가 완료되었습니다.', {timeOut: 700});
			setTimeout(function(){location.href='./orderDone.jsp'},800);
	    } else {
	    	toastr.options.escapeHtml = false;
	    	toastr.options.closeButton = false;
	    	toastr.options.newestOnTop = false;
	    	toastr.options.progressBar = false;
	    	toastr.error('결제에 실패하였습니다.', {timeOut: 700});
	    	setTimeout(function(){location.href='./index.jsp'},800);
	    }
	});

	</script>
</body>
</html>