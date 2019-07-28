package web.service.review.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.review.face.ReviewDao;
import web.dto.Cor;
import web.dto.Recommend;
import web.dto.Review;
import web.dto.Review_comment;
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
	public List<HashMap<String, Object>> tagSearch(Paging paging) {
		if(paging.getTag().equalsIgnoreCase("전체")) {
			return reviewDao.selectReview(paging);
		} else if(paging.getTag().equalsIgnoreCase("강추") ||
				paging.getTag().equalsIgnoreCase("비추") ||
				paging.getTag().equalsIgnoreCase("취업고민")) {
			return reviewDao.selectReviewByTag(paging);
		} else {
			return reviewDao.searchReview(paging);
		}
	}

	@Override
	public String getTag(String review_tag) {
		String param = review_tag;
		
		return param;
	}

	@Override
	public List<HashMap<String, Object>> reviewSearch(Paging paging) {
		return reviewDao.searchReview(paging);
	}

	@Override
	public List<HashMap<String, Object>> getViewList(int reviewno) {
		return reviewDao.selectViewList(reviewno);
	}

	@Override
	public void upHit(int reviewno) {
		reviewDao.addHit(reviewno);
	}

	@Override
	public void updateLike(int reviewno, int changeno) {
		if(changeno == 0) {
			reviewDao.addLike(reviewno);
//			reviewDao.insertRecommend(reviewno, changeno, memno);
		} else {
			reviewDao.minLike(reviewno);
		}
	}

	@Override
	public int selectLike(int reviewno) {
		return reviewDao.selectLike(reviewno);
	}

	@Override
	public List<Recommend> updateRecommend(Recommend recommend, int reviewno, int changeno, int memno) {
		int checkResult = 0;
		List<Recommend> check = reviewDao.scanRecommend(memno);
		System.out.println(check);
		System.out.println("reviewno : " +reviewno);
		System.out.println("changeno : " +changeno);
		System.out.println("memno : " +memno);
		for(int i = 0; i < check.size(); i++) {
			if(check.get(i).getReview_no() == reviewno && check.get(i).getMem_no() == memno) {
				checkResult = 1;
			} else if(check.get(i).getReview_no() != reviewno && check.get(i).getMem_no() == memno && changeno == 0) {
				checkResult = 2;
			}  else if(check.get(i).getReview_no() != reviewno && check.get(i).getMem_no() != memno && changeno == 0) {
				checkResult = 2;
			}
		}
		if(check.isEmpty()) {
			checkResult = 2;
		}
		System.out.println(checkResult);
		recommend.setMem_no(memno);
		recommend.setReview_no(reviewno);
		recommend.setRecommend_check(changeno);
		
		if(checkResult == 2) {
			reviewDao.deleteRecommend(recommend);
			reviewDao.insertRecommend(recommend);
			return check;
		} else if(checkResult == 1 && changeno == 0){
			reviewDao.addRecommend(recommend);
			return check;
		} else {
			reviewDao.deleteRecommend(recommend);
			return check;
		}
	}

	@Override
	public List<Recommend> getRecommend() {
		return reviewDao.selectRecommend();
	}

	@Override
	public Review_comment getCommentParameter(HttpServletRequest request, Review_comment commentParam) {
		String reviewno = request.getParameter("reviewno");
		String cmtnick = request.getParameter("cmtnick");
		String cmtcontent  = request.getParameter("cmtcontent");
		String cmtpassword = request.getParameter("cmtpassword");
		int no = Integer.parseInt(reviewno);
		int password = Integer.parseInt(cmtpassword);

		commentParam.setReview_no(no);
		commentParam.setComment_nick(cmtnick);
		commentParam.setComment_content(cmtcontent);
		commentParam.setComment_password(password);
		
		return commentParam;
	}

	@Override
	public void InsertComment(Review_comment comment) {
		reviewDao.InsertComment(comment);
	}

	@Override
	public List<Review_comment> getComment(int reviewno) {
		return reviewDao.getComment(reviewno);
	}

	@Override
	public List<Review_comment> getNewComment(int reviewno) {
		return reviewDao.getNewComment(reviewno);
	}

}
