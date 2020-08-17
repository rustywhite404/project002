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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
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
							<input type="text" id="postcode" name="post" value="<%=mb.getPost()%>"placeholder="우편번호">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="roadAddress" name="addr" value="<%=mb.getAddr()%>" placeholder="도로명주소">
							<input type="text" id="jibunAddress" placeholder="지번주소">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress" placeholder="상세주소">
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