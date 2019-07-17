package web.dto;

public class Cor {

	private int cor_no;
	private String cor_name;
	private int cor_rgn;
	private String cor_addr;
	private int cor_classify;
	private int business_no;
	private String cor_type;
	private String cor_history;
	private int cor_mem;
	private int national_pension;
	private int cor_new_mem;
	private int cor_lev_mem;
	
	@Override
	public String toString() {
		return "Cor [cor_no=" + cor_no + ", cor_name=" + cor_name + ", cor_rgn=" + cor_rgn + ", cor_addr=" + cor_addr
				+ ", cor_classify=" + cor_classify + ", business_no=" + business_no + ", cor_type=" + cor_type
				+ ", cor_history=" + cor_history + ", cor_mem=" + cor_mem + ", national_pension=" + national_pension
				+ ", cor_new_mem=" + cor_new_mem + ", cor_lev_mem=" + cor_lev_mem + "]";
	}

	public int getCor_no() {
		return cor_no;
	}

	public void setCor_no(int cor_no) {
		this.cor_no = cor_no;
	}

	public String getCor_name() {
		return cor_name;
	}

	public void setCor_name(String cor_name) {
		this.cor_name = cor_name;
	}

	public int getCor_rgn() {
		return cor_rgn;
	}

	public void setCor_rgn(int cor_rgn) {
		this.cor_rgn = cor_rgn;
	}

	public String getCor_addr() {
		return cor_addr;
	}

	public void setCor_addr(String cor_addr) {
		this.cor_addr = cor_addr;
	}

	public int getCor_classify() {
		return cor_classify;
	}

	public void setCor_classify(int cor_classify) {
		this.cor_classify = cor_classify;
	}

	public int getBusiness_no() {
		return business_no;
	}

	public void setBusiness_no(int business_no) {
		this.business_no = business_no;
	}

	public String getCor_type() {
		return cor_type;
	}

	public void setCor_type(String cor_type) {
		this.cor_type = cor_type;
	}

	public String getCor_history() {
		return cor_history;
	}

	public void setCor_history(String cor_history) {
		this.cor_history = cor_history;
	}

	public int getCor_mem() {
		return cor_mem;
	}

	public void setCor_mem(int cor_mem) {
		this.cor_mem = cor_mem;
	}

	public int getNational_pension() {
		return national_pension;
	}

	public void setNational_pension(int national_pension) {
		this.national_pension = national_pension;
	}

	public int getCor_new_mem() {
		return cor_new_mem;
	}

	public void setCor_new_mem(int cor_new_mem) {
		this.cor_new_mem = cor_new_mem;
	}

	public int getCor_lev_mem() {
		return cor_lev_mem;
	}

	public void setCor_lev_mem(int cor_lev_mem) {
		this.cor_lev_mem = cor_lev_mem;
	}
	
}