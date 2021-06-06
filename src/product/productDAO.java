package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.text.SimpleDateFormat;
import util.DatabaseUtil;

public class productDAO {

	public void setRestDay() {
		Connection conn = null;
        conn = DatabaseUtil.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		String sql=null;
		
		Date today=new Date();
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-mm-dd");	
		String sfToday=sf.format(today);
		
		try {
			
			sql="SELECT * FROM FUNDCONTENT WHERE CURDATE IS NULL";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				sql="UPDATE FUNDCONTENT SET CURDATE=DATE(NOW())";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.clearParameters();  
				
				sql= "UPDATE FUNDCONTENT SET RESTDATE=DATEDIFF(ENDDATE,CURDATE)";
				pstmt.clearParameters();
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.clearParameters();
				
				return;
			}
			
			sql="SELECT * FROM FUNDCONTENT";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			String curDate=rs.getString("curDate");
			
			if(!(curDate.equals(sfToday))) {
				sql="UPDATE FUNDCONTENT SET CURDATE=DATE(NOW())";
				pstmt.clearParameters();  
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.clearParameters();  
				
				sql= "UPDATE FUNDCONTENT SET RESTDATE=DATEDIFF(ENDDATE,CURDATE)";
				pstmt.clearParameters();
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
	}
	
	
	
	
	
}
