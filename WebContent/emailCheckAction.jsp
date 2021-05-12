<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="User.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	if(request.getParameter("code") != null) {
		code = (String) request.getParameter("code");
	}
	UserDAO userDAO =new UserDAO();
	String userID = null;
	if(session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href='./login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	String userEmail = userDAO.getEmail(userID);
	boolean isRight=(new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if(isRight == true) {
		userDAO.setEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공하였습니다!');");
		script.println("location.href = './index.jsp'");
		script.println("</script>");
		script.close();
		return;
		}
	else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지않은 코드입니다.');");
			script.println("location.href = './index.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
%>