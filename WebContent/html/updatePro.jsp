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
		//로그인 상태 체크
		String userid = (String)session.getAttribute("id");
		if(userid==null){
			response.sendRedirect("login.jsp");
		}
		// 한글처리
		request.setCharacterEncoding("UTF-8");
	%>
	<!-- 전달된 파라미터값 저장 -->
	<jsp:useBean id="mb" class="net.ivyro.zian.member.MemberBean" />
	<jsp:setProperty property="*" name="mb"/>
	<%
		// 서버 연결
		MemberDAO mdao = new MemberDAO();
		// 정보 수정 메서드 생성 후 호출 updateMember(수정할 객체 정보)
		int check = mdao.updateMember(mb);
		// 처리 결과 리턴(1: 수정완료 / 0: 비밀번호 오류 / -1: 아이디 없음)
		
		if(check==1){
			%>
			<script type="text/javascript">
				alert("회원정보가 수정되었습니다!");
				location.href="myInfoModify.jsp";
			</script>
		<%
		}else if(check==0){
			%>
			<script type="text/javascript">
				alert("비밀번호를 다시 확인해주세요.");
				history.back()
			</script>
		<%
		}else{
			%>
				<script type="text/javascript">
					alert("아이디가 존재하지 않습니다!!");
					history.back()
				</script>
			<%
		}
	%>
</body>
</html>