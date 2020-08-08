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
			<div class="fullBox_grey">
				<div class="boxArea">
					<div id="modifyForm">
						<form action="modifyPro.jsp" method="post" name="join">
							<h5>필수 입력정보</h5>
							<span class="">아이디 </span>
							<input type="text" name="id" readonly>
							<span class="">비밀번호 </span>
							<input type="passward" name="passwd" placeholder="영문(대,소문자), 숫자 포함8~12자리">
							<span class="">비밀번호 확인 </span>
							<input type="passward"" name="passwdCheck">
							<span class="">이름 </span>
							<input type="text" name="name">
							<span class="">나이 </span>
							<input type="number" name="age">
							<span class="">핸드폰 번호 </span>
							<input type="call" name="tel" placeholder="-없이 숫자만 입력해주세요.">
							<hr>
							<h5>선택 입력정보</h5>
							<span class="">성별 </span>
							남 <input type="radio" name="gender" value="man" class="gendertype"> 여 <input type="radio" name="gender" value="woman" class="gendertype">
							<span class="">이메일 </span>
							<input type="email" name="email">
							<span class="">생년월일 </span>
							<input type="date" name="birth">
							<span class="">주소 </span>
							<input type="address" name="addr"><br>
							<button type="submit" class="submit_b1">회원정보수정</button><button type="reset" class="submit_b2" onclick="location.href='delete.jsp'">회원탈퇴</button>
						</form>
					</div>
				</div>
			</div>
		</section>	
	<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->
	<script type="text/javascript">
		/* 사용자가 회원가입 시 */
		// 데이터 빈공백 체크
		function winopen() {
			// id를 입력하는 텍스트상자에 값이 비어있는지 판단
			// 값이 비어있을 경우 id를 입력하시오 메시지, focus()
			if(document.join.id.value==""){
				alert("아이디를 입력하세요.");
				document.join.id.focus();
				return;
			}else{
				//값이 있을 경우 진행
				// 새 창을 열어서 페이지 오픈
				// ㄴ 이동 시 입력받은 ID값 가지고 이동
				var id = document.join.id.value;
				window.open("joinIdCheck.jsp?userid="+id,"","width=420, height=260");
			}
			
		}
	
	</script>
	
</body>
</html>