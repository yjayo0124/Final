package web.service.review.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Comment_recommend;
import web.dto.Cor;
import web.dto.Recommend;
import web.dto.Review;
import web.dto.Review_comment;
import web.util.Review.Paging;

public interface ReviewService {

	public int getCorno(Cor cor);

	public void write(Review review);

	public String scanTable(String result);

	public List<HashMap<String, Object>> getReviewList(Paging paging);

	public Paging getCurPage(HttpServletRequest request, String tag);

	public List<HashMap<String, Object>> tagSearch(Paging paging);

	public String getTag(String review_tag);

	public List<HashMap<String, Object>> reviewSearch(Paging paging);

	public List<HashMap<String, Object>> getViewList(int reviewno);

	public void upHit(int reviewno);

	public void updateLike(int reviewno, int changeno);

	public int selectLike(int reviewno);

	public List<Recommend> updateRecommend(Recommend recommend, int reviewno, int changeno, int memno);

	public List<Recommend> getRecommend();

	public Review_comment getCommentParameter(HttpServletRequest request, Review_comment commentParam);

	public void InsertComment(Review_comment comment);

	public List<Review_comment> getComment(int reviewno);

	public List<Review_comment> getNewComment(int reviewno);

	public Review_comment getDeleteParameter(HttpServletRequest request, Review_comment commentParam);

	public void deleteNewComment(Review_comment deletecomment);

	public void deleteComment(Review_comment deletecomment);

	public Comment_recommend commentRecommed(HttpServletRequest request, Comment_recommend recommendParam);
	
	public Review_comment Recommed(HttpServletRequest request, Review_comment commentParam);

	public void updateCommentRecommend(Review_comment commentRecommend);

	public List<Comment_recommend> checkCommentRecommend(Comment_recommend recommend);

	public int selectCommentLike(Review_comment commentRecommend);

	public List<Comment_recommend> getCommentRecommend();

	public List<Review> getUpdateReviewList(int reviewno);

	public Review getUpdateParam(HttpServletRequest request, Review review);

	public void UpdateReview(Review getParam);

	public void deleteReviewComment(int reviewno);
	
	public void deleteReview(int reviewno);

	public int formatCorno(String cor_no);

	public int getCornoByname(String selectCor);

}
