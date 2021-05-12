<%@ page language="java" contentType="text/html; charset=UTF-8;" pageEncoding="UTF-8"%>
<%@ page import="User.UserDAO"%>
<%@ page import="User.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="util.SHA256" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userId=(String)request.getParameter("id");
	String userPassword=(String) request.getParameter("password");
	String userEmail=(String) request.getParameter("email");
	String userName=(String) request.getParameter("name");
	UserDAO userDAO = new UserDAO();
	
	int rst=userDAO.signUp(new UserDTO(userId,userPassword,userEmail,SHA256.getSHA256(userEmail), false,userName,10000));
	
	if(rst==1){
		session.setAttribute("id", userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='http://localhost:8080/FunNDo/emailSendAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	else if(rst==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('중복된 아이디입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else if(rst==-2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('중복된 이메일입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('에러발생. 관리자에게 문의하세요.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>