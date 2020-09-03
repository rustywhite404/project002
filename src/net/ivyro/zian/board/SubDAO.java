package net.ivyro.zian.board;

public class SubDAO {

	public String InsertTitle(String location){
		String subject = null;
		switch (location) { 
			
			case "/project002/gallery/eventList.jsp":
			subject = "이벤트";
			break;
			
			case "/project002/gallery/eventContent.jsp":
			subject = "이벤트";
			break;
			
			case "/project002/gallery/eventModify.jsp":
			subject = "이벤트";
			break;
			
			case "/project002/gallery/eventDelete.jsp":
			subject = "이벤트";
			break;
			
			case "/project002/gallery/eventWrite.jsp":
			subject = "이벤트";
			break;
			
			case "/project002/board/boardList.jsp": 
			subject = "공지사항";
			break;
			
			case "/project002/board/delete.jsp": 
			subject = "공지사항";
			break;
			
			case "/project002/board/writeForm.jsp": 
			subject = "공지사항";
			break;
			
			case "/project002/board/content.jsp": 
			subject = "공지사항";
			break;
			
			case "/project002/board/modify.jsp": 
			subject = "공지사항";
			break;
			
			case "/project002/html/mailSend.jsp": 
			subject = "고객의 소리";
			break;
			
			case "/project002/html/joinForm.jsp": 
			subject = "회원가입";
			break;
			
			case "/project002/file/modify.jsp": 
			subject = "자료실";
			break;
			
			case "/project002/file/content.jsp": 
			subject = "자료실";
			break;
			
			case "/project002/file/delete.jsp": 
			subject = "자료실";
			break;
			
			case "/project002/file/boardList.jsp":
			subject = "자료실";
			break;
			
			case "/project002/html/login.jsp":
			subject = "로그인";
			break;
			
			case "/project002/html/join.jsp":
			subject = "회원가입";
			break;
			
			case "/project002/html/mailForm.jsp":
			subject = "고객의 소리";
			break;
			
			case "/project002/html/joinComplete.jsp":
			subject = "회원가입 완료";
			break;
			
			case "/project002/html/myPage.jsp":
			subject = "회원정보 확인";
			break;
			
			case "/project002/html/myInfoModify.jsp":
			subject = "회원정보 수정";
			break;
			
			case "/project002/html/delete.jsp":
			subject = "회원 탈퇴";
			break;
 
			} 
		return subject;
	}	
	
	public String InsertContext(String location){
		String context = null;
		switch(location){
		
		case "/project002/gallery/eventList.jsp":
		context = "Membership / Event";
		break;
		
		case "/project002/gallery/eventWrite.jsp":
		context = "Membership / Event";
		break;
			
		case "/project002/gallery/eventContent.jsp":
		context = "Membership / Event";
		break;
		
		case "/project002/gallery/eventModify.jsp":
		context = "Membership / Event";
		break;
		
		case "/project002/gallery/eventDelete.jsp":
		context = "Membership / Event";
		break;
			
		case "/project002/board/boardList.jsp": 
		context = "Membership / Notice";
		break;
		
		case "/project002/board/delete.jsp": 
		context = "Membership / Notice";
		break;
			
		case "/project002/board/writeForm.jsp": 
		context = "Membership / Notice";
		break;
		
		case "/project002/board/content.jsp": 
		context = "Membership / Notice";
		break;
		
		case "/project002/html/joinForm.jsp": 
		context = "Member / Join";
		break;
		
		case "/project002/html/mailForm.jsp":
		context = "Customer / Voice of Customer";
		break;
		
		case "/project002/html/mailSend.jsp": 
		context = "Customer / Voice of Customer";
		break;
			
		case "/project002/html/joinComplete.jsp":
		context = "Member / Join Complete";
		break;
			
		case "/project002/file/content.jsp": 
		context = "Membership / Download";
		break;
		
		case "/project002/file/modify.jsp": 
		context = "Membership / Download";
		break;
		
		case "/project002/file/delete.jsp": 
		context = "Membership / Download";
		break;
		
		case "/project002/board/modify.jsp": 
		context = "Membership / Notice";
		break;
			
		case "/project002/file/boardList.jsp": 
		context = "Membership / Download";
		break;
		
		case "/project002/html/login.jsp":
		context = "Member / Login";
		break;
		
		case "/project002/html/join.jsp":
		context = "Member / Join";
		break;
		
		case "/project002/html/myPage.jsp":
		context = "Member / My Page";
		break;
		
		case "/project002/html/myInfoModify.jsp":
		context = "Member / My Page";
		break;
		
		case "/project002/html/delete.jsp":
		context = "Member / Delete Account";
		break;
		
		}
		return context; 
		
	}
}
