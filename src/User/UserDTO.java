package User;

public class UserDTO {
	String ID;
	String PW;
	String Email;
	String EmailHash;
	boolean EmailChecked;
	String Name;
	int point = 10000;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPW() {
		return PW;
	}
	public void setPW(String pW) {
		PW = pW;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getEmailHash() {
		return EmailHash;
	}
	public void setEmailHash(String emailHash) {
		EmailHash = emailHash;
	}
	public boolean isEmailChecked() {
		return EmailChecked;
	}
	public void setEmailChecked(boolean emailChecked) {
		EmailChecked = emailChecked;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public UserDTO(String iD, String pW, String email, String emailHash, boolean emailChecked, String name, int point) {
		super();
		this.ID = iD;
		this.PW = pW;
		this.Email = email;
		this.EmailHash = emailHash;
		this.EmailChecked = emailChecked;
		this.Name = name;
		this.point = point;
	}
	public UserDTO() {
		
	}
}
