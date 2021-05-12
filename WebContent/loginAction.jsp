<%@ page language="java" contentType="text/html; charset=UTF-8;" pageEncoding="UTF-8"%>
<%@ page import="User.UserDTO"%>
<%@ page import="User.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");

	String userId=(String) request.getParameter("id");
	String userPassword=(String) request.getParameter("password");
	
	UserDAO userDAO = new UserDAO();
	int res=userDAO.login(userId, userPassword);
	
	if(res==1){
		session.setAttribute("id", userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('환영합니다.')");
		script.println("location.href='./index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else if(res==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('틀린 비밀번호입니다.')");
		script.println("location.href='./login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else if(res==2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일 인증을 해주세요.')");
		script.println("location.href='./login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("location.href='./login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>