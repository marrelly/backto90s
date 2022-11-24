package ch12;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QDBBean {
	private static QDBBean instance = new QDBBean(); // �ڱ� �ڽ����� ��ü ���� static ��� ������ ���������� ������ ��ħ.
	public static QDBBean getInstance(){ //�޼ҵ� �տ� static�� �پ��ٴ� ���� �� �θ� �� �ִٴ� ��.
		return instance; //LogonDBBean ��ҵ鿡 �� ���ٰ���.
	} //jsp �� java�������ֱ� (�� å ���ڸ��� �����)
	public QDBBean(){
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
		public void insertQst (QDataBean qb){ 
			//�� connection(�޼ҵ�)ȣ��
		
			Connection conn = null; //getConnection�� ȣ���ؼ� Connection Ÿ���� conn�� ����
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
			    System.out.println("�Խ��� ���� �ϼ�");
			    
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
				
				//sql ��üȸ�� ��������
				String sql ="select number,title,name,date,hit from quest order by number ";
				pstmt = conn.prepareStatement(sql);
			    qs = pstmt.executeQuery();
			    
			    //gs ������ ������ �ڹٺ� ��ü����
			    //gs => �ڹٺ� ������� ����
			    //�ڹٺ� => ����Ʈ ��ĭ �߰�
			    
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
		
		//�ϳ��� �Խñ��� ���� �޼ҵ�
				public QDataBean getQbs(int number) {
					QDataBean qb = null;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet qs = null;
					
					try {
						conn = getConnection();
						//sql���� �۳��� ��������
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
							System.out.println("�� �������� �ϼ�");
					}
							
						}
						 catch(Exception e){
						e.printStackTrace();
					}
					return qb;
							
					
				}
					
}
