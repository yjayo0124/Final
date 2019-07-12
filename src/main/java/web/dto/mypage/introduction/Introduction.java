package web.dto.mypage.introduction;

import java.util.Date;

public class Introduction {
	private int introduction_no;
	private int member_no;
	private int main_introduction;
	private String introduction_title;
	private String introduction_question;
	private String introduction_content;
	private Date introduction_writendate;
	
	@Override
	public String toString() {
		return "Introduction [introduction_no=" + introduction_no + ", member_no=" + member_no + ", main_introduction="
				+ main_introduction + ", introduction_title=" + introduction_title + ", introduction_question="
				+ introduction_question + ", introduction_content=" + introduction_content
				+ ", introduction_writendate=" + introduction_writendate + "]";
	}
	public int getIntroduction_no() {
		return introduction_no;
	}
	public void setIntroduction_no(int introduction_no) {
		this.introduction_no = introduction_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getMain_introduction() {
		return main_introduction;
	}
	public void setMain_introduction(int main_introduction) {
		this.main_introduction = main_introduction;
	}
	public String getIntroduction_title() {
		return introduction_title;
	}
	public void setIntroduction_title(String introduction_title) {
		this.introduction_title = introduction_title;
	}
	public String getIntroduction_question() {
		return introduction_question;
	}
	public void setIntroduction_question(String introduction_question) {
		this.introduction_question = introduction_question;
	}
	public String getIntroduction_content() {
		return introduction_content;
	}
	public void setIntroduction_content(String introduction_content) {
		this.introduction_content = introduction_content;
	}
	public Date getIntroduction_writendate() {
		return introduction_writendate;
	}
	public void setIntroduction_writendate(Date introduction_writendate) {
		this.introduction_writendate = introduction_writendate;
	}
	
	
}
