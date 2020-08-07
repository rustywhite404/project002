<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
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
				<div id="contentView">
				<h5>공지사항</h5>		
				
					<form action="writePro.jsp" method="post"> 
						<table class="list">
							<colgroup>
								<!--  col width="110px"-->
							</colgroup>
								<tr>
									<th>글번호</th>
									<td>글번호</td>
									<th>작성자</th>
									<td>작성자명</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3">제목</td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3"><div class="pd30">내용</div></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">첨부파일명</td>
								</tr>

						</table>
						<div class="btn_set_l">
						<button type="button" class="write_btn" onclick="location.href='boardList.jsp'">목록</button>
						</div>
						<div class="btn_set_r">
							<button type="submit" class="write_btn">답글</button>
							<button type="button" class="list_btn" onclick="location.href='modify.jsp'">수정</button>
							<button type="button" class="list_btn" onclick="location.href='delete.jsp'">삭제</button>
						</div>
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