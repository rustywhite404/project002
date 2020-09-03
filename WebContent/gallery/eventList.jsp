<%@page import="java.util.regex.Pattern"%>
<%@page import="net.ivyro.zian.board.GalleryBean"%>
<%@page import="net.ivyro.zian.board.GalleryDAO"%>
<%@page import="net.ivyro.zian.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.ivyro.zian.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="../css/demo.css" rel="stylesheet" type="text/css">
<script src="../js/ScrollTrigger.min.js"></script>
<title>Hotel | Personal Project</title>
</head>
<body>
	<!-- 헤더영역 -->
	<jsp:include page="../include/header.jsp"/>
	<!-- 헤더영역 -->
	<!-- 서브페이지 헤더 -->
	<jsp:include page="../include/sub.jsp"/>
	<!-- 본문영역 -->
	<%

	
	// 디비에서 전체 글 목록을 읽어서 가져오기
	request.setCharacterEncoding("UTF-8");
	// 1. BoardDAO 객체 생성
	GalleryDAO gdao = new GalleryDAO();
	
	String category = request.getParameter("category");
	System.out.println("현재 카테고리:"+category);
	
	// 2. 디비 테이블에 글이 있는지 없는지 판단(getBoardCount() 생성) 
	
	int cnt = 0;
	if(category==null){
		cnt = gdao.getBoardCount();
		System.out.println("테이블에 저장된 글 수:" + cnt);
	}else{
		cnt = gdao.getBoardCount(category);
		System.out.println("테이블에 저장된 글 수:" + cnt);
	}
	
	
	// 페이징처리************************************** 
	// 페이징 처리는 다양한 로직이 알려져 있다.
	// 여기서 쓰는 건 일반적으로 많이 쓰는 로직이다.
	// 페이징처리란? : 한 페이지에서 보여줄 글의 개수를 설정하는 것
	
	int pageSize = 6;
	// ㄴ 한 페이지에서 보여줄 글의 갯수 설정
	// 여기 숫자를 바꾸면 그에 맞춰서 출력될 글 수가 바뀌겠지?
			
	String pageNum = request.getParameter("pageNum");
	// ㄴ 현 페이지의 페이지값을 확인 
	// 다른 페이지에서 넘어올 때, 파라메터로 페이지 번호를 넘겨주는 걸 받아옴
	// 페이지 번호로 연산을 할 건 아니라서 가지고 다니기 쉽게 string으로 만들었음
	
	if(pageNum==null){ // 페이지 정보가 없을 경우 항상 1페이지
		pageNum = "1";
	}
	
	
	int currentPage = Integer.parseInt(pageNum); // 숫자형으로 만든 pageNum
	// 행번호 1...10 / 11...20 / 21...30 / 31...40
	
	int startRow = (currentPage-1)*pageSize + 1;
	// ㄴ 시작하는 행 번호 계산 / 1, 11, 21... 	
	  
	int endRow = currentPage * pageSize;
	// ㄴ 끝 행번호 계산
	
	
	
	
	// 페이징처리**************************************
	// 게시판의 글 수를 모두 화면에 출력
	%>

	<%
	// 3. 글 모두 가져오기 getBoardList() 생성
	ArrayList boardList = null;
	if(cnt != 0){ // 글이 존재할 때 
		// boardList = bdao.getBoardList();	
		// ㄴ 페이징 처리 안 하고 전체 출력
		
		// 카테고리 관리
		if(category!=null){
			boardList = gdao.getBoardList(startRow, pageSize, category);
			System.out.println(boardList);
		}
		if(category==null){
			boardList = gdao.getBoardList(startRow, pageSize);
			System.out.println(boardList);
		}
		// ㄴ페이징 처리 한 리스트 호출(시작행, 페이지 크기) 
		// bdao에서 getBoardList(startRow, pageSize) 만들어야 쓸 수 있겠지
	}

	%>
		<section id="Content_container">
			<div class="contentBox">
				<div id="gallery">
				<h5>EVENT</h5>		
				<h4>워커힐에서 진행되는 <br/>다양한 이벤트를 만나보세요.</h4>
					<form> 
						<div id="tapBox">
							<ul>
								<li><a href="eventList.jsp">전체</a></li>
								<li><a href="eventList.jsp?category=pre">진행 예정</a></li>
								<li><a href="eventList.jsp?category=ing">진행중</a></li>
								<li><a href="eventList.jsp?category=end">지난 이벤트</a></li>
							</ul>
						</div> 
						<div id="countBox">
							<ul>
								<li>총 <%=cnt %>건</li>
							</ul>
						</div> 
						<div class="clear"></div>
						<div id="eventBox">
							<ul>
								<% 
									if(cnt!=0){ // 글이 0이 아닐 경우 이 부분 불러오고, 글이 0일 경우 안 뜨도록 
										// for(int i=0;i<pageSize;i++){
										for(int i=0;i<boardList.size();i++){
										//for(int i=0;i<boardList.size();i++){
					
											// ㄴ i<boardList.size() 로 불러오니까 전체가 다 한번에 떠서 임시로 변경해둠
											
											GalleryBean gb = (GalleryBean)boardList.get(i);
											//ArrayList에서 가져온 한 칸의 정보 -> BoardBean 객체 하나로 이동
											
											// 리스트에서 컨텐츠 불러올 때 태그 제외하고 불러오도록 처리 + 글자수 60자까지만 불러옴
											String preText = gb.getContent();
											String p = "/(<([^>]+)>)/ig";
											String convertText = preText.replace(p, "");

								%>
								<li>
									<a href="eventContent.jsp?bno=<%=gb.getBno()%>&pageNum=<%=pageNum%>">

										<div class="block">
											<div data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
											<div class="gallery_thum actionImg3">	
												<%
													if(gb.getThumnail()==null){
												%>
														<img src="../image/noImage.jpg">
														<div class="hover">
														<div class="line1"></div>
														<div class="line2"></div>
														<div class="sub_tit">
															View Event
														</div>
													</div>
												<%
													}else{
												%>	
												<img src="../image/<%=gb.getThumnail() %>">	
												<div class="hover">
													<div class="line1"></div>
													<div class="line2"></div>
													<div class="sub_tit">
														View Event
													</div>
												</div>
												<%
												}
												%>					
											</div>
										
										<h5 class="event_subject"><%=gb.getSubject()%></h5>
										
										<p class="event_context">
											<c:set var="TextValue" value="<%=convertText %>" />								         
									        <c:choose>		        
									        <c:when test="${fn:length(TextValue) > 60}">			   
									      	  <c:out value='${fn:substring(TextValue.replaceAll("\\\<.*?\\\>",""),0, 59)}' />...
									        </c:when>
									        <c:otherwise>
									       <c:out value='${TextValue.replaceAll("\\\<.*?\\\>","")}' escapeXml="false" />
									        </c:otherwise>								        
									        
											</c:choose>
											
										</p>
										
										<p class="event_period"><%=gb.getPeriod() %></p>
									</div>
									</div>
									
									</a>
								</li>
								<%
										}
									}
								%>
							</ul>
							
							<div class="clear"></div>
						</div> 
						
						<button type="button" class="list_btn" onclick="location.href='eventList.jsp'">목록</button>
						<button type="button" class="write_btn" onclick="location.href='eventWrite.jsp'">글쓰기</button>
					</form>
					<div id="pagination">
					<%
					// 다른페이지 이동버튼
					if(cnt != 0){ // 카운트가 0이 아닐 때 
						
						// 전체 페이지 수 - 글 50개라 치고 / 화면에 10개씩 출력하면 => 5페이지가 필요
						// 				  - 글이 56개라면 / 10개씩 출력하면 => 6페이지 필요
						// 다시말해서 
						// int pageCount = cnt/pageSize; 에서 
						// 전체 글 갯수 cnt를 pageSize 만큼씩 나눠서
						// 나누어 떨어지면 그냥 두고, 나머지가 있으면 +1 해야겠네. 
						
						int pageCount = cnt/pageSize +(cnt%pageSize==0?0:1);
						// 삼항연산자 써서 표기
						
						// 한 화면에 보여줄 페이지 번호 개수
						int pageBlock = 5; // 게시판 하단에 보이는 페이지 번호 개수 말하는거
						
						// 페이지 블럭의 시작페이지 번호
						int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
						
									
						// 페이지 블럭의 끝 페이지 번호 			
						int endPage = startPage+pageBlock-1;
						
						if(endPage>pageCount){ // 전체 페이지의 수보다 끝페이지 수가 큰 애가 나오면
							endPage = pageCount;
							
						}
						
						// 이전(prev)
						// 이전이 생기려면 페이지 블럭이 하나 더 있어서 
						// 내가 뒷 블럭에서 보고 있어야 이전 블럭으로 갈 수 있겠지?
						if(startPage>pageBlock){
							if(category!=null){
							%>	
								<a href="eventList.jsp?pageNum=<%=startPage-pageBlock%>&category=<%=category%>">◀ </a>
							<% 
							}else{
								%>
									<a href="eventList.jsp?pageNum=<%=startPage-pageBlock%>">◀ </a>
								<%
								}
							
						}
						
						// 숫자(1...10/11...20/21...30)
						for(int i=startPage;i<=endPage;i++){
															
								if(category!=null){
								%>	
									<a href="eventList.jsp?pageNum=<%=i%>&category=<%=category%>">
								<% 
								}else{
									%>
			
									<a href="eventList.jsp?pageNum=<%=i%>">
								<%
								}
								
								if(i==Integer.parseInt(pageNum)){
								%>
									<font color="#990000"><%= i %></font>
								<% 
								}else{
								%>
									<%= i %>
								<% 
								}
								%>
								</a>
							<%
						}
						// 다음(next)
						if(endPage<pageCount){
							
							if(category!=null){
								%>	
									<a href="eventList.jsp?pageNum=<%=startPage+pageBlock%>&category=<%=category%>"> ▶</a>
								<% 
								}else{
									%>
									<a href="eventList.jsp?pageNum=<%=startPage+pageBlock%>"> ▶</a>
								<%
							}
						}
					}
				
					%>
								</div>
								
							</div>
						</div>
					</section>	
				<!-- 본문영역 -->
	
	<!-- 푸터영역 -->
		<jsp:include page="../include/footer.jsp"/>
	<!-- 푸터영역 -->

<script>
window.counter = function() {
	// this refers to the html element with the data-scroll-showCallback tag
	var span = this.querySelector('span');
	var current = parseInt(span.textContent);

	span.textContent = current + 1;
};

document.addEventListener('DOMContentLoaded', function(){
  var trigger = new ScrollTrigger({
	  addHeight: true
  });
});
</script>

</body>
</html>