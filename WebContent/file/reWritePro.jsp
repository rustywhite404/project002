<%@page import="net.ivyro.zian.board.BoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		// 한글화
		request.setCharacterEncoding("UTF-8");
		
		// 파일이 저장되는 위치 지정(D:/upfile)
		System.out.println("가상경로: "+ application.getRealPath("/upload"));
 		String uploadPath = application.getRealPath("/upload");
		
		//파일 업로드 가능한 최대 크기 5MB
		int MaxSize = 5*1024*1024;
		
		//MultiportRequest(요청정보, 파일 업로드할 폴더, 파일 업로드 제한 크기, 인코딩 방식, 파일이름 동일시 처리객체)
		MultipartRequest multi = new MultipartRequest(
									request,
									uploadPath,
									MaxSize,
									"UTF-8",
									new DefaultFileRenamePolicy()
									);
		// 파일 업로드 완료
		out.println("파일 업로드 완료!");
		
		// 처리 했으면 파일정보 + 글정보를 DB에 저장
		BoardBean bb = new BoardBean();
		bb.setName(multi.getParameter("name"));
		bb.setPasswd(multi.getParameter("passwd"));
		bb.setSubject(multi.getParameter("subject"));
		bb.setContent(multi.getParameter("content"));
		bb.setBno(Integer.parseInt(multi.getParameter("bno")));
		bb.setRe_lev(Integer.parseInt(multi.getParameter("re_lev")));
		bb.setRe_seq(Integer.parseInt(multi.getParameter("re_seq")));
		bb.setRe_ref(Integer.parseInt(multi.getParameter("re_ref")));
		// 일반적인 데이터는 parameter로 되지만, 파일은 이 형태로 저장이 안됨
		bb.setFile(multi.getFilesystemName("file")); // (o)
		
		// 전달된 파일 정보를 저장
		
		System.out.println("upfile에 저장된 이름: "+multi.getFilesystemName("file"));
		System.out.println("사용자가 올린 원본 파일 이름: "+multi.getOriginalFileName("file"));
		
		bb.setIp(request.getRemoteAddr()); // 이건 전달되는 파라메터가 아니어도 쓸 수 있음.

	//BoardDAO 객체 불러오기
	FileDAO fdao = new FileDAO();
	fdao.reWriteBoard(bb);
	// insertBoard(BoardBean bb) : 글쓰기 처리
	
	// 글쓰기 성공시 boardList로 이동
	response.sendRedirect("boardList.jsp");

	%>

</body>
</html>