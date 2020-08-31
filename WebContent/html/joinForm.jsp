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
		<%
			// 정규식 처리 하려고 불러와야 하는데 자바로 어떻게 처리해야 하지
			// MemberDAO mdao = new MemberDAO(); 
			// mdao.validationPasswd(passwd); 
		%>
		<section id="Content_container">
			<div class="contentBox">
				<h5>회원가입</h5>		
				<h4>회원이 되시면 워커힐 호텔의 온라인 회원으로서<br>
				더 큰 혜택과 편리함을 누리실 수 있습니다.
				</h4>
			</div>
			<div class="fullBox_grey">
				<div class="boxArea">
					<div id="joinForm">
						<form action="joinPro.jsp" method="post" name="join" onsubmit="return check();">
							<h5>필수 입력정보</h5>
							<span class="">아이디 </span>
							<input type="text" name="id"> <button type="button" name="check" onclick="winopen()">중복체크</button>
							<span class="">비밀번호 </span>
							<input type="password" name="passwd" placeholder="영문(대,소문자), 숫자 포함8~12자리">
							<span class="">비밀번호 확인 </span>
							<input type="password"" name="passwdCheck">
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
							<input type="text" id="postcode" name="post" placeholder="우편번호">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="roadAddress" name="addr" placeholder="도로명주소">
							<input type="text" id="jibunAddress" placeholder="지번주소">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress" placeholder="상세주소">
							<button type="submit" class="submit_b1" onclick="check()">회원가입</button><button type="reset" class="submit_b2">취소</button>
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
	
		 function check(){ // 회원가입 조건 체크 
			   var id = document.join.id.value;
			   var pw = document.join.passwd.value;
			   var pw2 = document.join.passwdCheck.value;
			   var name = document.join.name.value;
			   var age = document.join.age.value;
			   var mobile = document.join.mobile.value;
			   
			   
			   if(document.join.id.value == ""){
				   alert(" 아이디를 입력하시오. ");
				   document.join.id.focus();
				   return false;	   
			   }
			   
			   if( !(4<=id.length && id.length<=10) ){
				   alert("아이디는 4~10자리로 작성바랍니다.");
				   document.join.id.focus();
				   return false;
			   }
			   
			   if(pw == ""){
				   alert(" 비밀번호를 입력하시오. ");
				   document.join.passwd.focus();
				   return false;	   
			   }
			   if(pw2 == ""){
				   alert(" 비밀번호 확인창을 입력하시오. ");
				   document.join.passwdCheck.focus();
				   return false;	   
			   }
			   
			   if(pw != pw2){
				   alert(" 입력하신 비밀번호가 다릅니다." );
				   document.join.passwdCheck.select();
				   return false;		   
			   }
			   
			   if(name == ""){
				   alert(" 이름을 입력하시오. ");
				   document.join.name.focus();
				   return false;
			   }
			   if(name == ""){
				   alert(" 나이를 입력하시오. ");
				   document.join.age.focus();
				   return false;
			   }
			   if(name == ""){
				   alert(" 핸드폰 번호를 입력하시오. ");
				   document.join.mobile.focus();
				   return false;
			   }
		 }
	
	</script>
	
</body>
</html>