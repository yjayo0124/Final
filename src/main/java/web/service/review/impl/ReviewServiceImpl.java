package web.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.review.face.ReviewDao;
import web.dto.Review;
import web.service.review.face.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired ReviewDao reviewDao;

	@Override
	public int getCorno(String selectCor) {
		return reviewDao.selectCorno(selectCor);
		
	}
	
	@Override
	public void write(Review review) {
		reviewDao.insertReview(review);	
	}

	@Override
	public String scanTable(String result) {
		return reviewDao.selectCor(result);
	}

	@Override
	public List<Review> getReviewList() {
		return reviewDao.selectReview();
	}

}
