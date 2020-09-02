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
				
					<div id="mailForm">
					<form action="mailPro.jsp" method="post">
						<div class="userInfo">
							<input type="text" name="name" placeholder="이름"><br>
							<input type="mail" name="email" placeholder="e-mail"><br>
							<input type="text" name="subject" placeholder="제목"><br>
							<textarea cols="50.9" rows="18" name="content"></textarea>
							<button type="submit">메일 보내기</button>
						</div>
						<div class="userContent">
							<div class="innerBox">
							<h4>개인정보 처리방침</h4>
							<p class="main_copy mmm">워커힐 호텔에서는 서비스 제공을 위해 필요한 최소한의 개인정보를 수집하고 있습니다.<br>
							서비스 이용과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다. <br>
							PC웹, 모바일 웹/앱 : 이름, 이메일 주소 
							워커힐 호텔은 이용자의 별도 동의가 있는 경우나 법령에 규정된 경우를 제외하고는 이용자의 개인정보를 제3자에게 제공하지 않습니다.
							개인정보는 수집 및 이용목적이 달성되면 지체없이 파기하며, 절차 및 방법은 아래와 같습니다.
전자적 파일 형태인 경우 복구 및 재생되지 않도록 안전하게 삭제하고, 그 밖에 기록물, 인쇄물, 서면 등의 경우 분쇄하거나 소각하여 파기합니다.
다만, 내부 방침에 따라 일정 기간 보관 후 파기하는 정보는 아래와 같습니다. 
1)아래 정보는 탈퇴일부터 최대 1년간 보관 후 파기합니다.
안내메일 발송 및 CS문의 대응을 위해 계정과 탈퇴안내 이메일 주소를 암호화하여 보관
서비스 부정이용 기록
							</p>
							<p class="bottom_copy">#<br>VOICE OF<br>CUSTOMER</p>
							</div>
						</div>
						<div class="userAgree"><img src="../img/customer.jpg" /></div>
						<div class="clear"></div>
					</form>
				</div>
			
			</div>
			
		</section>	
	<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->
	
</body>
</html>