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
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		// 파라미터값 저장(수정할 데이터)
	%>
	<jsp:useBean id="bb" class="net.ivyro.zian.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	<%
		// BoardDAO 객체 생성
		BoardDAO bdao = new BoardDAO();
		// updateBoard(bb) 처리 
		int result = bdao.updateBoard(bb);
		
		if(result==1){
			%>
			<script type="text/javascript">
				location.href="boardList.jsp?pageNum=<%=pageNum%>";
			</script>
			<%		
		}else if(result==0){
			%>
			<script type="text/javascript">
				alert("비밀번호가 다릅니다.");
				history.back();
			</script>
		<%
		}else{
			%>
				<script type="text/javascript">
					alert("비밀번호를 입력해주세요.");
					history.back();
				</script>
			<%
		}
	%>
	
	
</body>
</html>