package ch12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean(); // 자기 자신으로 객체 형성 static 모든 문서에 전반적으로 영향을 미침.
	public static LogonDBBean getInstance(){ //메소드 앞에 static이 붙었다는 것은 다 부를 수 있다는 뜻.
		return instance; //LogonDBBean 요소들에 다 접근가능.
	} //jsp 와 java연동해주기 (이 책 저자만의 방법임)
	
	public LogonDBBean(){
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
		
	public int insertMember(LogonDataBean mb){ 
		//위 connection(메소드)호출
	
		Connection conn = null; //getConnection을 호출해서 Connection 타입의 conn에 저장
		PreparedStatement pstmt=null;
		try{
			conn = getConnection();
			String sql ="insert into member(id,passwd,name,reg_date,age,gender,email) values (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql); 
		    pstmt.setString(1,mb.getId());
		    pstmt.setString(2,mb.getPasswd());
		    pstmt.setString(3,mb.getName());
		    pstmt.setTimestamp(4,mb.getReg_date());
		    pstmt.setInt(5,mb.getAge());
		    pstmt.setString(6, mb.getGender());
		    pstmt.setString(7, mb.getEmail());
		   
		    return pstmt.executeUpdate();
		    
		    
		}catch(Exception e) {
			   e.printStackTrace();
		}
		return -1; //데이터베이스오류
	  
	}
	public int 사용자체크(String id, String passwd) throws ClassNotFoundException{
		//가입된 회원인지 아닌지 로그인 처리함.
		//1. DB연결 
		//2. 뭐리문, 화면에서 입력받은 아이디와 비밀번호 필요. 
		Connection conn;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dbpasswd = rs.getString("passwd"); 
				if(dbpasswd.equals(passwd)) {
					x = 1;
					System.out.println(x);
				}
				else
				{
					x = 0;
					System.out.println(x);
				}
			}
			else
			{
				x = -1;
				System.out.println(x);
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		return x;
		
		
	}

	


	public int 수정 (LogonDataBean mb) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		
		try {
			conn = getConnection();
			
			String sql = "select passwd from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			rs = pstmt.executeQuery();
			//아이디와 비밀번호가 일치하면 DB와 일치하면 1 아니면 0
			if (rs.next()) {
				if (mb.getPasswd().equals(rs.getString("passwd"))) {
					sql = "update member set name=?,age=?,gender=?,email=? where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mb.getName());
					pstmt.setInt(2, mb.getAge());
					pstmt.setString(3, mb.getGender());
					pstmt.setString(4, mb.getEmail());
					
					
					pstmt.setString(5, mb.getId());
					pstmt.executeUpdate();
					System.out.println("회원정보수정성공");
				    result = 1;
				    
				} else {
					result = 0;
					System.out.println("비밀번호가 틀림");
				}
		}
		}catch(Exception e){
		e.printStackTrace();
	}
	return result;
}
		
	

	
	public int 삭제 (LogonDataBean mb) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = 0;
		
		try {
			conn = getConnection();
			//3.id에 해당하는 passwd 가져오기
			String sql = "select passwd from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			//4.실행 rs 저장
			rs = pstmt.executeQuery();
			//5.데이터가 있으면 패스워드 비교 맞으면 delete check = 1
			// 틀리면  check = 0
			if (rs.next()) {
				if(mb.getPasswd().equals(rs.getString("passwd")))
				{
					pstmt.close();
					pstmt = null;
					
					sql = "delete from member where id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mb.getId());
					//실행
					pstmt.executeUpdate();
					
					check = 1;
					
				} else {
					check = 0;
				}
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return check;
	}//삭제()
	
	//회원정보 가지고 오기
	public LogonDataBean getUserInfo (String id) {
		LogonDataBean mb = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = getConnection();
			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				mb = new LogonDataBean();
				mb.setId(rs.getString("id"));
				mb.setPasswd(rs.getString("passwd"));
				mb.setName(rs.getString("name"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			    mb.setAge(rs.getInt("age"));
			    mb.setGender(rs.getString("gender"));
			    mb.setEmail(rs.getString("email"));
				System.out.println("회원정보저장");
		}
		System.out.println("sql구문 실행완료");
		
	} catch (Exception e) {
		e.printStackTrace();
	} 
		return mb;

	
   }
	
	public List<LogonDataBean> getMembers()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<LogonDataBean>list = new ArrayList<>();
		
		try{
			conn = getConnection();
			
			//sql 전체회원 가져오기
			String sql = "select * from member order by reg_date desc";
			pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    
		    //rs 데이터 있으면 자바빈 객체생성
		    //rs => 자바빈 멤버변수 저장
		    //자바빈 => 리스트 한칸 추가
		    
		    while(rs.next()){
		    	LogonDataBean mb = new LogonDataBean();
		    	mb.setId(rs.getString("id"));
		    	mb.setPasswd(rs.getString("passwd"));
		    	mb.setName(rs.getString("name"));
		    	mb.setReg_date(rs.getTimestamp("reg_date"));
		        mb.setGender(rs.getString("gender"));
		      	mb.setEmail(rs.getString("email"));
		    	mb.setAge(rs.getInt("age"));
		    	list.add(mb);
		    }
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
}
