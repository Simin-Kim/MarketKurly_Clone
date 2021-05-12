package fund;

public class FundDTO {
	
	int contentID;
	String userID;
	String fundTitle;
	String fundContent;
	int goal;
	int recent;
	int likeCount;
	String writeDate;
	String endDate;
	String type;
	int investor;
	public int getContentID() {
		return contentID;
	}
	public void setContentID(int contentID) {
		this.contentID = contentID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getFundTitle() {
		return fundTitle;
	}
	public void setFundTitle(String fundTitle) {
		this.fundTitle = fundTitle;
	}
	public String getFundContent() {
		return fundContent;
	}
	public void setFundContent(String fundContent) {
		this.fundContent = fundContent;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getRecent() {
		return recent;
	}
	public void setRecent(int recent) {
		this.recent = recent;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getInvestor() {
		return investor;
	}
	public void setInvestor(int investor) {
		this.investor = investor;
	}
	public FundDTO()
	{
		
	}
	public FundDTO(int contentID, String userID, String fundTitle, String fundContent, int goal, int recent,
			int likeCount, String writeDate, String endDate, String type, int investor) {
		super();
		this.contentID = contentID;
		this.userID = userID;
		this.fundTitle = fundTitle;
		this.fundContent = fundContent;
		this.goal = goal;
		this.recent = recent;
		this.likeCount = likeCount;
		this.writeDate = writeDate;
		this.endDate = endDate;
		this.type = type;
		this.investor = investor;
	}
	
}