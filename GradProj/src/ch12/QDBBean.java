package ch12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QDBBean {
	private static QDBBean instance = new QDBBean(); // 자기 자신으로 객체 형성 static 모든 문서에 전반적으로 영향을 미침.
	public static QDBBean getInstance(){ //메소드 앞에 static이 붙었다는 것은 다 부를 수 있다는 뜻.
		return instance; //LogonDBBean 요소들에 다 접근가능.
	} //jsp 와 java연동해주기 (이 책 저자만의 방법임)
	public QDBBean(){
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
		public void insertQst (QDataBean qb){ 
			//위 connection(메소드)호출
		
			Connection conn = null; //getConnection을 호출해서 Connection 타입의 conn에 저장
			PreparedStatement pstmt=null;
			try{
				conn = getConnection();
				String sql ="insert into quest(title,name,passwd,content,date) values (?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1,qb.getTitle());
				pstmt.setString(2,qb.getName());
				pstmt.setInt(3,qb.getPasswd());
			    pstmt.setString(4,qb.getContent());
			    pstmt.setTimestamp(5,qb.getDate());
			    pstmt.executeUpdate();
			    System.out.println("게시판 삽입 완성");
			    
			}catch(Exception e) {
				   e.printStackTrace();
			}
			
			

			
		   }
		public List<QDataBean> getquest()
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet qs = null;
			
			List<QDataBean> list = new ArrayList<QDataBean>();
			
			try{
				conn = getConnection();
				
				//sql 전체회원 가져오기
				String sql ="select number,title,name,date,hit from quest order by number ";
				pstmt = conn.prepareStatement(sql);
			    qs = pstmt.executeQuery();
			    
			    //gs 데이터 있으면 자바빈 객체생성
			    //gs => 자바빈 멤버변수 저장
			    //자바빈 => 리스트 한칸 추가
			    
			    while(qs.next()){
			    	QDataBean qb = new QDataBean();
			    	qb.setNumber(qs.getInt("number"));
			    	qb.setTitle(qs.getString("title"));
			    	qb.setName(qs.getString("name"));
			    	qb.setDate(qs.getTimestamp("date"));
			        qb.setHit(qs.getInt("hit"));
			        list.add(qb);
			    	
			    }
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
		}
		
		//하나의 게시글을 보는 메소드
				public QDataBean getQbs(int number) {
					QDataBean qb = null;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet qs = null;
					
					try {
						conn = getConnection();
						//sql에서 글내용 가져오기
						String sql = "select number,title,name,content,date,hit from quest where number =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, number);
						qs = pstmt.executeQuery();
						
						if(qs.next()) {
							
							qb = new QDataBean();
							qb.setNumber(qs.getInt("number"));
							qb.setTitle(qs.getString("title"));
							qb.setName(qs.getString("name"));
						    qb.setContent(qs.getString("content"));
						    qb.setDate(qs.getTimestamp("date"));
						    qb.setHit(qs.getInt("hit"));
							System.out.println("글 가져오기 완성");
					}
							
						}
						 catch(Exception e){
						e.printStackTrace();
					}
					return qb;
							
					
				}
					
}
