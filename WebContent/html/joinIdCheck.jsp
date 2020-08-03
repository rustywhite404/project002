<%@page import="net.ivyro.zian.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="joinCheck">
		<%
			//중복 체크 검사하기 위해 받아온 ID값 출력
			String id = request.getParameter("userid");
			// 이제 중복체크 해야함.
			// MemberDAO 객체 생성해서 DB 불러오기
			MemberDAO mdao = new MemberDAO();
			
			// 중복 아이디 체크 메서드 joinIdCheck(id);
			int check = mdao.joinIdCheck(id);
			// check 가 0이면 중복아이디, 1이면 사용가능 아이디
			
			if(check==1){
				%>
				<span>사용할 수 있는 아이디입니다.</span>
				<button type="button" onclick="result();">사용하기</button>
				<hr>
				<span>다른 아이디로 가입 하시겠습니까?</span>
				<%
			}else if(check==0){
				%>
				<span>이미 존재하는 아이디입니다.<br>
				다른 아이디를 입력해주세요.</span>
				<%
			}else{
				out.print("에러가 발생했습니다! 관리자에게 문의하세요.");
			}
			
		%>
		<form action="joinIdCheck.jsp" method="post" name="idCheck">
			<input type="text" name="userid" value="<%=id%>"><button type="submit">중복 확인</button>
		</form>
	</div>
	<script type="text/javascript">
		function result() {
			// 중복 확인창에서 회원가입 페이지로 정보 전달
			// 새 창에 있는 아이디 정보 -> 회원가입 창에 아이디 정보로 전달
			
			opener.document.join.id.value=document.idCheck.userid.value;
			
			//회원가입창 아이디란 readonly로 제어
			opener.document.join.id.readOnly=true;
			
			//창닫기
			window.close();
			
		}
	</script>
</body>
</html>