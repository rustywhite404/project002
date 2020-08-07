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
	// 한글처리
	request.setCharacterEncoding("UTF-8");
 	// 전달 된 파라미터값 저장(id, pw)
 	
 	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>

<%
	// DAO로 이동해서 로그인 처리 -> 결과를 다시 가져온다
	// MemberDAO 객체 생성
	MemberDAO mdao = new MemberDAO();
	
	// 로그인 처리: idCheck(id, passwd)
	int result = mdao.idCheck(id, passwd);
	
	// DB에서 해당 값이 있는지 체크하고 결과를 리턴 
	// 1: 정상처리 / 0: 비밀번호 오류 / -1: 없는 아이디
		
	if(result==1){
		
		// 아이디 정보를 세션값에 저장
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
		
	}else if(result==0){
		%>
		<script type="text/javascript">
		alert("비밀번호가 틀립니다. 다시 확인해주세요.");
		history.back();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("존재하지 않는 회원입니다.");
		history.back();
		</script>
		<%
	}
		
	
	
	
%>

</body>
</html>