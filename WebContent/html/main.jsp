<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/main.css" rel="stylesheet" type="text/css">
<title>Hotel | Personal Project</title>
</head>
<body>
	<!-- 헤더영역 -->
		<jsp:include page="../include/header.jsp"/>
	<!-- 헤더영역 -->

	<!-- 본문영역 -->
		<div class="bg_video">
			<video preload="metadata" autoplay loop muted>
				<source src="https://www.hameaualbert.fr/sites/default/files/video-thumbnails/2019-04/video_1.mp4">
			</video>
			<div class="fade jb-text">
		    	<p>Personal Project<br>Hotel</p>
		    	<span>개인 프로젝트 1 : 호텔 홈페이지 구현</span>
		 	 </div>
		</div>
		<div id="reserv">
			<div id="reservationBar">
				<div class="logo"><img src="../img/RC.svg" /></div>
				<div class="reservInfo">
					<form>
						<span>체크인</span>
						<input type="date" name="checkIn">
						<span>체크아웃</span>
						<input type="date" name="checkOut">
						<span>어른</span>
						<select name="adult">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
						<span>명</span>
						<span>아이</span>
						<select name="child">
							<option value="1">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
						<span>명</span>
						<button type="submit">객실 예약</button>
					</form>
				</div>
			</div>
		</div>
		<div id="introduce">
			<div class="title">
				<h2>Hotel Introduce</h2>			
				<p>Personal Project Hotel, Create by Eun Ju Park</p>
			</div>
			<div class="content">
				<p> 이 홈페이지는 상업성과 영리성을 추구하지 않으며, IT윌 부산의 전자정부 프레임워크 자바 개발자 과정을 수료하는 박은주의 개인 프로젝트 과제 목적으로 제작된 페이지입니다.
				호텔 홈페이지가 갖추어야 할 필수적인 기능들을 수업시간에 익힌 기술로 구현해보는 것을 목표로 하였습니다. 
				'기존의 호텔 공식 홈페이지와 동일한 형태를 구현해보는 것'을 목적으로 하여, 홈페이지의 일부 레이아웃 및 디자인은 실제 홈페이지의 디자인을 반영해왔으며
				레퍼런스로 사용된 사이트들은 링크 형태로 첨부합니다. 
				현재까지 구현된 기능 중 회원 관련으로는 회원가입, 회원정보 조회 및 수정, 회원 탈퇴가 있습니다. 게시판은 일반 글 게시판, 파일 업로드 및 다운로드 게시판, 갤러리 게시판의 CRUD기능을 구현하였습니다.
				사용한 API는 다음 카카오 우편번호 API와 네이버 에디터 API입니다. 추후 예약 정보에 따른 결제 모듈까지 붙이는 것을 목표로 배움을 이어나가고 있습니다.</p>	
			</div>
		</div>
		
	<div id="information">
		<div class="infoContainer">
			<div class="infoSection">
				<div class="infoContext">
					<H1>DARAKHYU</H1>
					<p>여행자의 몸과 마음에 에너지를 채워주는 가장 스마트한 호텔<br>
					다락휴에서 색다른 여행을 시작하세요.</p>
					<input type="button" value="인천공항 제1터미널">
					<input type="button" value="인천공항 제2터미널">
					<input type="button" value="전라남도 여수">
				</div>
			</div>
		</div>
	</div>
	
	<div id="information2">
		<div class="infoContainer2">
			<div class="infoSection">
				<div class="infoContext">
					<H1>DARAKHYU</H1>
					<p>여행자의 몸과 마음에 에너지를 채워주는 가장 스마트한 호텔<br>
					다락휴에서 색다른 여행을 시작하세요.</p>
					<input type="button" value="인천공항 제1터미널">
					<input type="button" value="인천공항 제2터미널">
					<input type="button" value="전라남도 여수">
				</div>
			</div>
		</div>
	</div>
	

	<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->
</body>
</html>