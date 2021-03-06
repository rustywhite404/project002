package net.ivyro.zian.board;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GalleryDAO {
	//디비 연결에 필요한 변수 선언
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
					if(con!=null)con.close();
				} catch (SQLException e) {
				e.printStackTrace();
				}
				
			}
		
			//////////////////////////////////////////////////////
			
			//insertBoard(글쓰기)
			
			public void insertBoard(GalleryBean gb){
				
				System.out.println(gb);
				
				int num = 0; // 글번호 저장
				
				try {
					con = getCon();
					// DB 연결
					
					// SQL 작성 & PSTMT 생성
					// 글번호 계산
					sql = "select max(bno) from hotel_gallery";
					// 이 테이블의 글번호 중 최댓값을 불러오기
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					// 글번호 데이터 처리
					if(rs.next()){
						num = rs.getInt(1)+1;
					}// 쿼리문의 첫번째 필드(최댓값) + 1을 하겠다는 뜻
					
					///////////////////////////////////////
					
					// 글쓰기(저장)
					// 3. SQL(글쓰기) & pstmt 
					
					sql = "insert into hotel_gallery(bno, id, name, passwd, subject, content, date, period, "
							+ "readcount, category, thumnail, pic, re_ref) values("
							+ "?,?,?,?,?,?,now(),?,?,?,?,?,?)";
					
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.setString(2, gb.getId());
					pstmt.setString(3, gb.getName());
					pstmt.setString(4, gb.getPasswd());
					pstmt.setString(5, gb.getSubject());
					pstmt.setString(6, gb.getContent());
					pstmt.setString(7, gb.getPeriod());
					pstmt.setInt(8, 0); // readcount 초기 조회수 0 
					pstmt.setString(9, gb.getCategory()); 
					pstmt.setString(10, gb.getThumnail()); 
					pstmt.setString(11, gb.getPic());
					pstmt.setInt(12, gb.getRe_ref()); // 답변글 그룹번호(일반 글번호와 동일) / re_ref
					
					// 실행
					pstmt.executeUpdate();
					System.out.println("회원 글쓰기 완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("글 등록 중 예외 발생!");
				}finally{
					closeDB();
				}
				
				
			}//insertBoard(글쓰기)
			
			//getBoardCount(): 게시판 글 갯수를 리턴
			public int getBoardCount(){
				int count = 0;
				try {
					con = getCon();
					// 디비연결
					
					sql = "select count(*) from hotel_gallery";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						count = rs.getInt(1);
					}
					System.out.println("게시판 글 갯수 확인"+count);
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("갯수 확인 중 예외 발생!");
				}finally{
					closeDB();
				}			
				
				return count;			
			}
			
			//getBoardCount(): 게시판 글 갯수를 리턴
			
			//getBoardCount(category): 카테고리별 게시판 글 갯수를 리턴
			public int getBoardCount(String category){
				int count = 0;
				try {
					con = getCon();
					// 디비연결
					
					sql = "select count(*) from hotel_gallery where category=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, category);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						count = rs.getInt(1);
					}
					System.out.println("게시판 글 갯수 확인"+count);
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("갯수 확인 중 예외 발생!");
				}finally{
					closeDB();
				}			
				
				return count;			
			}//getBoardCount(): 카테고리별 게시판 글 갯수를 리턴
			
			
			//getBoardList(startRow, pageSize) : 페이징 처리 된 글 모두 가져오기
			public ArrayList getBoardList(int startRow, int pageSize){
				ArrayList boardList = new ArrayList();
				// 데이터가 들어갈 배열 생성
				
				try {
					con = getCon();
					// sql = "select * from file_board";
					// 이렇게 하면 순서대로 출력됨. 
										
					sql="select * from hotel_gallery order by bno desc limit ?,?";

					pstmt = con.prepareStatement(sql);
					// ? 채우기
					pstmt.setInt(1, startRow-1);
					pstmt.setInt(2, pageSize);
					rs = pstmt.executeQuery();
					// 게시판 목록 중에서 10개씩 가져오기
					// 정렬 - asc(그룹번호)를 오름차순으로
					// 데이터 잘라서 가져오기 : limit 시작행 -1, 가져올 갯수
					// => 해당 위치부터 갯수만큼 가져오기
					
					
					// 데이터처리(검색된 모든 정보를 저장해서 이동)
					while(rs.next()){
						// DB 테이블 결과 1명(1행의 정보) 모두를 BoardBean 형태로 저장
						// 배열 한 칸에 저장(ArrayList) 사용
						GalleryBean gb = new GalleryBean();
										
						
						gb.setBno(rs.getInt("bno"));
						gb.setCategory(rs.getString("category"));
						gb.setContent(rs.getString("content"));
						gb.setDate(rs.getDate("date"));
						gb.setId(rs.getString("id"));
						gb.setName(rs.getString("name"));
						gb.setPasswd(rs.getString("passwd"));
						gb.setPeriod(rs.getString("period"));
						gb.setPic(rs.getString("pic"));
						gb.setRe_ref(rs.getInt("re_ref"));
						gb.setThumnail(rs.getString("thumnail"));
						gb.setReadcount(rs.getInt("readcount"));
						gb.setSubject(rs.getString("subject"));
						
						// 글 하나의 정보를 arrayList 한 칸에 저장
						boardList.add(gb);
					}
					System.out.println("글 정보 저장 완료!");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("리스트 출력 중 예외 발생!");
				}finally{
					closeDB();
				}
				
				return boardList;
			}//getBoardList(startRow, pageSize) : 페이징 처리 된 글 모두 가져오기
			
			
			//getBoardList(startRow, pageSize, category) : 페이징 처리 된 글 모두 가져오기(카테고리)
			public ArrayList getBoardList(int startRow, int pageSize, String category){
				ArrayList boardList = new ArrayList();
				// 데이터가 들어갈 배열 생성
				
				try {
					con = getCon();
					// sql = "select * from file_board";
					// 이렇게 하면 순서대로 출력됨. 
					
					if(category.equals("pre")){
						sql="select * from hotel_gallery where category='pre' order by bno desc limit ?,?";
					}else if(category.equals("ing")){
						sql="select * from hotel_gallery where category='ing' order by bno desc limit ?,?";
					}else if(category.equals("end")){
						sql="select * from hotel_gallery where category='end' order by bno desc limit ?,?";	
					}					
					// sql="select * from hotel_gallery order by bno desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					// ? 채우기
					pstmt.setInt(1, startRow-1);
					pstmt.setInt(2, pageSize);
					rs = pstmt.executeQuery();
					// 게시판 목록 중에서 10개씩 가져오기
					// 정렬 - asc(그룹번호)를 오름차순으로
					// 데이터 잘라서 가져오기 : limit 시작행 -1, 가져올 갯수
					// => 해당 위치부터 갯수만큼 가져오기
					
					
					// 데이터처리(검색된 모든 정보를 저장해서 이동)
					while(rs.next()){
						// DB 테이블 결과 1명(1행의 정보) 모두를 BoardBean 형태로 저장
						// 배열 한 칸에 저장(ArrayList) 사용
						GalleryBean gb = new GalleryBean();
										
						
						gb.setBno(rs.getInt("bno"));
						gb.setCategory(rs.getString("category"));
						gb.setContent(rs.getString("content"));
						gb.setDate(rs.getDate("date"));
						gb.setId(rs.getString("id"));
						gb.setName(rs.getString("name"));
						gb.setPasswd(rs.getString("passwd"));
						gb.setPeriod(rs.getString("period"));
						gb.setPic(rs.getString("pic"));
						gb.setRe_ref(rs.getInt("re_ref"));
						gb.setThumnail(rs.getString("thumnail"));
						gb.setReadcount(rs.getInt("readcount"));
						gb.setSubject(rs.getString("subject"));
						
						// 글 하나의 정보를 arrayList 한 칸에 저장
						boardList.add(gb);
					}
					System.out.println("글 정보 저장 완료!");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("리스트 출력 중 예외 발생!");
				}finally{
					closeDB();
				}
				
				return boardList;
			}//getBoardList(startRow, pageSize, category) : 페이징 처리 된 글 모두 가져오기(카테고리)
			
			//updateReadCount(bno) : 글 조회수 증가 처리
			public void updateReadCount(int bno){
				
				try {
					con = getCon();
					sql = "update hotel_gallery set readcount=readcount+1 where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bno);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("조회수 증가 처리 중 예외 발생");
				}finally{
					closeDB();
				}
				
			}//updateReadCount(bno) : 글 조회수 증가 처리
			
			//getBoard(bno) : 글 정보 가져오기
			public GalleryBean getBoard(int bno){
				GalleryBean gb = null; 
				
				try {
					con = getCon();
					sql = "select * from hotel_gallery where bno = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bno);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						gb = new GalleryBean();
						gb.setBno(rs.getInt("bno"));
						gb.setCategory(rs.getString("category"));
						gb.setContent(rs.getString("content"));
						gb.setDate(rs.getDate("date"));
						gb.setId(rs.getString("id"));
						gb.setName(rs.getString("name"));
						gb.setPasswd(rs.getString("passwd"));
						gb.setPeriod(rs.getString("period"));
						gb.setPic(rs.getString("pic"));
						gb.setRe_ref(rs.getInt("re_ref"));
						gb.setThumnail(rs.getString("thumnail"));
						gb.setReadcount(rs.getInt("readcount"));
						gb.setSubject(rs.getString("subject"));
					}
					System.out.println("글 정보 저장 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("글 정보 불러오는 중 예외 발생!");
				}finally{
					closeDB();
				}
				
				return gb;
			} //getBoard(bno) : 글 정보 가져오기
			
			// deleteBoard() : 글 삭제하기
			public int deleteBoard(int bno, String passwd){
				int check = -1;
				try {
					con = getCon();
					sql = "select passwd from hotel_gallery where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bno);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						if(rs.getString("passwd").equals(passwd)){
							sql = "delete from hotel_gallery where bno=?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, bno);
							pstmt.executeUpdate();
							System.out.println("글 삭제 완료!");
							check = 1;
						}else{
							// 비밀번호가 틀림
							System.out.println("비밀번호 틀림!");
							check = 0;
						}
					}else{
						check = -1;
						System.out.println("글 삭제 에러!"+check);
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("글 삭제 중 예외 발생!");
				}finally{
					closeDB();
				}
				return check;
			}
			
			// deleteBoard() : 글 삭제하기
			
			//updateBoard(bb): 글 수정하기 
			public int updateBoard(GalleryBean gb){
				int check = -1;
				try {
					con = getCon();
					sql ="select passwd from hotel_gallery where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, gb.getBno());
					rs = pstmt.executeQuery();
					if(rs.next()){
						if(gb.getPasswd().equals(rs.getString("passwd"))){
							
							if(gb.getPic()!=null){// pic이 비어있지 않을 때 
								
								if(gb.getThumnail()!=null){ // thumnail도 비어있지 않다면
									sql = "update hotel_gallery set subject=?, content=?, period=?, category=?, thumnail=?, pic=? where bno=?";
									pstmt = con.prepareStatement(sql);
									pstmt.setString(1, gb.getSubject());
									pstmt.setString(2, gb.getContent());
									pstmt.setString(3, gb.getPeriod());
									pstmt.setString(4, gb.getCategory());
									pstmt.setString(5, gb.getThumnail());
									pstmt.setString(6, gb.getPic());
									pstmt.setInt(7, gb.getBno());
									pstmt.executeUpdate();
									check = 1;
									System.out.println(gb);
								}else{ // thumnail은 비어있다면 
									sql = "update hotel_gallery set subject=?, content=?, period=?, category=?, pic=? where bno=?";
									pstmt = con.prepareStatement(sql);
									pstmt.setString(1, gb.getSubject());
									pstmt.setString(2, gb.getContent());
									pstmt.setString(3, gb.getPeriod());
									pstmt.setString(4, gb.getCategory());
									pstmt.setString(5, gb.getPic());
									pstmt.setInt(6, gb.getBno());
									pstmt.executeUpdate();
									check = 1;
									System.out.println(gb);
								}

							}else if(gb.getPic()==null && gb.getThumnail()!=null){ //pic은 비어있고, thumnail은 비어있지 않다면
								sql = "update hotel_gallery set subject=?, content=?, period=?, category=?, thumnail=? where bno=?";
								pstmt = con.prepareStatement(sql);
								pstmt.setString(1, gb.getSubject());
								pstmt.setString(2, gb.getContent());
								pstmt.setString(3, gb.getPeriod());
								pstmt.setString(4, gb.getCategory());
								pstmt.setString(5, gb.getThumnail());
								pstmt.setInt(6, gb.getBno());
								pstmt.executeUpdate();
								check = 1;
								System.out.println(gb);
							}else{
								// 둘 다 비어있을 때 
								sql = "update hotel_gallery set subject=?, content=?, period=?, category=? where bno=?";
								pstmt = con.prepareStatement(sql);
								pstmt.setString(1, gb.getSubject());
								pstmt.setString(2, gb.getContent());
								pstmt.setString(3, gb.getPeriod());
								pstmt.setString(4, gb.getCategory());
								pstmt.setInt(5, gb.getBno());
								pstmt.executeUpdate();
								check = 1;
								System.out.println(gb);
							}
				
							
						}else{
							System.out.println("비밀번호가 틀립니다.");
							check=0;
						}
						
					}else{
						System.out.println("에러:글이 없습니다!");
						check = -1;
					}
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("글 수정 중 예외 발생!");
				}finally{
					closeDB();
				}
				return check;			
			}
			
			//updateBoard(bb): 글 수정하기
			
			// jstl로 태그 제거하는 정규식 
			public String removeTag(String html) throws Exception {
				return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			}
			
}
