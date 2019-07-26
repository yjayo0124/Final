package web.service.review.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Recommend;
import web.dto.Review;
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

	public List<Review> getViewList(int reviewno);

	public void upHit(int reviewno);

	public void updateLike(int reviewno, int changeno);

	public int selectLike(int reviewno);

	public List<Recommend> updateRecommend(Recommend recommend, int reviewno, int changeno, int memno);

	public List<Recommend> getRecommend();
}
