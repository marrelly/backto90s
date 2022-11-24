package ch12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class NDBBean {
	private static NDBBean instance = new NDBBean(); // 자기 자신으로 객체 형성 static 모든 문서에 전반적으로 영향을 미침.
	public static NDBBean getInstance(){ //메소드 앞에 static이 붙었다는 것은 다 부를 수 있다는 뜻.
		return instance; //LogonDBBean 요소들에 다 접근가능.
	} //jsp 와 java연동해주기 (이 책 저자만의 방법임)
	public NDBBean(){
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
		public void insertNotice (NDataBean nb){ 
			//위 connection(메소드)호출
		
			Connection conn = null; //getConnection을 호출해서 Connection 타입의 conn에 저장
			PreparedStatement pstmt=null;
			try{
				conn = getConnection();
				String sql ="insert into notice(title,name,passwd,content,date) values (?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1,nb.getTitle());
				pstmt.setString(2,nb.getName());
				pstmt.setInt(3,nb.getPasswd());
			    pstmt.setString(4,nb.getContent());
			    pstmt.setTimestamp(5,nb.getDate());
			    pstmt.executeUpdate();
			    System.out.println("게시판 삽입 완성");
			    
			}catch(Exception e) {
				   e.printStackTrace();
			}
			
			

			
		   }
		public List<NDataBean> getNotice()
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet ns = null;
			
			List<NDataBean> list = new ArrayList<NDataBean>();
			
			try{
				conn = getConnection();
				
				//sql 전체회원 가져오기
				String sql ="select number,title,name,date,hit from notice order by number ";
				pstmt = conn.prepareStatement(sql);
			    ns = pstmt.executeQuery();
			    
			    //ns 데이터 있으면 자바빈 객체생성
			    //ns => 자바빈 멤버변수 저장
			    //자바빈 => 리스트 한칸 추가
			    
			    while(ns.next()){
			    	NDataBean nb = new NDataBean();
			    	nb.setNumber(ns.getInt("number"));
			    	nb.setTitle(ns.getString("title"));
			    	nb.setName(ns.getString("name"));
			    	nb.setDate(ns.getTimestamp("date"));
			        nb.setHit(ns.getInt("hit"));
			        list.add(nb);
			    	
			    }
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
		}
		
		//하나의 게시글을 보는 메소드
				public NDataBean getNbs(int number) {
					NDataBean nb = null;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet ns = null;
					
					try {
						conn = getConnection();
						//sql에서 글내용 가져오기
						String sql = "select number,title,name,content,date,hit from notice where number =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, number);
						ns = pstmt.executeQuery();
						
						if(ns.next()) {
							
							nb = new NDataBean();
							nb.setNumber(ns.getInt("number"));
							nb.setTitle(ns.getString("title"));
							nb.setName(ns.getString("name"));
						    nb.setContent(ns.getString("content"));
						    nb.setDate(ns.getTimestamp("date"));
						    nb.setHit(ns.getInt("hit"));
							System.out.println("글 가져오기 완성");
					}
							
						}
						 catch(Exception e){
						e.printStackTrace();
					}
					return nb;
							
					
				}

}
