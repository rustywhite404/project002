<%@page import="net.ivyro.zian.member.MemberDAO"%>
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
		//아이디, 비밀번호 넘겨받기
		String id = request.getParameter("id");
		if(id==null){
			response.sendRedirect("login.jsp");
		}
		String passwd = request.getParameter("passwd");
		
		MemberDAO mdao = new MemberDAO();
	 	int result = mdao.deleteMember(id, passwd);
		
	 	if(result==1){
	 		%>
 			<script type="text/javascript">
 				alert("회원 탈퇴가 완료되었습니다.");
 				location.href="main.jsp";
 			</script>
 			<%
	 	}else if(result==0){
	 		%>
 			<script type="text/javascript">
 				alert("비밀번호가 틀립니다.");
 				history.back();
 			</script>
 		<%
	 	}else{
	 		%>
	 			<script type="text/javascript">
	 				alert("아이디가 존재하지 않습니다.");
	 				history.back();
	 			</script>
	 		<%
	 	}
	%>
</body>
</html>