package web.dto.mypage.resume;


public class Career {
	
	private int resume_no;
	private String company_name;
	private String department_name;
	private String hire_date;
	private String retirement_date;
	private String served_status;
	private String position;
	private String job_work;
	private int salary;
	private String assigned_task;
	
	@Override
	public String toString() {
		return "Career [resume_no=" + resume_no + ", company_name=" + company_name + ", department_name="
				+ department_name + ", hire_date=" + hire_date + ", retirement_date=" + retirement_date
				+ ", served_status=" + served_status + ", position=" + position + ", "
				+ ", job_work=" + job_work + ", salary=" + salary + ", assigned_task="
				+ assigned_task + "]";
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
	public String getRetirement_date() {
		return retirement_date;
	}
	public void setRetirement_date(String retirement_date) {
		this.retirement_date = retirement_date;
	}
	public String getServed_status() {
		return served_status;
	}
	public void setServed_status(String served_status) {
		this.served_status = served_status;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getJob_work() {
		return job_work;
	}
	public void setJob_work(String job_work) {
		this.job_work = job_work;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getAssigned_task() {
		return assigned_task;
	}
	public void setAssigned_task(String assigned_task) {
		this.assigned_task = assigned_task;
	}
	
}
