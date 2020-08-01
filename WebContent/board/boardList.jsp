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
				<div id="notice">
				<h5>공지사항</h5>		
				<h4>워커힐의 공지사항 및 새로운 소식을 알려드립니다.</h4>
					<table class="list">
						<colgroup>
							<col width="110px">
							<col width>
							<col width="130px">
							<col width="130px">
						</colgroup>
						<thead>
							<tr>
								<th><span class="lineR">번호</span></th>
								<th><span class="lineR">제목</span></th>
								<th><span class="lineR">작성자</span></th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr class="trContent">
								<td>번호</td>
								<td class="trSubject"><a href="#">제목</a></td>
								<td>작성자</td>
								<td>등록일</td>
							</tr>
							<tr class="trContent">
								<td>번호</td>
								<td class="trSubject"><a href="#">제목</a></td>
								<td>작성자</td>
								<td>등록일</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>	
	<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->
</body>
</html>