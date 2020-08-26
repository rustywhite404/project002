<%@page import="net.ivyro.zian.board.GalleryBean"%>
<%@page import="net.ivyro.zian.board.GalleryDAO"%>
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
		
			int bno =Integer.parseInt(request.getParameter("bno"));
			String pageNum = request.getParameter("pageNum");
			String file = request.getParameter("file");
			String thum = request.getParameter("thum");
			//BoardDAO 객체 생성
			GalleryDAO gdao = new GalleryDAO();
			// 글 불러오기 - getBoard(bno)만든 거 그대로 써도 될 것 같음
			GalleryBean gb = gdao.getBoard(bno);			
			
		%>
		
		<section id="Content_container">
			<div class="contentBox">
				<div id="writeForm">
				<h5>글 수정하기</h5>		
				
					<form action="eventModifyPro.jsp?pageNum=<%=pageNum %>" method="post" enctype="multipart/form-data" name="fr"> 
						<table class="list">
							<colgroup>
								<!--  col width="110px"-->
							</colgroup>
								<tr>
									
									<th>작성자</th>
									<td><input type="text" name="name" value="<%=gb.getName()%>"><input type="hidden" name="bno" value="<%=gb.getBno()%>"></td>
									<th>비밀번호</th>
									<td><input type="password" name="passwd"></td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td>
										<select name='category'>
										  <option value='pre' >진행 예정</option>
										  <option value='ing' >진행중</option>
										  <option value='end' >종료</option>
										</select>
										</td>
									<th>이벤트 기간</th>
									<td><input type="text" name="period" value="<%=gb.getPeriod()%>"></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" name="subject" class="sub_input" value="<%=gb.getSubject()%>"></td>
								</tr>
								<tr>
									<th>현재 첨부된 파일</th>
									<td colspan="3"><%=file%></td>
	
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">
									<textarea cols="92" rows="20" name="content"><%=gb.getContent()%></textarea></td>
								</tr>
								<tr>
									<th>변경할 썸네일</th>
									<td colspan="3"><input type="file" name="thumnail" class="file_input" value="<%=gb.getThumnail() %>"></td>
								</tr>
								<tr>
									<th>변경할 첨부파일</th>
									<td colspan="3"><input type="file" name="pic" class="file_input" value="<%=gb.getPic() %>"></td>
								</tr>

						</table>
						<div class="btn_set"> 
							<button type="button" class="list_btn" onclick="location.href='eventList.jsp?pageNum=<%=pageNum%>'">취소</button>
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