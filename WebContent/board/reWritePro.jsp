<%@page import="net.ivyro.zian.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 한글화
		request.setCharacterEncoding("UTF-8");
		// 데이터들 받아오기 
	%>
		<jsp:useBean id="bb" class="net.ivyro.zian.board.BoardBean" />
		<jsp:setProperty property="*" name="bb"/>
		
	<%
		// IP저장
		bb.setIp(request.getRemoteAddr());
		//dao 객체 생성
		BoardDAO bdao = new BoardDAO();
	
		// reWrite(BoardBean bb)
		bdao.reWriteBoard(bb);
		
		response.sendRedirect("boardList.jsp");
		
	%>
</body>
</html>