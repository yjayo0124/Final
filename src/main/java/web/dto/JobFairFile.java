package web.dto;

import java.util.Date;

public class JobFairFile {
	
	private int jobfair_file_no;
	private String jobfair_file_storedname;
	private String jobfair_file_originname;
	private Date jobfair_file_upload_date;
	private int jobfair_no;
	
	@Override
	public String toString() {
		return "JobFairFile [jobfair_file_no=" + jobfair_file_no + ", jobfair_file_storedname="
				+ jobfair_file_storedname + ", jobfair_file_originname=" + jobfair_file_originname
				+ ", jobfair_file_upload_date=" + jobfair_file_upload_date + ", jobfair_no=" + jobfair_no + "]";
	}

	public int getJobfair_file_no() {
		return jobfair_file_no;
	}

	public void setJobfair_file_no(int jobfair_file_no) {
		this.jobfair_file_no = jobfair_file_no;
	}

	public String getJobfair_file_storedname() {
		return jobfair_file_storedname;
	}

	public void setJobfair_file_storedname(String jobfair_file_storedname) {
		this.jobfair_file_storedname = jobfair_file_storedname;
	}

	public String getJobfair_file_originname() {
		return jobfair_file_originname;
	}

	public void setJobfair_file_originname(String jobfair_file_originname) {
		this.jobfair_file_originname = jobfair_file_originname;
	}

	public Date getJobfair_file_upload_date() {
		return jobfair_file_upload_date;
	}

	public void setJobfair_file_upload_date(Date jobfair_file_upload_date) {
		this.jobfair_file_upload_date = jobfair_file_upload_date;
	}

	public int getJobfair_no() {
		return jobfair_no;
	}

	public void setJobfair_no(int jobfair_no) {
		this.jobfair_no = jobfair_no;
	}
	
}
