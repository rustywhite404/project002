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
		// 받아온 id, pass 저장
		String id = (String)session.getAttribute("id");
		String passwd = request.getParameter("passwd");
		
		// 받아온 id의 passwd가 입력한 passwd와 일치하는지 체크
		// DB 불러오기 
		MemberDAO mdao = new MemberDAO();
		
		// 패스워드 일치 체크
		int check = mdao.myPageCheck(id, passwd);
		// check가 0이면 비밀번호 틀림, 1이면 사용 가능, -1이면 에러
		
		if(check==1){
			response.sendRedirect("myInfoModify.jsp");
			
		}else if(check==0){
			%>
			<script type="text/javascript">
				alert("비밀번호가 다릅니다.");
				history.back();
			</script>
		<%			
		}else{
			%>
			<script type="text/javascript">
				alert("잘못된 접근입니다!");
				history.back();
			</script>
			<%			
			
		}
		
		
		
	%>
	
	

</body>
</html>