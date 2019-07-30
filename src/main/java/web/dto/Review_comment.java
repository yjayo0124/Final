package web.dto;

import java.util.Date;

public class Review_comment {
	private int comment_no;
	private int review_no;
	private String comment_nick;
	private String comment_content;
	private int comment_password;
	private Date comment_written_date;
	private int comment_recommend;
	private int comment_check_recommend;
	
	@Override
	public String toString() {
		return "Review_comment [comment_no=" + comment_no + ", review_no=" + review_no + ", comment_nick="
				+ comment_nick + ", comment_content=" + comment_content + ", comment_password=" + comment_password
				+ ", comment_written_date=" + comment_written_date + ", comment_recommend=" + comment_recommend
				+ ", comment_check_Recommend=" + comment_check_recommend + "]";
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getComment_nick() {
		return comment_nick;
	}

	public void setComment_nick(String comment_nick) {
		this.comment_nick = comment_nick;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public int getComment_password() {
		return comment_password;
	}

	public void setComment_password(int comment_password) {
		this.comment_password = comment_password;
	}

	public Date getComment_written_date() {
		return comment_written_date;
	}

	public void setComment_written_date(Date comment_written_date) {
		this.comment_written_date = comment_written_date;
	}

	public int getComment_recommend() {
		return comment_recommend;
	}

	public void setComment_recommend(int comment_recommend) {
		this.comment_recommend = comment_recommend;
	}

	public int getComment_check_recommend() {
		return comment_check_recommend;
	}

	public void setComment_check_recommend(int comment_check_recommend) {
		this.comment_check_recommend = comment_check_recommend;
	}
	
}