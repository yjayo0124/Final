package web.service.review.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Cor;
import web.dto.Recommend;
import web.dto.Review;
import web.dto.Review_comment;
import web.util.Paging;

public interface ReviewService {

	public int getCorno(String selectCor);

	public void write(Review review);

	public String scanTable(String result);

	public List<HashMap<String, Object>> getReviewList(Paging paging);

	public Paging getCurPage(HttpServletRequest request);

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

}
