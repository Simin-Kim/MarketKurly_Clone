<%@ page language="java" contentType="text/html; charset=UTF-8;"
	pageEncoding="UTF-8"%>
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

		request.setCharacterEncoding("UTF-8");
		String likeTitle=(String) request.getParameter("likeTitle");

		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		int likeCount;

		try {
			conn = DatabaseUtil.getConnection(); 
				
			String sql= "UPDATE FUNDCONTENT SET LIKECOUNT=LIKECOUNT+1 WHERE FUNDTITLE=?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setString(1, likeTitle);
			pstmt2.executeUpdate();
		
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
</head>
<body>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script>
	toastr.options.escapeHtml = false;
	toastr.options.closeButton = false;
	toastr.options.newestOnTop = false;
	toastr.options.progressBar = false;
	toastr.success('좋아요를 보냈습니다.', {timeOut: 700});
	setTimeout(function(){location.href=document.referrer},800);

	</script>
</body>
</html>