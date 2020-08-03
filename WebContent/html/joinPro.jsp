<%@page import="net.ivyro.zian.member.MemberDAO"%>
<%@page import="java.sql.Date"%>
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
		// 넘어오는 데이터들 한글 처리
		request.setCharacterEncoding("UTF-8");
		// joinForm에서 넘어온 데이터들 저장
		// 정보가 많으니까 액션태그(자바빈) 객체 생성해서 받아오기	
	%>
		<jsp:useBean id="mb" class="net.ivyro.zian.member.MemberBean"/>
		<jsp:setProperty property="*" name="mb"/>
	<%
	 	//날짜 정보 저장
	 	mb.setReg_date(new Date(System.currentTimeMillis()));
		
		//MemberDAO 객체 생성 -> 전달받은 정보 모두 저장
		MemberDAO mdao = new MemberDAO();
		
		// 회원가입 메서드(insertMember())
		mdao.insertMember(mb);
	%>
	<script type="text/javascript">
		location.href="joinComplete.jsp";
	</script>
</body>
</html>