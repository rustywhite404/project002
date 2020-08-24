<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="net.ivyro.zian.board.FileDAO"%>
<%@page import="net.ivyro.zian.board.BoardBean"%>

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
		// 전달된 데이터 저장(filename)
		FileDAO fdao = new FileDAO();
		int bno = Integer.parseInt(request.getParameter("bno")) ;
		BoardBean bb = fdao.getBoard(bno);
		String filename= bb.getFile();
		
		System.out.println("전달된 파일명:"+filename);
		
		// 파일을 다운로드 할 위치(= 파일이 업로드 되어 있는 위치)
		String savePath = "upload"; // 저장되는 폴더명
		
		ServletContext context = getServletContext();
		// ㄴ 얘는 인터페이스라 객체 생성이 안 돼서 만들어져 있는 객체를 가져온다.
		// 즉, 내 프로젝트의 정보를 가져와서 context 안에 담아두는 것.
		
		String DownloadPath = context.getRealPath(savePath); 
		// savePath에 대한 진짜 경로를 구해서 DownloadPath안에 담겠다. 
		System.out.println("서버 안에 있는 파일이 실제로 저장되는 물리적 위치 DownloadPath: "+DownloadPath);
		
		// 다운로드 할 파일의 전체 경로
		String FilePath = DownloadPath +"\\"+filename;
		
		//////////////////////////////////////////////////////////////////
		
		// 데이터의 응답처리를 다운로드 형태로 구현
		
		// 파일을 한 번에 처리하기 위한 배열
		byte[] b = new byte[4069];
		
		FileInputStream fis = new FileInputStream(FilePath);
		// FileInputStream을 통해 '다운로드 파일 전체경로'로 연결되는 통로가 생겼다.
		// 데이터가 올바른 형태의 데이터를 전달하도록 MIME 타입을 지정해주자. 
		
		String MimeType = getServletContext().getMimeType(FilePath);
		// ㄴ 즉 이 경로로 가서 이 파일이 원래 어떤 파일이었는지를 저장해두는 것.
		
		if(MimeType == null){
			MimeType = "application/octet-stream";
			// 마임 타입이 없으면 기본값 지정
		}
		// 응답 정보를 마임타입으로 지정(다운로드 할 파일의 마임타입)
		response.setContentType(MimeType);
		
		// 브라우저에 따른 데이터 처리(대응)
		// 사용자가 접속한 브라우저 정보부터 확인한다. 
		String agent = request.getHeader("User-Agent");
		System.out.println("agent: "+agent);
		
		// IE인지 아닌지 판단
		boolean ieBrowser = agent.indexOf("MSIE") > -1 || agent.indexOf("Trident")>-1;
		// ㄴ 두 값중에 하나라도 들어 있으면 익스플로러다. 
		
		if(ieBrowser){// IE일 때 -> 다운로드 할 때 한글파일이 깨짐. 공백문자가 "+" -> "%20"
			// 그래서 IE면 파일 인코딩을 해서 다운받아야함. 
			
			filename = URLEncoder.encode(filename, "UTF-8").replace("\\+", "%20");
			// 원본 파일명을 UTF-8로 바꿀 건데, 그대로는 깨질 거라서 +가 아니라 %20으로 바꿔줌
		}else{
			// IE가 아닐 때 -> 데이터 인코딩(한글 깨짐처리)
			filename = new String(filename.getBytes("UTF-8"),"iso-8859-1");
		
		}
		
		// 데이터 다운로드 처리
		response.setHeader("Content-Disposition", "attachment; filename="+filename);
		// ㄴ response를 통해 내 응답에 대한 처리가 전달될거야.
		// 그럼 브라우저가 응답정보를 읽어서(해석) 처리시 
		// "Content-Disposition" 설정값이 attachment일 때만 다운로드 처리하겠다는 말이야.
		// attachment가 없으면 애들이 다운로드가 아니라 브라우저에 그냥 출력만 돼. 
		
		// 데이터 출력(다운로드)
		// 데이터가 출력될 통로 생성
		ServletOutputStream out2 = response.getOutputStream();
		
		out.clear();
		out = pageContext.pushBody();
		
		int data = 0;
		while((data=fis.read(b,0,b.length))!= -1){
			// b는 저 위에 만들었던 배열.
			// fis 파일을 읽어올 때 0부터 b배열 까지의 길이를 읽어오겠다. -1이 아닐 때까지.
			// 데이터 출력을 파일이 있는 동안 계속 진행하겠다는 말임.
			out2.write(b,0,data); 
			// 이 배열에 담아서 출력하겠다.
			
		}
		
		out2.flush();
		// 배열의 빈 공간을 채워서 데이터 처리
		out2.close();
		fis.close();
		
			
		
	%>


</body>
</html>