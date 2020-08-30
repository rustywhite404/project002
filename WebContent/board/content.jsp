<%@page import="net.ivyro.zian.board.BoardBean"%>
<%@page import="net.ivyro.zian.board.BoardDAO"%>
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
			//한글화
			request.setCharacterEncoding("UTF-8");
			// 글번호에 해당하는 글의 정보 가져오고 넘어온 데이터 저장(bno, pageNum)	
			int bno = Integer.parseInt(request.getParameter("bno")) ;
			String pageNum = request.getParameter("pageNum");
			
			
			// BoardDAO 객체 생성
			BoardDAO bdao = new BoardDAO();
			
			// 글 조회수를 1 증가 시키기(updateReadCount(bno))
			bdao.updateReadCount(bno);
			
			// 글 정보 가져오기(getBoard(bno))
			// 글 번호에 해당하는 글 정보여야 하니까 글번호 받아가야함 
			BoardBean bb = bdao.getBoard(bno);
			
			// textarea에 엔터 띄어쓰기 처리하기 
			String contents= bb.getContent();
			contents=contents.replace("\r\n","<br>"); 
			
		%>
		
		<section id="Content_container">
			<div class="contentBox">
				<div id="contentView">
				<h5>공지사항</h5>		
				
					<form> 
						<table class="list">
							<colgroup>
								<!--  col width="110px"-->
							</colgroup>
								<tr>
									<th>글번호</th>
									<td><%= bb.getBno() %></td>
									<th>작성자</th>
									<td><%= bb.getName() %></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><%= bb.getSubject() %></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3" class="content"><div class="pd30"><%= contents %></div></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3"><%=bb.getFile() %><input type="hidden" name="file" value="<%=bb.getFile()%>"></td>
								</tr>

						</table>
						<div class="btn_set_l">
						<button type="button" class="write_btn" onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>'">목록</button>
						</div>
						<div class="btn_set_r">
							<button type="button" class="write_btn" onclick="location.href='reWriteForm.jsp?bno=<%=bb.getBno()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">답글</button>
							<button type="button" class="list_btn" onclick="location.href='modify.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">수정</button>
							<button type="button" class="list_btn" onclick="location.href='delete.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>'">삭제</button>
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