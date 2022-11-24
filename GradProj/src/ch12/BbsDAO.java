package ch12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
	private static BbsDAO instance = new BbsDAO(); // �ڱ� �ڽ����� ��ü ���� static ��� ������ ���������� ������ ��ħ.
	public static BbsDAO getInstance(){ //�޼ҵ� �տ� static�� �پ��ٴ� ���� �� �θ� �� �ִٴ� ��.
		return instance; //LogonDBBean ��ҵ鿡 �� ���ٰ���.
	} //jsp �� java�������ֱ� (�� å ���ڸ��� �����)
	public BbsDAO(){
		//�ڹ� ������ : �ʱ�ȭ
	}
	
	//Ŀ�ؼ�
		public Connection getConnection() throws ClassNotFoundException, SQLException{ //type�� Connection���� �ٲ�
			Connection conn =null;
			String jdbcUrl="jdbc:mysql://localhost:3306/jsp01?useUnicode=true&characterEncoding=utf8";
			String dbId="root";
			String dbPass ="1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			//system.out.println(conn);
			System.out.println("���Ἲ��");
			
			return conn; //�� �޼ҵ���� conn�� �ǹ�
		}
		
		
	    //�۾��� ���
		public void insertanony (BbsDBBean mb){ 
			//�� connection(�޼ҵ�)ȣ��
		
			Connection conn = null; //getConnection�� ȣ���ؼ� Connection Ÿ���� conn�� ����
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
			    System.out.println("�Խ��� ���� �ϼ�");
			    
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
				
				//sql ��üȸ�� ��������
				String sql ="select number,title,name,date,hit from anony order by number ";
				pstmt = conn.prepareStatement(sql);
			    rs = pstmt.executeQuery();
			    
			    //rs ������ ������ �ڹٺ� ��ü����
			    //rs => �ڹٺ� ������� ����
			    //�ڹٺ� => ����Ʈ ��ĭ �߰�
			    
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
		
		//�ϳ��� �Խñ��� ���� �޼ҵ�
				public BbsDBBean getBbs(int number) {
					BbsDBBean mb = null;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					try {
						conn = getConnection();
						//sql���� �۳��� ��������
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
							System.out.println("�� �������� �ϼ�");
					}
							
						}
						 catch(Exception e){
						e.printStackTrace();
					}
					return mb;
							
					
				}
					
				  
				}
			
		  
		
	















