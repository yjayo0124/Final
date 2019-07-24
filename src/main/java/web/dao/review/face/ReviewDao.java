package web.dao.review.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Review;
import web.util.Paging;

public interface ReviewDao {

	public int selectCorno(String selectCor);
	
	public void insertReview(Review review);

	public String selectCor(String result);

	public List<HashMap<String, Object>> selectReview(Paging paging);

	public int selectCntAll();

	public List<HashMap<String, Object>> selectReviewByTag(Paging paging);

	public List<HashMap<String, Object>> searchReview(Paging paging);

	public List<Review> selectViewList(int reviewno);

	public void addHit(int reviewno);


}
