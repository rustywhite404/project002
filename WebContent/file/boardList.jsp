<%@page import="net.ivyro.zian.board.FileDAO"%>
<%@page import="net.ivyro.zian.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
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
		<%
	// 디비에서 전체 글 목록을 읽어서 가져오기
	
	// 1. BoardDAO 객체 생성
	FileDAO fdao = new FileDAO();
		
	// 2. 디비 테이블에 글이 있는지 없는지 판단(getBoardCount() 생성)
	int cnt = fdao.getBoardCount();
	
	System.out.println("테이블에 저장된 글 수:" + cnt);
	
	
	// 페이징처리**************************************
	// 페이징 처리는 다양한 로직이 알려져 있다.
	// 여기서 쓰는 건 일반적으로 많이 쓰는 로직이다.
	// 페이징처리란? : 한 페이지에서 보여줄 글의 개수를 설정하는 것
	
	int pageSize = 10;
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
		
		boardList = fdao.getBoardList(startRow,pageSize);
		// ㄴ페이징 처리 한 리스트 호출(시작행, 페이지 크기) 
		// bdao에서 getBoardList(startRow, pageSize) 만들어야 쓸 수 있겠지
	}

	%>
		<section id="Content_container">
			<div class="contentBox">
				<div id="notice">
				<h5>자료게시판</h5>		
				<h4>워커힐의 소식지 및 <br>고객 필요 자료들을 제공해드립니다.</h4>
					<form> 
						<table class="list">
							<colgroup>
								<col width="110px">
								<col width="auto">
								<col width="130px">
								<col width="130px">
							</colgroup>
							<thead>
								<tr>
									<th><span class="lineR">번호</span></th>
									<th><span class="lineR">제목</span></th>
									<th><span class="lineR">작성자</span></th>
									<th>등록일</th>
								</tr>
							</thead>
							
							<% 
							if(cnt!=0){ // 글이 0이 아닐 경우 이 부분 불러오고, 글이 0일 경우 안 뜨도록 
								for(int i=0;i<boardList.size();i++){
									BoardBean bb = (BoardBean)boardList.get(i);
									//ArrayList에서 가져온 한 칸의 정보 -> BoardBean 객체 하나로 이동
								%>
								<tbody>
									<tr class="trContent">
										<td><%= bb.getBno() %></td>
										<td class="trSubject"><a href="content.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a></td>
										<!-- 페이지 넘길 때 글 고유번호와 페이지 넘버 같이 가져감.
										페이지 넘버는 유저가 글을 수정하거나 새로 등록했을 때 현재페이지에 있도록 하기 위해 저장
										 -->
										<td><%= bb.getName() %></td>
										<td><%= bb.getDate() %></td>
									</tr>
									<%
									}
								}else{
									%>
										<!-- 글 수 없을 때 -->
									<%
								}
								%>
							</tbody>
						</table>
						<button type="button" class="list_btn" onclick="location.href='boardList.jsp'">목록</button>
						<button type="button" class="write_btn" onclick="location.href='writeForm.jsp'">글쓰기</button>
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
				%>
					<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">◀ </a>
				<%
			}
			
			// 숫자(1...10/11...20/21...30)
			for(int i=startPage;i<=endPage;i++){
				%>
					<a href="boardList.jsp?pageNum=<%=i%>"><%= i %></a>
				<%
			}
			
			// 다음(next)
			if(endPage<pageCount){
				%>
				<a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>"> ▶</a>
				<%
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
</body>
</html>