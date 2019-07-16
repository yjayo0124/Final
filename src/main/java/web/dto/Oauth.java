package web.dto;

public class Oauth {

	private int member_no;
	private String social_token;
	private String social_id;
	private String social_email;
	private String social_name;
	
	
	@Override
	public String toString() {
		return "Oauth [member_no=" + member_no + ", social_token=" + social_token + ", social_id=" + social_id
				+ ", social_email=" + social_email + ", social_name=" + social_name + "]";
	}


	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public String getSocial_token() {
		return social_token;
	}


	public void setSocial_token(String social_token) {
		this.social_token = social_token;
	}


	public String getSocial_id() {
		return social_id;
	}


	public void setSocial_id(String social_id) {
		this.social_id = social_id;
	}


	public String getSocial_email() {
		return social_email;
	}


	public void setSocial_email(String social_email) {
		this.social_email = social_email;
	}


	public String getSocial_name() {
		return social_name;
	}


	public void setSocial_name(String social_name) {
		this.social_name = social_name;
	}
	
	
	
	
}
