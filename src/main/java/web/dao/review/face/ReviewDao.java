package web.dao.review.face;

import java.util.List;

import web.dto.Review;

public interface ReviewDao {

	public int selectCorno(String selectCor);
	
	public void insertReview(Review review);

	public String selectCor(String result);

	public List<Review> selectReview();


}
