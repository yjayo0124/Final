package web.dto;

import java.util.Date;

public class Review {
	
	private int review_no;
	private int cor_no;
	private int mem_no;
	private String review_tag;
	private String review_title;
	private String review_content;
	private int review_recommended;
	private int review_hit;
	private Date review_written_date;
	private int review_check;
	
	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", cor_no=" + cor_no + ", mem_no=" + mem_no + ", review_tag="
				+ review_tag + ", review_title=" + review_title + ", review_content=" + review_content
				+ ", review_recommended=" + review_recommended + ", review_hit=" + review_hit + ", review_written_date="
				+ review_written_date + ", review_check=" + review_check + "]";
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getCor_no() {
		return cor_no;
	}

	public void setCor_no(int cor_no) {
		this.cor_no = cor_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getReview_tag() {
		return review_tag;
	}

	public void setReview_tag(String review_tag) {
		this.review_tag = review_tag;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_recommended() {
		return review_recommended;
	}

	public void setReview_recommended(int review_recommended) {
		this.review_recommended = review_recommended;
	}

	public int getReview_hit() {
		return review_hit;
	}

	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}

	public Date getReview_written_date() {
		return review_written_date;
	}

	public void setReview_written_date(Date review_written_date) {
		this.review_written_date = review_written_date;
	}

	public int getReview_check() {
		return review_check;
	}

	public void setReview_check(int review_check) {
		this.review_check = review_check;
	}
	
}