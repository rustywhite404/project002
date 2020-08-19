<%@page import="net.ivyro.zian.board.FileDAO"%>
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
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");
		
		//FileDAO 객체 생성
		FileDAO fdao = new FileDAO();
		// deleteBoard 글 삭제 처리 
		int result = fdao.deleteBoard(bno, passwd);
		
		if(result==1){
			%>
			<script type="text/javascript">
				alert("글을 삭제하였습니다.");
				location.href="boardList.jsp?pageNum=<%=pageNum%>";
			</script>
			<%
		}else if(result==0){
			%>
			<script type="text/javascript">
				alert("비밀번호가 틀립니다!");
				history.back();
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
				alert("오류 발생!");
				history.back();
			</script>
			<%
		}
		
		
	%>
		
		
	
	
	
</body>
</html>