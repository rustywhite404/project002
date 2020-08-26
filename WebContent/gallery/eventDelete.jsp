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
			// content.jsp에서 bno, pageNum 받아온 거 저장
			
			int bno = Integer.parseInt(request.getParameter("bno")) ;
			String pageNum = request.getParameter("pageNum");
			String filename = request.getParameter("file");
			String thumname = request.getParameter("thum");
		
		%>
		
		<section id="Content_container" class="npd">
			<div class="fullBox_grey">
				<div class="boxArea">
					<div class="userCheckBox">
					<h5>비밀번호 확인</h5>
					<p>안전한 게시물 삭제를 위하여 비밀번호를 다시 한 번 확인받고 있습니다.</p>
						<form action="eventDeletePro.jsp?pageNum=<%=pageNum %>&file=<%=filename%>&thum=<%=thumname%>" method="post">
							<input type="hidden" value="<%=bno %>" name="bno">
							<input type="password" name="passwd" placeholder="글 작성 시 사용한 비밀번호를 입력하세요.">
							<button type="submit">글 삭제하기</button>
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