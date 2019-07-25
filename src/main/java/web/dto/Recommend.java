package web.dto;

public class Recommend {

	private int review_no;
	private int mem_no;
	private int recommend_check;
	
	@Override
	public String toString() {
		return "Recommend [review_no=" + review_no + ", mem_no=" + mem_no + ", recommend_check=" + recommend_check
				+ "]";
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getRecommend_check() {
		return recommend_check;
	}

	public void setRecommend_check(int recommend_check) {
		this.recommend_check = recommend_check;
	}
	
}
