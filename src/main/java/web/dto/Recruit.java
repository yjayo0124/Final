package web.dto;

public class Recruit {
	private int recruit_no;
	private String recruit_name;
	private String recruit_title;
	private String recruit_career;
	private String recruit_educareer;
	private String recruit_certificate;
	private String recruit_major;
	private String recruit_type;
	private int recruit_sal;
	private String recruit_position;
	private String recruit_content;
	private String recruit_loc;
	private int member_no;

	@Override
	public String toString() {
		return "Recruit [recruit_no=" + recruit_no + ", recruit_name=" + recruit_name + ", recruit_title="
				+ recruit_title + ", recruit_career=" + recruit_career + ", recruit_educareer=" + recruit_educareer
				+ ", recruit_certificate=" + recruit_certificate + ", recruit_major=" + recruit_major
				+ ", recruit_type=" + recruit_type + ", recruit_sal=" + recruit_sal + ", recruit_position="
				+ recruit_position + ", recruit_content=" + recruit_content + ", recruit_loc=" + recruit_loc
				+ ", member_no=" + member_no + "]";
	}

	public int getRecruit_no() {
		return recruit_no;
	}

	public void setRecruit_no(int recruit_no) {
		this.recruit_no = recruit_no;
	}

	public String getRecruit_name() {
		return recruit_name;
	}

	public void setRecruit_name(String recruit_name) {
		this.recruit_name = recruit_name;
	}

	public String getRecruit_title() {
		return recruit_title;
	}

	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}

	public String getRecruit_career() {
		return recruit_career;
	}

	public void setRecruit_career(String recruit_career) {
		this.recruit_career = recruit_career;
	}

	public String getRecruit_educareer() {
		return recruit_educareer;
	}

	public void setRecruit_educareer(String recruit_educareer) {
		this.recruit_educareer = recruit_educareer;
	}

	public String getRecruit_certificate() {
		return recruit_certificate;
	}

	public void setRecruit_certificate(String recruit_certificate) {
		this.recruit_certificate = recruit_certificate;
	}

	public String getRecruit_major() {
		return recruit_major;
	}

	public void setRecruit_major(String recruit_major) {
		this.recruit_major = recruit_major;
	}

	public String getRecruit_type() {
		return recruit_type;
	}

	public void setRecruit_type(String recruit_type) {
		this.recruit_type = recruit_type;
	}

	public int getRecruit_sal() {
		return recruit_sal;
	}

	public void setRecruit_sal(int recruit_sal) {
		this.recruit_sal = recruit_sal;
	}

	public String getRecruit_position() {
		return recruit_position;
	}

	public String getRecruit_content() {
		return recruit_content;
	}

	public void setRecruit_content(String recruit_content) {
		this.recruit_content = recruit_content;
	}

	public void setRecruit_position(String recruit_position) {
		this.recruit_position = recruit_position;
	}

	public String getRecruit_loc() {
		return recruit_loc;
	}

	public void setRecruit_loc(String recruit_loc) {
		this.recruit_loc = recruit_loc;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	
	
	
}
