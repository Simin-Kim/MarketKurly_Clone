<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="User.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
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
    <!-- innerStyle -->
    <style>
        div.main {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100%;
            margin-top: 50px;
        }

        div.main h1.title {
            margin-bottom: 50px;
            font-size: 30px;
            font-family: 'NotoKrB';
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

        div.main span.charge input {}

        div.main button.reg {
            width: 70px;
            height: 30px;
            border: 3px solid #000;
            border-radius: 3px;
            font-size: 16px;
            font-family: 'NotoKrB';
        }
    </style>
</head>

<body>
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

</body>

</html>