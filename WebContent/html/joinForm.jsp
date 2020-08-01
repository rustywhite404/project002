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
				<h5>회원가입</h5>		
				<h4>회원이 되시면 워커힐 호텔의 온라인 회원으로서<br>
				더 큰 혜택과 편리함을 누리실 수 있습니다.
				</h4>
			</div>
			<div class="fullBox_grey">
				<div class="boxArea">
					<div id="joinForm">
						<form action="joinPro.jsp" method="post">
							<h5>필수 입력정보</h5>
							<span class="">아이디 </span>
							<input type="text" name="id"> <button name="check">중복체크</button>
							<span class="">비밀번호 </span>
							<input type="passward" name="passwd" placeholder="영문(대,소문자), 숫자 포함8~12자리">
							<span class="">비밀번호 확인 </span>
							<input type="passward"" name="passwdCheck">
							<span class="">이름 </span>
							<input type="text" name="name">
							<span class="">핸드폰 번호 </span>
							<input type="call" name="tel" placeholder="-없이 숫자만 입력해주세요.">
							<hr>
							<h5>선택 입력정보</h5>
							<span class="">이메일 </span>
							<input type="email" name="email">
							<span class="">생년월일 </span>
							<input type="date" name="birth">
							<span class="">주소 </span>
							<input type="address" name="addr"><br>
							<button type="submit" class="submit_b1">회원가입</button><button type="reset" class="submit_b2">취소</button>
						</form>
					</div>
				</div>
			</div>
		</section>	
	<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->
</body>
</html>