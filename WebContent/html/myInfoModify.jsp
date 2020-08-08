<%@page import="net.ivyro.zian.member.MemberBean"%>
<%@page import="net.ivyro.zian.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<title>Hotel | Personal Project</title>
</head>
<body>
	<!-- 헤더영역 -->
		<jsp:include page="../include/header.jsp"/>
	<!-- 헤더영역 -->
	<!-- 서브페이지 헤더 -->
		<jsp:include page="../include/sub.jsp"/>
	<!-- 본문영역 -->
		
		<section id="Content_container">
			<div class="contentBox">
				<h5>회원정보수정</h5>		
				<h4>비밀번호는 주기적으로<br>
				변경해 주실 것을 권장합니다.</h4>
			</div>
			<%
				// 로그인 없이 접근할 수 없는 페이지
				// 로그인 없이 접근할 경우 로그인 페이지로 이동
				String id = (String)session.getAttribute("id");
				
				if(id==null){
					response.sendRedirect("login.jsp");
				}
				
				// 회원정보를 DB에서 가져와서 페이지에 출력할 때,
				// 한글인 정보들도 있을테니까 한글화
				request.setCharacterEncoding("UTF-8");
				
				//DB연결
				MemberDAO mdao = new MemberDAO();
				
				// id에 해당하는 회원정보 가져오는 메서드 생성(getMember(id))
				// -> 그 id의 정보를 모두 리턴받아서 폼에 추가
				MemberBean mb = mdao.getMember(id);
				
				if(mb!=null){
			%>
			<div class="fullBox_grey">
				<div class="boxArea">
					<div id="modifyForm">
						<form action="updatePro.jsp" method="post" name="join">
							<h5>필수 입력정보</h5>
							<span class="">아이디 </span>
							<input type="text" name="id" value="<%=mb.getId()%>" readonly>
							<span class="">비밀번호 </span>
							<input type="password" name="passwd" placeholder="회원정보를 수정하려면 비밀번호를 입력하세요.">
							<span class="">이름 </span>
							<input type="text" name="name" value="<%=mb.getName()%>">
							<span class="">나이 </span>
							<input type="number" name="age" value="<%=mb.getAge()%>">
							<span class="">핸드폰 번호 </span>
							<input type="call" name="tel" value="<%=mb.getMobile()%>">
							<hr>
							<h5>선택 입력정보</h5>
							<span class="">성별 </span>
							남 <input type="radio" name="gender" value="man" class="gendertype"
							<% 
								if(mb.getGender().equals("man")){
							%>
								checked>
							<%		
								}else{
							
								%>
									>
								<%
								}
							%>
							여 <input type="radio" name="gender" value="woman" class="gendertype"
							<% 
								if(mb.getGender().equals("woman")){
							%>
								checked>
							<%		
								}else{
							
								%>
									>
								<%
								}
							%>
							<span class="">이메일 </span>
							<input type="email" name="email" value="<%=mb.getEmail()%>">
							<span class="">생년월일 </span>
							<input type="date" name="birth" value="<%=mb.getBirth()%>">
							<span class="">주소 </span>
							<input type="text" name="address" value="<%=mb.getAddr()%>"><br>
							<button type="submit" class="submit_b1">회원정보수정</button><button type="button" class="submit_b2" onclick="location.href='delete.jsp'">회원탈퇴</button>
						</form>
					</div>
				</div>
			</div>
			<% } %>
		</section>	
	<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->
	
</body>
</html>