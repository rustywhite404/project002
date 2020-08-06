package net.ivyro.zian.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	// DAO(데이터 처리 객체) -> DB처리
	// 정보를 처리해서 데이터베이스에 저장
	
	// 디비 연결에 필요한 변수 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	// 디비 연결
	private Connection getCon() throws Exception{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/hoteldb");
		// java:comp/env/ 까지는 고정이고 그 뒤가 context.xml에 쓴 이름정보
		// 이렇게 하면 데이터 소스 정보를 ds가 가지고 있을거고,
		// ds를 이용해서 디비 연결.
		con = ds.getConnection();		
		return con;		
	}
	
	// 디비 자원해제
	public void closeDB(){
	
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
				} catch (SQLException e) {
				e.printStackTrace();
				}	
	}		
	
	//insertMember(MemberBean mb) : 회원가입
	public void insertMember(MemberBean mb){
	// 전달 인자가 여섯개 이상일 경우 성능이 급격히 떨어져서
	// 가급적 멤버빈으로 가져오기
		
	try {
		// DB연결
		con = getCon();
		// hotel_member에 전달받은 정보 모두 insert
		sql = "insert into hotel_member(id, passwd, name, age, mobile, gender, email, birth, addr, post, reg_date) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mb.getId());
		pstmt.setString(2, mb.getPasswd());
		pstmt.setString(3, mb.getName());
		pstmt.setInt(4, mb.getAge());
		pstmt.setInt(5, mb.getMobile());
		pstmt.setString(6, mb.getGender());
		pstmt.setString(7, mb.getEmail());
		pstmt.setString(8, mb.getBirth());
		pstmt.setString(9, mb.getAddr());
		pstmt.setInt(10, mb.getPost());
		pstmt.setDate(11, mb.getReg_date());
		
		//실행
		pstmt.executeUpdate();
		System.out.println("회원 가입 완료!");
		
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("회원가입 실패!");
	}finally{
		closeDB();
	}
		
	}//insertMember(MemberBean mb) : 회원가입
	
	// joinIdCheck(id) : 중복아이디 체크
	public int joinIdCheck(String ID){		
	int result = -1;
	
	try {
		con = getCon();
		// SQL : 아이디를 DB에 가지고 가서 있으면 중복이고, 없으면 신규가입 가능
		// 전달받은 ID가 DB에 있는지 확인
		sql = "select * from hotel_member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, ID);
		rs = pstmt.executeQuery();
		// 데이터 처리
		// rs.next()가 있으면 : 해당 아이디가 있는 것.
		// 1 : 사용 가능한 아이디
		// 0 : 이미 있는 아이디(중복) / 사용불가
		// -1 : 에러발생
		if(rs.next()){
			result = 0;
		}else{
			result = 1;
		}
		System.out.println("아이디 중복체크 결과:"+result);
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("아이디 중복체크 실패!");
	}finally{
		closeDB();
	}
	
	return result;
	}// joinIdCheck(id) : 중복아이디 체크
	
	//idCheck(id, pw) : 로그인 처리 
	public int idCheck(String id, String passwd){
		int check = -1;
	
		try {
			con = getCon();
			// SQL 작성 & pstmt 객체 생성
			sql = "select passwd from hotel_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				// 아이디가 있다
				if(passwd.equals(rs.getString("passwd"))){ // 아이디가 있고 비밀번호도 일치
					System.out.println("로그인 성공!");
					check = 1;
				}else{ // 아이디가 있고 비밀번호는 불일치
					check = 0;
				}
			}else{
				// 아이디가 없다
				check = -1;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 처리 실패!");
		}finally{
			closeDB();
		}
		
		return check;
		
	}//idCheck(id, pw) : 로그인 처리 
	
}
