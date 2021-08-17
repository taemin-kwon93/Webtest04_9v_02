package ez2.logon0817;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Vector;
import ez2.loader.JdbcUtil;

public class LogonDBBean02 {
	//SingleTon Pattern : LogonDBBean m = LogonDBBean.getInstance();
	private static LogonDBBean02 instance = new LogonDBBean02();
   
    public static LogonDBBean02 getInstance() {
        return instance;
    }
   
    private LogonDBBean02() {
    }
   
    private Connection getConnection() throws Exception {
    	//String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";      
    	//pool2는 orauser01에 연결돼있음
    	return DriverManager.getConnection("jdbc:apache:commons:dbcp:/pool2");
    }
    //inputPro.jsp에서 회원가입을 할때 사용.
    public void insertMember(LogonDataBean02 member) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
       
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "insert into MEMBERS2(m_id, m_passwd, m_name, m_jumin1, m_jumin2, m_email" +
            ", m_blog, m_reg_date, m_zipcode, address) values (?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, member.getM_id());
            pstmt.setString(2, member.getM_passwd());
            pstmt.setString(3, member.getM_name());
            pstmt.setString(4, member.getM_jumin1());
            pstmt.setString(5, member.getM_jumin2());
            pstmt.setString(6, member.getM_email());
            pstmt.setString(7, member.getM_blog());
            pstmt.setTimestamp(8, member.getM_reg_date());
            pstmt.setString(9, member.getM_zipcode());
            pstmt.setString(10, member.getAddress());
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	JdbcUtil.close(pstmt);
        	JdbcUtil.close(conn);
        }
    }
    //loginPro.jsp에서 로그온을 시도할때 호출.
    public int userCheck(String id, String passwd) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;    
        ResultSet rs= null;
        
        String dbpasswd="";
        int x=-1;
        
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select m_passwd from MEMBERS2 where m_id = ?");
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();

            if(rs.next()){
				dbpasswd= rs.getString("m_passwd");
				if(dbpasswd.equals(passwd))
					x= 1; //인증 성공
				else
					x= 0; //비밀번호 틀림
			}else
					x= -1;//해당 아이디 없음

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	JdbcUtil.close(rs);
        	JdbcUtil.close(pstmt);
        	JdbcUtil.close(conn);
        }
        return x;
	}
    //confirmId.jsp에서 ID을 체크할때 사용.
	public int confirmId(String id) throws Exception {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs= null;
	    
	    int x=-1;
	       
	    try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement("select m_id from MEMBERS2 where m_id = ?");
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();

			if(rs.next())
				x= 1; //해당 아이디 있음
			else
				x= -1;//해당 아이디 없음
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	JdbcUtil.close(rs);
        	JdbcUtil.close(pstmt);
        	JdbcUtil.close(conn);
        	
        }
	return x;
	}
	
	//updateMember.jsp에서 수정폼에 가입된 회원의 정보를 보여줄때 사용.
    public LogonDataBean02 getMember(String id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        LogonDataBean02 member = null;
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement("select * from MEMBERS2 where m_id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new LogonDataBean02();
                member.setM_id(rs.getString("m_id"));
                member.setM_passwd(rs.getString("m_passwd"));
                member.setM_name(rs.getString("m_name"));
                member.setM_jumin1(rs.getString("m_jumin1"));
                member.setM_jumin2(rs.getString("m_jumin2"));
                member.setM_email(rs.getString("m_email"));
                member.setM_blog(rs.getString("m_blog"));
                member.setM_reg_date(rs.getTimestamp("m_reg_date"));    
                member.setM_zipcode(rs.getString("m_zipcode"));
                member.setAddress(rs.getString("address"));
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	JdbcUtil.close(rs);
        	JdbcUtil.close(pstmt);
        	JdbcUtil.close(conn);
        }
        return member;
    }
    
    public List<LogonDataBean02> getMemberList(int firstRow, int endRow)throws Exception {
    	Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<LogonDataBean02>  messageList = null;
		
		LogonDataBean02 member = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
				"select m_id, m_name, m_passwd, m_jumin1, m_jumin2, m_email, m_blog, m_reg_date, m_zipcode, address from "
				+ " (select rownum rnum, m_id, m_name, m_passwd, m_jumin1, m_jumin2, m_email, m_blog, m_reg_date, m_zipcode, address from  "
				+ " (select * from members2 m order by m.m_id desc) where rownum <= ? ) where rnum >= ?");
			/*	쿼리문이 실행되는 순서,
			 * 1. (select * from members2 m order by m.m_id desc)
			 * 
			 * 2. (select rownum rnum, m_id, m_name, m_passwd, m_jumin1, m_jumin2, m_email, m_blog, m_reg_date, m_zipcode, address from  "
				+ " (select * from members2 m order by m.m_id desc) where rownum <= ? )
				
			 * 3. select m_id, m_name, m_passwd, m_jumin1, m_jumin2, m_email, m_blog, m_reg_date, m_zipcode, address from "
				+ " (select rownum rnum, m_id, m_name, m_passwd, m_jumin1, m_jumin2, m_email, m_blog, m_reg_date, m_zipcode, address from  "
				+ " (select * from members2 m order by m.m_id desc) where rownum <= ? ) where rnum >= ?
				*/
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				messageList = new ArrayList<LogonDataBean02>();
				do {
					member = new LogonDataBean02();
	                member.setM_id(rs.getString("id"));
	                member.setM_passwd(rs.getString("passwd"));
	                member.setM_name(rs.getString("name"));
	                member.setM_jumin1(rs.getString("jumin1"));
	                member.setM_jumin2(rs.getString("jumin2"));
	                member.setM_email(rs.getString("email"));
	                member.setM_blog(rs.getString("blog"));
	                member.setM_reg_date(rs.getTimestamp("reg_date"));    
	                member.setM_zipcode(rs.getString("zipcode"));
	                member.setAddress(rs.getString("address"));
					messageList.add(member);
				} while (rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}	
	}
    
    public int selectCount() throws Exception {
    	Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from members2");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(conn);
		}
	}
    
    public void updateMember(LogonDataBean02 member) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
       
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
              "update MEMBERS2 set m_passwd=?,m_name=?,m_email=?,m_blog=?,m_zipcode=?,address=? " +
              " where m_id=?");
            pstmt.setString(1, member.getM_passwd());
            pstmt.setString(2, member.getM_name());
            pstmt.setString(3, member.getM_email());
            pstmt.setString(4, member.getM_blog());
            pstmt.setString(5, member.getM_zipcode());
            pstmt.setString(6, member.getAddress());
            pstmt.setString(7, member.getM_id());

            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	JdbcUtil.close(pstmt);
        	JdbcUtil.close(conn);
        }
    }
   
    public int deleteMember(String id, String passwd) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement(
            "select m_passwd from MEMBERS2 where m_id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
           
			if(rs.next()){
				dbpasswd= rs.getString("m_passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from MEMBERS2 where m_id=?");
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    x= 1; //회원탈퇴 성공
				}else
					x= 0; //비밀번호 틀림
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	JdbcUtil.close(rs);
        	JdbcUtil.close(pstmt);
        	JdbcUtil.close(conn);
        }
        return x;
    }
/*
    public Vector<ZipcodeBean> zipcodeRead(String area3)  {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector<ZipcodeBean> vecList = new Vector<ZipcodeBean>();
        try {
            con = getConnection();
            String strQuery = "select * from zipcode where area3 like '"+area3+"%'";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            while(rs.next()){
                ZipcodeBean tempZipcode = new ZipcodeBean();
                tempZipcode.setZipcode(rs.getString("zipcode"));
                tempZipcode.setArea1(rs.getString("area1"));
                tempZipcode.setArea2(rs.getString("area2"));
                tempZipcode.setArea3(rs.getString("area3"));
                tempZipcode.setArea4(rs.getString("area4"));
                vecList.addElement(tempZipcode);
            }

        }catch(Exception ex) {
            System.out.println("Exception" + ex);
        }finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (con != null) try { con.close(); } catch(SQLException ex) {}
        }
        return vecList;
    }
   
  //id찾기
  	public LogonDataBean findId(String name, String jumin1, String jumin2) throws Exception {
  		Connection conn = null;
  		PreparedStatement pstmt = null;
  		ResultSet rs = null;
  		LogonDataBean member = null;
  		int x=0;
  		
  		try {
  			conn = getConnection();
  			pstmt = conn.prepareStatement("select id from MEMBERS where name=? and jumin1=? and jumin2=?");
  			pstmt.setString(1, name);
  			pstmt.setString(2, jumin1);
  			pstmt.setString(3, jumin2);
  		
  			
  			rs = pstmt.executeQuery();
  			if(rs.next()) {  				
  				member = new LogonDataBean();
  				member.setId(rs.getString("id"));
  				
  			} else {
  			}
  		}catch(Exception ex) {
  			ex.printStackTrace();
  		}finally {
  			if(rs!=null)
  				try {rs.close();} catch(SQLException ex) {}
  			if(pstmt!=null)
  				try {pstmt.close();} catch(SQLException ex) {}
  			if(conn!=null)
  				try {conn.close();} catch(SQLException ex) {}
  		}
  		return member;
  	}
  	
  	
  	public LogonDataBean findPasswd(String id, String name, String jumin1) throws Exception {
  		Connection conn = null;
  		PreparedStatement pstmt = null;
  		ResultSet rs = null;
  		LogonDataBean member = null;
  		int x=0;
  		
  		try {
  			conn = getConnection();
  			pstmt = conn.prepareStatement("select passwd from MEMBERS where id=? and name=? and jumin1=?");
  			pstmt.setString(1, id);
  			pstmt.setString(2, name);
  			pstmt.setString(3, jumin1);
  		
  			
  			rs = pstmt.executeQuery();
  			if(rs.next()) {
  				member = new LogonDataBean();
  				member.setPasswd(rs.getString("passwd"));

  			} else {
  			}
  		}catch(Exception ex) {
  			ex.printStackTrace();
  		}finally {
  			if(rs!=null)
  				try {rs.close();} catch(SQLException ex) {}
  			if(pstmt!=null)
  				try {pstmt.close();} catch(SQLException ex) {}
  			if(conn!=null)
  				try {conn.close();} catch(SQLException ex) {}
  		}
  		return member;
  	}
*/  
    
}
