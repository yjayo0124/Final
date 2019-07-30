package web.dto;

public class Comment_recommend {
	private int comment_no;
	private int mem_no;
	private int recommend_check;
	
	@Override
	public String toString() {
		return "Comment_recommend [comment_no=" + comment_no + ", mem_no=" + mem_no + ", recommend_check="
				+ recommend_check + "]";
	}
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
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