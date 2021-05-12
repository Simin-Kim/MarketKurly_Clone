<%@ page language="java" contentType="text/html; charset=UTF-8;" pageEncoding="UTF-8"%>
<%@ page import="User.UserDTO"%>
<%@ page import="User.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="util.SHA256" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userEmail=(String) request.getParameter("email");
	String userName=(String) request.getParameter("name");
	
	UserDAO userDAO = new UserDAO();
	String rst=userDAO.idFind(userName,userEmail);

	session.setAttribute("id",rst);

	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href='http://localhost:8080/FunNDo/idFindRes.jsp'");
	script.println("</script>");
	script.close();
%>