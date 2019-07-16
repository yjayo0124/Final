package web.dto;

public class JobFair {
	private int jobfair_no;
	private String jobfair_name;
	private String jobfair_date;
	private String jobfair_start;
	private String jobfair_end;
	private String jobfair_loc;
	private String jobfair_content;
	private String jobfair_limit;
	private int member_no;
	
	@Override
	public String toString() {
		return "Jobfair [jobfair_no=" + jobfair_no + ", jobfair_name=" + jobfair_name + ", jobfair_date=" + jobfair_date
				+ ", jobfair_start=" + jobfair_start + ", jobfair_end=" + jobfair_end + ", jobfair_loc=" + jobfair_loc
				+ ", jobfair_content=" + jobfair_content + ", jobfair_limit=" + jobfair_limit + ", member_no="
				+ member_no + "]";
	}

	public int getJobfair_no() {
		return jobfair_no;
	}

	public void setJobfair_no(int jobfair_no) {
		this.jobfair_no = jobfair_no;
	}

	public String getJobfair_name() {
		return jobfair_name;
	}

	public void setJobfair_name(String jobfair_name) {
		this.jobfair_name = jobfair_name;
	}

	public String getJobfair_date() {
		return jobfair_date;
	}

	public void setJobfair_date(String jobfair_date) {
		this.jobfair_date = jobfair_date;
	}

	public String getJobfair_start() {
		return jobfair_start;
	}

	public void setJobfair_start(String jobfair_start) {
		this.jobfair_start = jobfair_start;
	}

	public String getJobfair_end() {
		return jobfair_end;
	}

	public void setJobfair_end(String jobfair_end) {
		this.jobfair_end = jobfair_end;
	}

	public String getJobfair_loc() {
		return jobfair_loc;
	}

	public void setJobfair_loc(String jobfair_loc) {
		this.jobfair_loc = jobfair_loc;
	}

	public String getJobfair_content() {
		return jobfair_content;
	}

	public void setJobfair_content(String jobfair_content) {
		this.jobfair_content = jobfair_content;
	}

	public String getJobfair_limit() {
		return jobfair_limit;
	}

	public void setJobfair_limit(String jobfair_limit) {
		this.jobfair_limit = jobfair_limit;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
}
