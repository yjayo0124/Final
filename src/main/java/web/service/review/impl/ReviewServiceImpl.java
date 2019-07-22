package web.service.review.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.review.face.ReviewDao;
import web.dto.Review;
import web.service.review.face.ReviewService;
import web.util.Paging;

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
	public List<HashMap<String, Object>> getReviewList(Paging paging) {
		return reviewDao.selectReview(paging);
	}
	
	@Override
	public Paging getCurPage(HttpServletRequest request) {
		// 전달파라미터 curPage 파싱
		String param = request.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		
		// 전체 게시글 수
		int totalCount = reviewDao.selectCntAll();
		
		// 페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> tagSearch(String result) {
		return reviewDao.selectReviewByTag(result);
	}

}
