package ch12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GDBBean {
	private static GDBBean instance = new GDBBean(); // 자기 자신으로 객체 형성 static 모든 문서에 전반적으로 영향을 미침.
	public static GDBBean getInstance(){ //메소드 앞에 static이 붙었다는 것은 다 부를 수 있다는 뜻.
		return instance; //LogonDBBean 요소들에 다 접근가능.
	} //jsp 와 java연동해주기 (이 책 저자만의 방법임)
	public GDBBean(){
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
		public void insertGame (GDataBean gb){ 
			//위 connection(메소드)호출
		
			Connection conn = null; //getConnection을 호출해서 Connection 타입의 conn에 저장
			PreparedStatement pstmt=null;
			try{
				conn = getConnection();
				String sql ="insert into game(title,name,passwd,content,date) values (?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1,gb.getTitle());
				pstmt.setString(2,gb.getName());
				pstmt.setInt(3,gb.getPasswd());
			    pstmt.setString(4,gb.getContent());
			    pstmt.setTimestamp(5,gb.getDate());
			    pstmt.executeUpdate();
			    System.out.println("게시판 삽입 완성");
			    
			}catch(Exception e) {
				   e.printStackTrace();
			}
			
			

			
		   }
		public List<GDataBean> getGame()
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet gs = null;
			
			List<GDataBean> list = new ArrayList<GDataBean>();
			
			try{
				conn = getConnection();
				
				//sql 전체회원 가져오기
				String sql ="select number,title,name,date,hit from game order by number ";
				pstmt = conn.prepareStatement(sql);
			    gs = pstmt.executeQuery();
			    
			    //gs 데이터 있으면 자바빈 객체생성
			    //gs => 자바빈 멤버변수 저장
			    //자바빈 => 리스트 한칸 추가
			    
			    while(gs.next()){
			    	GDataBean gb = new GDataBean();
			    	gb.setNumber(gs.getInt("number"));
			    	gb.setTitle(gs.getString("title"));
			    	gb.setName(gs.getString("name"));
			    	gb.setDate(gs.getTimestamp("date"));
			        gb.setHit(gs.getInt("hit"));
			        list.add(gb);
			    	
			    }
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
		}
		
		//하나의 게시글을 보는 메소드
				public GDataBean getGbs(int number) {
					GDataBean gb = null;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet gs = null;
					
					try {
						conn = getConnection();
						//sql에서 글내용 가져오기
						String sql = "select number,title,name,content,date,hit from game where number =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, number);
						gs = pstmt.executeQuery();
						
						if(gs.next()) {
							
							gb = new GDataBean();
							gb.setNumber(gs.getInt("number"));
							gb.setTitle(gs.getString("title"));
							gb.setName(gs.getString("name"));
						    gb.setContent(gs.getString("content"));
						    gb.setDate(gs.getTimestamp("date"));
						    gb.setHit(gs.getInt("hit"));
							System.out.println("글 가져오기 완성");
					}
							
						}
						 catch(Exception e){
						e.printStackTrace();
					}
					return gb;
							
					
				}
					
}
