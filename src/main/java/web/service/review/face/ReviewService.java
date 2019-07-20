package web.service.review.face;

import java.util.List;

import web.dto.Review;

public interface ReviewService {

	public int getCorno(String selectCor);

	public void write(Review review);

	public String scanTable(String result);

	public List<Review> getReviewList();

}
