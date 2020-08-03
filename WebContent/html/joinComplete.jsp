<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<title>Hotel | Personal Project</title>
</head>
<body>
	<!-- 헤더영역 -->
		<jsp:include page="../include/header.jsp"/>
	<!-- 헤더영역 -->
	<!-- 서브페이지 헤더 -->
		<jsp:include page="../include/sub.jsp"/>
	<!-- 본문영역 -->
		
		<section id="Content_container">
			<div class="contentBox">
				<h5>회원가입 완료</h5>		
				<h4>워커힐 호텔의 회원으로 가입이 완료되었습니다.</h4>
			</div>
			<div class="fullBox_grey">
				<div class="boxArea">
					<div class="loginBox">
					<h5>회원 로그인</h5>
						<form action="loginPro.jsp" method="post">
							<input type="text" name="id" placeholder="아이디">
							<input type="password" name="passwd" placeholder="비밀번호">
							<button type="submit" onclick="location.href='loginForm.jsp'">로그인</button>
						</form>
					</div>
					<div class="joinBox">
					<h5>아직 회원이 아니신가요?</h5>
					<p>회원이 되시면 워커힐 호텔의 온라인 회원으로서<br>
					더 큰 혜택과 편리함을 누릴 수 있습니다.	</p>
					<br>
					<br>
					<button onclick="location.href='joinForm.jsp'">회원가입</button>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</section>	
	<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->
</body>
</html>