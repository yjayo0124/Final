package web.service.review.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.review.face.ReviewDao;
import web.dto.Comment_recommend;
import web.dto.Cor;
import web.dto.Recommend;
import web.dto.Review;
import web.dto.Review_comment;
import web.service.review.face.ReviewService;
import web.util.Review.Paging;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired ReviewDao reviewDao;

	@Override
	public int getCorno(Cor cor) {
		return reviewDao.selectCorno(cor);
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
	public Paging getCurPage(HttpServletRequest request, String tag) {
		// 전달파라미터 curPage 파싱
		String param = request.getParameter("curPage");
		int totalCount = 0;
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		System.out.println("tag : " + tag);
		if(tag.equalsIgnoreCase("전체")) {
			totalCount = reviewDao.selectCntAll();
		} else if(tag.equalsIgnoreCase("강추") || 
				tag.equalsIgnoreCase("비추") || 
				tag.equalsIgnoreCase("취업고민")) {
			totalCount = reviewDao.selectCntAlltag(tag);
		} else {
			int corno = reviewDao.selectCorn(tag);
			System.out.println("corno : " + corno);
			totalCount = reviewDao.selectCntAllCor(corno);
		}
		
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

	@Override
	public Review_comment getDeleteParameter(HttpServletRequest request, Review_comment commentParam) {
		String deletecommentno = request.getParameter("commentno");
		String deletepw = request.getParameter("pw");
		
		int commentno = Integer.parseInt(deletecommentno);
		int pw = Integer.parseInt(deletepw);
		
		commentParam.setComment_no(commentno);
		commentParam.setComment_password(pw);
		
		return commentParam;
		
	}

	@Override
	public void deleteNewComment(Review_comment deletecomment) {
		reviewDao.deleteNewComment(deletecomment);
	}

	@Override
	public void deleteComment(Review_comment deletecomment) {
		reviewDao.deleteComment(deletecomment);
	}

	@Override
	public Comment_recommend commentRecommed(HttpServletRequest request, Comment_recommend recommendParam) {
		String recommendno = request.getParameter("recommendno");
		String memno = request.getParameter("memno");
		String recommend = request.getParameter("recommend");
		
		int no = Integer.parseInt(recommendno);
		int mem = Integer.parseInt(memno);
		int rcmd = Integer.parseInt(recommend);
		
		recommendParam.setComment_no(no);
		recommendParam.setMem_no(mem);
		recommendParam.setRecommend_check(rcmd);
		
		return recommendParam;
	}

	@Override
	public Review_comment Recommed(HttpServletRequest request, Review_comment commentParam) {
		String recommendno = request.getParameter("recommendno");
		String recommend = request.getParameter("recommend");
		
		int no = Integer.parseInt(recommendno);
		int rcmd = Integer.parseInt(recommend);
		
		commentParam.setComment_no(no);
		commentParam.setComment_recommend(rcmd);
		
		return commentParam;
	}
	
	@Override
	public void updateCommentRecommend(Review_comment commentRecommend) {
		int recommend = commentRecommend.getComment_recommend();
		int recommendno = commentRecommend.getComment_no();
				
		if(recommend == 0) {
			reviewDao.addCommentRecommend(recommendno);
		} else {
			reviewDao.minCommentRecommend(recommendno);
		}
	}

	@Override
	public List<Comment_recommend> checkCommentRecommend(Comment_recommend recommend) {
		int checkResult = 0;
		int commentno = recommend.getComment_no();
		int checkno = recommend.getRecommend_check();
		int memno = recommend.getMem_no();
		
		List<Comment_recommend> check = reviewDao.scanCommentRecommend(memno);
		System.out.println(check);
		System.out.println("commentno : " +commentno);
		System.out.println("checkno : " +checkno);
		System.out.println("memno : " +memno);
		for(int i = 0; i < check.size(); i++) {
			if(check.get(i).getComment_no() == commentno && check.get(i).getMem_no() == memno) {
				checkResult = 1;
			} else if(check.get(i).getComment_no() != commentno && check.get(i).getMem_no() == memno && checkno == 0) {
				checkResult = 2;
			}  else if(check.get(i).getComment_no() != commentno && check.get(i).getMem_no() != memno && checkno == 0) {
				checkResult = 2;
			}
		}
		if(check.isEmpty()) {
			checkResult = 2;
		}
		System.out.println(checkResult);
		recommend.setMem_no(memno);
		recommend.setComment_no(commentno);;
		recommend.setRecommend_check(checkno);
		
		if(checkResult == 2) {
			reviewDao.deleteCmtRecommend(recommend);
			reviewDao.insertCmtRecommend(recommend);
			return check;
		} else if(checkResult == 1 && checkno == 0){
			reviewDao.addCmtRecommend(recommend);
			return check;
		} else {
			reviewDao.deleteCmtRecommend(recommend);
			return check;
		}

	}

	@Override
	public int selectCommentLike(Review_comment commentRecommend) {
		int commentno = commentRecommend.getComment_no();
		return reviewDao.selectCommentLike(commentno);
	}

	@Override
	public List<Comment_recommend> getCommentRecommend() {
		return reviewDao.getCommentRecommend();
	}

	@Override
	public List<Review> getUpdateReviewList(int reviewno) {
		return reviewDao.getUpdateReviewList(reviewno);
	}

	@Override
	public Review getUpdateParam(HttpServletRequest request, Review review) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String tag = request.getParameter("selectTag");
		String no = request.getParameter("reviewno");
		
		int reviewno = Integer.parseInt(no);
		
		review.setReview_title(title);
		review.setReview_content(content);
		review.setReview_tag(tag);
		review.setReview_no(reviewno);
		
		return review;
	}

	@Override
	public void UpdateReview(Review getParam) {
		String title = getParam.getReview_title();
		String content = getParam.getReview_content();
		String tag = getParam.getReview_tag();
		int reviewno = getParam.getReview_no();
		
		reviewDao.UpdateReview(title, content, tag, reviewno);
	}

	@Override
	public void deleteReviewComment(int reviewno) {
		reviewDao.deleteReviewComment(reviewno);
	}

	@Override
	public void deleteReview(int reviewno) {
		reviewDao.deleteReview(reviewno);
	}

	@Override
	public int formatCorno(String cor_no) {
		int corno = Integer.parseInt(cor_no);
		return corno;
	}

	@Override
	public int getCornoByname(String selectCor) {
		return reviewDao.selectCornoByname(selectCor);
	}

}
