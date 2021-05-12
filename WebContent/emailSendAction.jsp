<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="User.UserDAO"%>
<%@page import="util.SHA256"%>
<%@page import="util.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserDAO userDAO = new UserDAO();
	String userID = null;
	if (session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");
	}
	/* if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
		boolean emailChecked = userDAO.getEmailChecked(userID);
		if(emailChecked ==true) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 인증된 아이디입니다.');");
			script.println("location.href ='index.jsp'");
			script.println("</script>");
			script.close();
			return;
		}   */

	String host = "http://localhost:8080/FunNDo/";
	String from = "inuyasa74@gmail.com"; // 보내는이
	String to = userDAO.getEmail(userID);
	String subject = "회원가입을 위한 이메일 인증 메일입니다.";
	String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." + "<a href='" + host + "emailCheckAction.jsp?code="
			+ new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	try {
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
	} catch (Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
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
<link rel="stylesheet" href="./assets/css/emailSend.css">
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
				</div>
			</div>
		</div>
		<div class="mainWrap">
			<div class="main">
				<h3 class="loginTitle">이메일 전송 완료</h3>
				<div class="loginBox"> <span
						class="idTxt">인증 메일이 전송되었습니다.<br>회원가입시 입력했던 이메일에서<br>인증해주세요.
					</span>
				</div>
				<a href="./login.jsp">
					<div id="formSubmit" class="findBtnWrap">
						<button type="button" class="findBtn">로그인</button>
					</div>
				</a>
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
</body>

</html>