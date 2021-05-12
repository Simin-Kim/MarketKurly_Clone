package fund;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class FundDAO {
	public int write(FundDTO fundDTO) {
		String SQL = "INSERT INTO fundContent VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fundDTO.getUserID());
			pstmt.setString(2, fundDTO.getFundTitle());
			pstmt.setString(3, fundDTO.getFundContent());
			pstmt.setInt(4, fundDTO.getGoal());
			pstmt.setInt(5, fundDTO.getRecent());
			pstmt.setInt(6, fundDTO.getLikeCount());
			pstmt.setString(7, fundDTO.getWriteDate());
			pstmt.setString(8, fundDTO.getEndDate());
			pstmt.setString(9, fundDTO.getType());
			pstmt.setInt(10, fundDTO.getInvestor());
			return pstmt.executeUpdate(); 
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
		return -1; //데이터베이스 오류
	}
	public ArrayList<FundDTO> getList(String type, String searchType, String search, int pageNumber){
		if(type.equals("전체")) {
			type="";
		}
		ArrayList<FundDTO> FundList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("최신순"))
			{
				SQL = "SELECT * FROM FUNDCONTENT WHERE type LIKE ? AND CONCAT(fundTitle, fundContent) LIKE " + 
						"? ORDER BY contentID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if (searchType.equals("추천순")) {
				SQL = "SELECT * FROM FUNDCONTENT WHERE type LIKE ? AND CONCAT(funTitle, fundContent) LIKE " + 
						"? ORDER BY likeCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if(searchType.equals("참여자순")) {
				SQL = "SELECT * FROM FUNDCONTENT WHERE type LIKE ? AND CONCAT(funTitle, fundContent) LIKE " + 
						"? ORDER BY investor DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}  else if(searchType.equals("달성률순")) {
				SQL = "SELECT * FROM FUNDCONTENT WHERE type LIKE ? AND CONCAT(funTitle, fundContent) LIKE " + 
						"? ORDER BY ((recent/goal) * 100) DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6; //  모금액 순 = 현재/목표 * 100 
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + type + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery(); // 데이터베이스에서 검색 조회
			FundList = new ArrayList<FundDTO>();
			while(rs.next()) {
					FundDTO fund = new FundDTO(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getInt(5),
							rs.getInt(6),
							rs.getInt(7),
							rs.getString(8),
							rs.getString(9),
							rs.getString(10),
							rs.getInt(11)
					);
					FundList.add(fund);
				}
			}
		catch (Exception e) {
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
		return FundList;
}
	
	public int like(String contentID) {
		String SQL = "UPDATE FUNDCONTENT SET likeCount = likeCount + 1 WHERE contentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(contentID));
			return pstmt.executeUpdate();
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
		return -1; //데이터베이스 오류
	}
	public int delete(String contentID) {
		String SQL = "DELETE FROM FUNDCOTENT WHERE contentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(contentID));
			return pstmt.executeUpdate();
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
		return -1; //데이터베이스 오류
	}
	public String getUserID(String contentID) {
		String SQL = "SELECT userID FROM FUNDCONTENT WHERE contentID = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(contentID));
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
		return null; //존재하지 않는 게시글
}
}
