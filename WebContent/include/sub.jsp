<%@page import="net.ivyro.zian.board.SubDAO"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		
		Random random = new Random();
		int r_num = random.nextInt(5)+1;
		System.out.println("이번 숫자:"+r_num);
		
		// sub페이지 타이틀, 소타이틀
		String locationTitle = request.getRequestURI(); // 프로젝트 경로 가져오기
		System.out.println("현재 경로:"+locationTitle);
		SubDAO sdao = new SubDAO();
		sdao.InsertTitle(locationTitle);
		
	%>
	
	<section id="sub_section">
		<div class="sub_bg<%=r_num%>">
			<div class="sub_location">
				<h3>내용</h3>
				<p>내용2</p>
			</div>
		</div>
	</section>
</body>
</html>