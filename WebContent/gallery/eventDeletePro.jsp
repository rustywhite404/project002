<%@page import="java.io.File"%>
<%@page import="net.ivyro.zian.board.GalleryDAO"%>
<%@page import="net.ivyro.zian.board.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");
		
		
		//FileDAO 객체 생성
		GalleryDAO gdao = new GalleryDAO();
		// deleteBoard 글 삭제 처리 
		int result = gdao.deleteBoard(bno, passwd);
				
		if(result==1){
			%>
			<script type="text/javascript">
				alert("글을 삭제하였습니다.");
				location.href="eventList.jsp?pageNum=<%=pageNum%>";
			</script>
			<%
		}else if(result==0){
			%>
			<script type="text/javascript">
				alert("비밀번호가 틀립니다!");
				history.back();
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
				alert("오류 발생!");
				history.back();
			</script>
			<%
		}
		
		// 파일 삭제
		// 전달된 파일 이름 저장
		String filename = request.getParameter("file");
		String thumname = request.getParameter("thum");
		System.out.println("파일명: "+filename);	
		System.out.println("썸네일명: "+thumname);	
		
		// 파일 객체 생성 -> 삭제
		// File f = new File("해당 파일의 위치"+파일명); 
		File f = new File(request.getRealPath("/image/")+filename);
		File s = new File(request.getRealPath("/image/")+thumname);
				
		// 파일삭제
		System.out.println(f+"파일 삭제 완료!");
		f.delete();
		System.out.println(s+"썸네일 삭제 완료!");		
		s.delete();
		
		
		
	%>
		
		
	
	
	
</body>
</html>