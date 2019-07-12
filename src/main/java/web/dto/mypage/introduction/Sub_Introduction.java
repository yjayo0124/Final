package web.dto.mypage.introduction;

public class Sub_Introduction {
	
	private int introduction_no;
	private String sub_introduction_title;
	private String sub_introduction_content;
	
	@Override
	public String toString() {
		return "Sub_Introduction [introduction_no=" + introduction_no + ", sub_introduction_title="
				+ sub_introduction_title + ", sub_introduction_content=" + sub_introduction_content + "]";
	}
	public int getIntroduction_no() {
		return introduction_no;
	}
	public void setIntroduction_no(int introduction_no) {
		this.introduction_no = introduction_no;
	}
	public String getSub_introduction_title() {
		return sub_introduction_title;
	}
	public void setSub_introduction_title(String sub_introduction_title) {
		this.sub_introduction_title = sub_introduction_title;
	}
	public String getSub_introduction_content() {
		return sub_introduction_content;
	}
	public void setSub_introduction_content(String sub_introduction_content) {
		this.sub_introduction_content = sub_introduction_content;
	}

}
