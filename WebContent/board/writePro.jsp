<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="net.ivyro.zian.board.BoardDAO"%>
<%@page import="net.ivyro.zian.board.BoardBean"%>
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
		request.setCharacterEncoding("UTF-8");

	%>
	<jsp:useBean id="bb" class="net.ivyro.zian.board.BoardBean" />
	<jsp:setProperty property="*" name="bb"/>
	<%
	//BoardDAO 객체 불러오기
	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(bb);
	// insertBoard(BoardBean bb) : 글쓰기 처리
	
	// 글쓰기 성공시 boardList로 이동
	response.sendRedirect("boardList.jsp");

	%>

</body>
</html>