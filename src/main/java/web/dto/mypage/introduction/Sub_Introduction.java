package web.dto.mypage.introduction;

public class Sub_Introduction {
	
	private int numbers;
	private int introduction_no;
	private String sub_introduction_question;
	private String sub_introduction_content;
	
	@Override
	public String toString() {
		return "Sub_Introduction [numbers=" + numbers + ", introduction_no=" + introduction_no
				+ ", sub_introduction_question=" + sub_introduction_question + ", sub_introduction_content="
				+ sub_introduction_content + "]";
	}
	public int getNumbers() {
		return numbers;
	}
	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}
	public int getIntroduction_no() {
		return introduction_no;
	}
	public void setIntroduction_no(int introduction_no) {
		this.introduction_no = introduction_no;
	}
	public String getSub_introduction_question() {
		return sub_introduction_question;
	}
	public void setSub_introduction_question(String sub_introduction_question) {
		this.sub_introduction_question = sub_introduction_question;
	}
	public String getSub_introduction_content() {
		return sub_introduction_content;
	}
	public void setSub_introduction_content(String sub_introduction_content) {
		this.sub_introduction_content = sub_introduction_content;
	}

}
