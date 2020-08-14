<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/header.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		// 로그인 처리 할 세션 id값 받아오기
		String id = (String)session.getAttribute("id");
	%>
	<header id="#headerBox">
		<div class="logoNav"><a href="../index.jsp"><img src="../img/logo.svg"></a></div>
		<div id="topMenu">
			<div class="leftSide">
				<ul>
					<li><a href="">EN</a></li>
					<li><a href="">JP</a></li>
					<li><a href="">CN</a></li>
					<li><a href="">KR</a></li>
				</ul>
			</div>
			<div class="rightSide">
				<ul>
					<%
						if(id!=null){
					%>
						<li><a href="../board/boardList.jsp">Notice</a></li>
						<li><a href="">Reservation</a></li>
						<li><a href="../html/logout.jsp">Logout</a></li>
						<li><a href="../html/myPage.jsp">My Page</a></li>
						<li><span class="gold"><%=id%></span> 님 환영합니다.</li>
						
					<%
						}else{
					%>
						<li><a href="../board/boardList.jsp">Notice</a></li>
						<li><a href="">Reservation</a></li>
						<li><a href="../html/login.jsp">Login</a></li>
						<li><a href="../html/joinForm.jsp">Join</a></li>
						
					<%		
						}
					%>				
					
				</ul>
			</div>
		</div>
		<div class="clear"></div>
		<nav id="mainMenu" class="dropdown">
			<ul>
				<li><a href="">Hotel</a></li>
				<li><a href="">Rooms</a></li>
				<li><a href="">Facility</a></li>
				<li><a href="">Event</a>
					<ul class="mainDropdown">
						<li><a href="">이벤트게시판</a></li>
						<li><a href="">이벤트게시판</a></li>
						<li><a href="">이벤트게시판</a></li>
					</ul>
				</li>
				<li><a href="">Membership</a>
					<ul class="mainDropdown">
						<li><a href="">이벤트게시판</a></li>
						<li><a href="">이벤트게시판</a></li>
						<li><a href="">이벤트게시판</a></li>
					</ul>
				</li>
				<li><a href="">Customer</a></li>
			</ul>
		</nav>
		<div class="clear"></div>
	</header>
	
</body>
</html>