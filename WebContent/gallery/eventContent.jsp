<%@page import="net.ivyro.zian.board.GalleryBean"%>
<%@page import="net.ivyro.zian.board.GalleryDAO"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
			
			// File 객체 생성
			GalleryDAO gdao = new GalleryDAO();
			
			// 글 조회수를 1 증가 시키기(updateReadCount(bno))
			gdao.updateReadCount(bno);
			
			// 글 정보 가져오기(getBoard(bno))
			// 글 번호에 해당하는 글 정보여야 하니까 글번호 받아가야함 
			GalleryBean gb = gdao.getBoard(bno);

			

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
									<th>분류</th>
									<td><%
									if(gb.getCategory().equals("ing")){
										out.print("진행중");
									}else if(gb.getCategory().equals("end")){
										out.print("종료된 이벤트");
									}else{
										out.print("진행예정");
									}
									%></td>
									<th>작성자</th>
									<td><%= gb.getName() %></td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><%= gb.getSubject() %></td>
								</tr>
								<tr>
									<th colspan="4" class="c_content">
									<div class="pd30">
											<img src="../image/<%=gb.getPic() %>"><br>
									<%= gb.getContent() %>
									</div></td>
								</tr>
								<tr>
									<th>기간</th>
									<td colspan="3"><%=gb.getPeriod() %></td>
								</tr>

						</table>
						<div class="btn_set_l">
						<button type="button" class="write_btn" onclick="location.href='eventList.jsp?pageNum=<%=pageNum%>'">목록</button>
						</div>
						<div class="btn_set_r">
							<button type="button" class="list_btn" onclick="location.href='eventModify.jsp?bno=<%=gb.getBno()%>&pageNum=<%=pageNum%>&file=<%=gb.getPic()%>&thum=<%=gb.getThumnail()%>'">수정</button>
							<button type="button" class="list_btn" onclick="location.href='eventDelete.jsp?bno=<%=gb.getBno()%>&pageNum=<%=pageNum%>&file=<%=gb.getPic()%>&thum=<%=gb.getThumnail()%>'">삭제</button>
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