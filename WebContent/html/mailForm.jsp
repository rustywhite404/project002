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
				<h5>고객의 소리</h5>		
				<h4>워커힐 호텔은 언제나 고객님들의<br>
				소중한 의견에 귀 기울이고 있습니다.
				</h4>
			</div>
			<div id="mailForm">
				<form action="mailPro.jsp" method="post">
					<div class="userInfo">
						<input type="text" name="name" placeholder="이름"><br>
						<input type="mail" name="email" placeholder="e-mail"><br>
						<input type="call" name="mobile" placeholder="휴대폰 번호"><br>
					</div>
					<div class="userContent">
					<textarea cols="50" rows="20" name="content"></textarea>
					<button type="submit">메일 보내기</button>
					</div>
					<div class="userAgree"><img src="../img/customer.jpg" /></div>
					<div class="clear"></div>
				</form>
			</div>
		</section>	
	<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->
	
</body>
</html>