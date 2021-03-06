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
		<%
			// 비회원은 탈퇴할 수 없으니까 로그인 한 회원인지 확인
			String id = (String)session.getAttribute("id");
			if(id==null){
				response.sendRedirect("login.jsp");
			}
		
		%>
		
		<section id="Content_container">
			<div class="contentBox">
				<h5>회원 탈퇴하기</h5>		
				<h4>탈퇴 시 회원 할인 및 이벤트에 참여하실 수 없습니다.<br>
				정말 탈퇴하시겠습니까?</h4>
			</div>
			<div class="fullBox_grey">
				<div class="boxArea">
					<div class="userCheckBox">
					<h5>비밀번호 확인</h5>
					<p>안전한 회원 탈퇴를 위하여 비밀번호를 다시 한 번 확인받고 있습니다.</p>
						<form action="deletePro.jsp" method="post">
							<input type="hidden" value="<%=id%>" name="id">
							<input type="password" name="passwd" placeholder="비밀번호를 입력하세요.">
							<button type="submit" onclick="location.href='loginForm.jsp'">개인정보 확인</button>
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