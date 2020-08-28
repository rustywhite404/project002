package net.ivyro.zian.board;

public class SubDAO {

	public String InsertTitle(String locationTitle){
		String subject = null;
		switch (locationTitle) { 
			
			case "/project002/gallery/eventList.jsp": // depth가 0502 인 경우 
			subject = "이벤트";
			break;
 
			} 
		return subject;
	}	
}
