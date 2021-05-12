package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	// 고유 이메일해쉬 가져오기
	public String getHash(String userID) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		String Hash=null;
		
		try {
        	String sql = "SELECT EmailHash FROM USER WHERE ID=?";
            
            conn = DatabaseUtil.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	Hash=rs.getString("EmailHash");
            	return Hash;
            }
            else
            	return Hash;
    		
        } catch(Exception e){
			e.printStackTrace();
		} finally {
			try{if(conn!=null) conn.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(pstmt!=null) pstmt.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(rs!=null) rs.close();}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return Hash;
	}
	
	// 아이디 찾기
	public String idFind(String name, String email) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbID=null;
        
        try {
        	String sql = "SELECT ID FROM USER WHERE Email=? AND Name=?";
            
            conn = DatabaseUtil.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, name);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	dbID=rs.getString("ID");
            	return dbID;
            }
            else
            	return dbID;
    		
        } catch(Exception e){
			e.printStackTrace();
		} finally {
			try{if(conn!=null) conn.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(pstmt!=null) pstmt.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(rs!=null) rs.close();}catch (Exception e) {
				e.printStackTrace();
			}
		}
        return dbID;
	}
	
	
	// 비밀번호 찾기
		public String pwFind(String name, String email, String id) {
			Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String dbPW=null;
	        
	        try {
	        	String sql = "SELECT PW FROM USER WHERE Email=? AND Name=? AND ID=?";
	            
	            conn = DatabaseUtil.getConnection();
	            pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, email);
	            pstmt.setString(2, name);
	            pstmt.setString(3, id);
	            rs = pstmt.executeQuery();
	            
	            if(rs.next()) {
	            	dbPW=rs.getString("PW");
	            	return dbPW;
	            }
	            else
	            	return dbPW;
	    		
	        } catch(Exception e){
				e.printStackTrace();
			} finally {
				try{if(conn!=null) conn.close();}catch (Exception e) {
					e.printStackTrace();
				}
				try{if(pstmt!=null) pstmt.close();}catch (Exception e) {
					e.printStackTrace();
				}
				try{if(rs!=null) rs.close();}catch (Exception e) {
					e.printStackTrace();
				}
			}
	        return dbPW;
		}
		
		
	
	// 로그인
	public int login(String ID, String pw) {
		
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int dbEC=0;
        int x = -1;
 
        try {
            String sql = "SELECT PW FROM USER WHERE ID=?";
            
            conn = DatabaseUtil.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, ID);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입력된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("PW"); // 비번을 변수에 넣는다.
                
 
                if (dbPW.equals(pw)) // DB에서 넘겨받은 비밀번호과 입력한 비밀번호 비교. 같으면 이메일인증(EmailChecked) 확인으로 넘어감
                {               	
                	sql = "SELECT EmailChecked FROM USER WHERE ID=?";
                    
                	pstmt.close();
                    pstmt=conn.prepareStatement(sql);
                    pstmt.setString(1, ID);
                    rs.close();
                    rs = pstmt.executeQuery();
                    rs.next();
                    dbEC=rs.getInt("EmailChecked");
                    
                	if(dbEC==1) // EmailChecked 1이면 이메일 인증 했으면 성공
                		x = 1; 
                	else
                		x=2;
                }
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름
                
            }
            else {
                x = -1; // 해당 아이디가 없을 경우
            }
 
            return x;
 
        } catch(Exception e){
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(pstmt!=null) pstmt.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(rs!=null) rs.close();}catch (Exception e) {
				e.printStackTrace();
			}
		}
        return -1;
	}
	
	
	// 회원가입
	public int signUp(UserDTO user) {
		
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        
		try {
			String dbID=user.getID();
			String sql = "SELECT ID FROM USER WHERE ID=?";
			conn = DatabaseUtil.getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, user.getID());
            rs=pstmt.executeQuery();
            
            if(rs.next())	// 아이디 중복 시 -1 반환
            	return -1;
            else {
            	String dbEmail=user.getEmail();
            	sql = "SELECT Email FROM USER WHERE Email=?";
            	pstmt.close();
            	pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, user.getEmail());
	            rs.close();
	            rs=pstmt.executeQuery();
            	if(rs.next())		// 이메일 중복 시 -2 반환
            	{
            		return -2;
            	}
            	else {				// 아이디, 이메일 중복x
            		sql = "INSERT INTO USER VALUES(?,?,?,?,false,?,10000)";
        			pstmt=conn.prepareStatement(sql);
        			pstmt.setString(1, user.getID());
        			pstmt.setString(2, user.getPW());
        			pstmt.setString(3, user.getEmail());
        			pstmt.setString(4, user.getEmailHash());
        			pstmt.setString(5, user.getName());
        			pstmt.setInt(6, user.getPoint());
        			return pstmt.executeUpdate();
            	}
            }
			
		}
		catch(Exception e){
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(pstmt!=null) pstmt.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(rs!=null) rs.close();}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -3;		 // 데이터 오류 시 -3 반환
	}
	
	// 이메일
	public String getEmail(String ID) {
		String SQL = "SELECT Email FROM USER WHERE ID = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(pstmt!=null) pstmt.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(rs!=null) rs.close();}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null; //데이터베이스 오류
	}
	
	
	// 이메일 체크
	public boolean getEmailChecked(String userID) {
		String SQL = "SELECT EmailChecked FROM USER WHERE ID = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(pstmt!=null) pstmt.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(rs!=null) rs.close();}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false; //데이터베이스 오류
	}
	
	
	public boolean setEmailChecked(String userID) {
		String SQL = "UPDATE USER SET EmailChecked = true WHERE ID= ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true; //Insert, Update,Delete 는 executeUpdate 이용, 실제로 영향을 받은 데이터 갯수를 반환
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null) conn.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(pstmt!=null) pstmt.close();}catch (Exception e) {
				e.printStackTrace();
			}
			try{if(rs!=null) rs.close();}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false; //데이터베이스 오류
	}
}
