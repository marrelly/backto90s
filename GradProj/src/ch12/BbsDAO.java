package ch12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	private static BbsDAO instance = new BbsDAO(); // 자기 자신으로 객체 형성 static 모든 문서에 전반적으로 영향을 미침.
	public static BbsDAO getInstance(){ //메소드 앞에 static이 붙었다는 것은 다 부를 수 있다는 뜻.
		return instance; //LogonDBBean 요소들에 다 접근가능.
	} //jsp 와 java연동해주기 (이 책 저자만의 방법임)
	public BbsDAO(){
		//자바 생성자 : 초기화
	}
	
	//커넥션
		public Connection getConnection() throws ClassNotFoundException, SQLException{ //type을 Connection으로 바꿈
			Connection conn =null;
			String jdbcUrl="jdbc:mysql://localhost:3306/jsp01?useUnicode=true&characterEncoding=utf8";
			String dbId="root";
			String dbPass ="1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			//system.out.println(conn);
			System.out.println("연결성공");
			
			return conn; //이 메소드안의 conn을 의미
		}
		
		
	    //글쓰기 기능
		public void insertanony (BbsDBBean mb){ 
			//위 connection(메소드)호출
		
			Connection conn = null; //getConnection을 호출해서 Connection 타입의 conn에 저장
			PreparedStatement pstmt=null;
			try{
				conn = getConnection();
				String sql ="insert into anony(title,passwd,content,date) values (?,?,?,?)";
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1,mb.getTitle());
			    pstmt.setInt(2,mb.getPasswd());
			    pstmt.setString(3,mb.getContent());
			    pstmt.setTimestamp(4,mb.getDate());
			    pstmt.executeUpdate();
			    System.out.println("게시판 삽입 완성");
			    
			}catch(Exception e) {
				   e.printStackTrace();
			}
			
			

			
		   }
			
		public List<BbsDBBean> getMembers()
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<BbsDBBean> list = new ArrayList<BbsDBBean>();
			
			try{
				conn = getConnection();
				
				//sql 전체회원 가져오기
				String sql ="select number,title,name,date,hit from anony order by number ";
				pstmt = conn.prepareStatement(sql);
			    rs = pstmt.executeQuery();
			    
			    //rs 데이터 있으면 자바빈 객체생성
			    //rs => 자바빈 멤버변수 저장
			    //자바빈 => 리스트 한칸 추가
			    
			    while(rs.next()){
			    	BbsDBBean mb = new BbsDBBean();
			    	mb.setNumber(rs.getInt("number"));
			    	mb.setTitle(rs.getString("title"));
			    	mb.setName(rs.getString("name"));
			    	mb.setDate(rs.getTimestamp("date"));
			        mb.setHit(rs.getInt("hit"));
			        list.add(mb);
			    	
			    }
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
		}
		
		//하나의 게시글을 보는 메소드
				public BbsDBBean getBbs(int number) {
					BbsDBBean mb = null;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					try {
						conn = getConnection();
						//sql에서 글내용 가져오기
						String sql = "select number,title,name,content,date,hit from anony where number =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, number);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							
							mb = new BbsDBBean();
							mb.setNumber(rs.getInt("number"));
							mb.setTitle(rs.getString("title"));
							mb.setName(rs.getString("name"));
						    mb.setContent(rs.getString("content"));
						    mb.setDate(rs.getTimestamp("date"));
						    mb.setHit(rs.getInt("hit"));
							System.out.println("글 가져오기 완성");
					}
							
						}
						 catch(Exception e){
						e.printStackTrace();
					}
					return mb;
							
					
				}
					
				  
				}
			
		  
		
	















