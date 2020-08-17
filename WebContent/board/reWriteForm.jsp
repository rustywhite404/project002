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

		<%
		int bno = Integer.parseInt(request.getParameter("bno"));
		int re_ref = Integer.parseInt(request.getParameter("re_ref"));
		int re_lev = Integer.parseInt(request.getParameter("re_lev"));
		int re_seq = Integer.parseInt(request.getParameter("re_seq"));
		%>
		<section id="Content_container">
			<div class="contentBox">
				<div id="writeForm">
				<h5>글쓰기</h5>		
					
					<form action="reWritePro.jsp" method="post">
						<input type="hidden" name="bno" value="<%=bno%>">
						<input type="hidden" name="re_ref" value="<%=re_ref%>">
						<input type="hidden" name="re_lev" value="<%=re_lev%>">
						<input type="hidden" name="re_seq" value="<%=re_seq%>">
						<table class="list">
							<colgroup>
								<!--  col width="110px"-->
							</colgroup>
								<tr>
									<th>작성자</th>
									<td><input type="text" name="name"></td>
									<th>비밀번호</th>
									<td><input type="password" name="passwd"></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" name="subject" value="re: " class="sub_input"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3"><textarea cols="92" rows="20" name="content"></textarea></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3"><input type="file" name="file" class="file_input"></td>
								</tr>

						</table>
						<div class="btn_set"> 
							<button type="button" class="list_btn" onclick="location.href='boardList.jsp'">취소</button>
							<button type="submit" class="write_btn">등록</button>
						</div>
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