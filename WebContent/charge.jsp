<%@ page language="java" contentType="text/html; charset=UTF-8;"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.text.*"%>

<%

	String userID = (String) session.getAttribute("id");

	request.setCharacterEncoding("UTF-8");
	String getPoint=(String) request.getParameter("chrgPoint");
	int chrgPoint=Integer.parseInt(getPoint);
	
	// User 테이블 연동용
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			conn = DatabaseUtil.getConnection();
			String sql = "SELECT * FROM USER WHERE ID=?"; // user 테이블 연동용
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			int point = 0;
			

			if (rs.next()) { // user 테이블에 담긴 데이터 있는지 확인
				point = rs.getInt("point"); // user 테이블에서 유저아이디를 가진 포인트 가져옴
	
				point = point + chrgPoint;
				String newPoint=Integer.toString(point);
				
				sql= "UPDATE USER SET POINT=? WHERE ID=?";
				pstmt2 = conn.prepareStatement(sql);
				pstmt2.setString(1, newPoint);
				pstmt2.setString(2, userID);
				pstmt2.executeUpdate();
				pstmt.close();
				pstmt2.close();
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
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('포인트가 충전되었습니다.')");
		script.println("window.close()");
		script.println("</script>");
		script.close();
%>