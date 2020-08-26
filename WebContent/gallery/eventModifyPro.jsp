<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="net.ivyro.zian.board.GalleryDAO"%>
<%@page import="net.ivyro.zian.board.GalleryBean"%>
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
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		// 파라미터값 저장(수정할 데이터)
		// 업로드 폴더 지정(절대경로- 파일에 직접 접근하는 방식)
		 System.out.println("가상경로: "+request.getRealPath("/image"));
 		String uploadPath = request.getRealPath("/image");
		// 업로드 파일 크기
		  int maxSize = 10 * 1024 * 1024; // 10MB
		  
		  // 파일이름 
		  String name="";
	      String subject="";
	      String filename="";
	      String OFilename="";
		  
		  // 파일업로드 (+ 예외처리 )
		  try{
			  MultipartRequest multi =
				  new MultipartRequest(
						  request,
						  uploadPath,
						  maxSize,
						  "UTF-8",
						  new DefaultFileRenamePolicy()
						  );
			// 파일업로드 완료
			  ///////////////////////////////////////////////////////
			  // 결과를 화면에 출력
			  
			  // 1. 폼의 이름 반환(폼에서 전달되는 파일들의 이름 반환)
			  Enumeration formNames = multi.getFileNames();
			  
			// 2. 전달된 파일의 정보를 저장
			  String formname = (String) formNames.nextElement();
			  
			  // 서버에 저장된 파일의 이름 저장
			  filename = multi.getFilesystemName(formname);
			  // 원래 파일의 이름 저장
			 	OFilename = multi.getOriginalFileName(formname);
			System.out.println(OFilename+"파일명");
			
		GalleryBean gb = new GalleryBean();
		gb.setBno(Integer.parseInt(multi.getParameter("bno")));
		gb.setName(multi.getParameter("name"));
		gb.setPasswd(multi.getParameter("passwd"));
		gb.setSubject(multi.getParameter("subject"));
		gb.setContent(multi.getParameter("content"));
		gb.setCategory(multi.getParameter("category"));
		gb.setPeriod(multi.getParameter("period"));
		gb.setPic(multi.getFilesystemName("pic"));
		gb.setThumnail(multi.getFilesystemName("thumnail"));
		
		// BoardDAO 객체 생성
		GalleryDAO gdao = new GalleryDAO();
		// updateBoard(bb) 처리 
		int result = gdao.updateBoard(gb);
		
		if(result==1){
			%>
			<script type="text/javascript">
				location.href="eventList.jsp?pageNum=<%=pageNum%>";
			</script>
			<%		
		}else if(result==0){
			%>
			<script type="text/javascript">
				alert("비밀번호가 다릅니다.");
				history.back();
			</script>
		<%
		}else{
			%>
				<script type="text/javascript">
					alert("비밀번호를 입력해주세요.");
					history.back();
				</script>
			<%
		}
		  }catch(Exception e){
	    	  e.printStackTrace();
	    	  System.out.println("x_x 예외발생!");
	      }    
	%>
	
	
	
</body>
</html>