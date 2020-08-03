<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/footer.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<footer id="foot">
        <div id="quick"><button type="button" class="ico" onclick="location.href='#'">TOP</button></div>
        <nav>
            <h2 class="blind">하단바로가기</h2>
            <menu class="gnbFoot">
                <li>
                    <h3>Our Company</h3>
                    <menu>
                        <li><a href="/about/Walkerhill" onClick="gaEvent('워커힐 허브_PC','푸터','Our Company_워커힐 호텔앤리조트');">워커힐 호텔앤리조트</a></li>
                        <li><a href="/about/History" onClick="gaEvent('워커힐 허브_PC','푸터','Our Company_워커힐 역사');">워커힐 역사</a></li>
                        <li><a href="/about/Brand" onClick="gaEvent('워커힐 허브_PC','푸터','Our Company_워커힐 브랜드');">워커힐 브랜드</a></li>
                        <li><a href="http://www.walkerhillstory.com/" target="_blank" onClick="gaEvent('워커힐 허브_PC','푸터','Our Company_워커힐 웹 매거진');">워커힐 웹 매거진</a></li>
                  
                    </menu>
                </li>
                <li>
                    <h3>For Guests</h3>
                    <menu>
                        <li><a href="/Stay" ">호텔 검색/예약</a></li>
                        <li><a href="/Eat" onClick="gaEvent('워커힐 허브_PC','푸터','For Guests_레스토랑 검색/예약');">레스토랑 검색/예약</a></li>
                        <li><a href="/offers/Overview" onClick="gaEvent('워커힐 허브_PC','푸터','For Guests_패키지/프로모션');">패키지/프로모션</a></li>
                        <li><a href="/customer/VOCForm.wh" onClick="gaEvent('워커힐 허브_PC','푸터','For Guests_워커힐 고객센터');">워커힐 고객센터</a></li>
                    </menu>
                </li>
                <li>
                    <h3>Membership</h3>
                    <menu>
                        <li><a href="/membership/Overview" onClick="gaEvent('워커힐 허브_PC','푸터','Membership_멤버십 종합안내');">멤버십 종합안내</a></li>
                        <li><a href="/membership/Rewards" onClick="gaEvent('워커힐 허브_PC','푸터','Membership_워커힐 리워즈');">워커힐 리워즈</a></li>
                        <li><a href="/membership/WPC" onClick="gaEvent('워커힐 허브_PC','푸터','Membership_워커힐 프레스티지 클럽');">워커힐 프레스티지 클럽</a></li>
                        <li><a href="/mywalkerhill/MembershipRewards.wh" onClick="gaEvent('워커힐 허브_PC','푸터','Membership_마이 워커힐');">마이 워커힐</a></li>
                    </menu>
                </li>
            </menu>
            <menu class="about">
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">이용약관</a></li>
                <li><a href="#">사이트맵</a></li>
                <li><a href="#">인재채용</a></li>
                <li><a href="#">윤리경영</a></li>
                <li><a href="#">제휴문의</a></li>
            </menu>
        </nav>
        <section>
            <img src="../img/h1_logo.png" alt="WALKERHILL HOTELS & RESORTS">
            <address>
                <dl class="contact">
                    <dt>워커힐 객실 예약</dt>
                    <dd>02-000-0000</dd>
                    <dt>워커힐 레스토랑 예약 및 기타 안내</dt>
                    <dd>02-000-0000</dd>
                    <dt>이메일 문의</dt>
                    <dd><a href="mailto:example@naver.com;">example@naver.com</a></dd>
                </dl>
                <dl class="addr">
                    <dt class="blind">법인명</dt>
                    <dd>XXXXXXX</dd>
                    <dt class="blind">주소</dt>
                    <dd>경기도 수원시 장안구 경수대로 795(영화동)</dd>
                    <dt>대표이사</dt>
                    <dd>XXX XXX</dd>
                    <dt>사업자등록번호</dt>
                    <dd>XXX-XX-XXXXX</dd>
                    <dt>통신판매 신고번호</dt>
                    <dd>제XXXX-서울XX-XXXX호</dd>
                    <dt>워커힐 호텔 소재지</dt>
                    <dd>04963 서울특별시 광진구 워커힐로 177</dd>
                </dl>
                <p>COPYRIGHT 2018 SK NETWORKS CO., LTD. WALKERHILL ALL RIGHTS RESERVED.</p>
                <div class="link">
                    <select name="quickLink" id="quickLink" class="links" onChange="if(this.value) window.open(this.value); gaEvent('워커힐 허브_PC','QUICK LINK', $('#quickLink option:selected').text());" title="관련사이트 새창열림">
                        <option>QUICK LINK</option>
                        <option value="#">제휴사1</option>
                        <option value="#">제휴사2</option>
                        <option value="#">제휴사3</option>
                        <option value="#">제휴사4</option>
                    </select>
                </div>
            </address>
        </section>
    </footer>

</body>
</html>