package web.dao.review.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Comment_recommend;
import web.dto.Cor;
import web.dto.Recommend;
import web.dto.Review;
import web.dto.Review_comment;
import web.util.Paging;

public interface ReviewDao {

	public int selectCorno(String selectCor);
	
	public void insertReview(Review review);

	public String selectCor(String result);

	public List<HashMap<String, Object>> selectReview(Paging paging);

	public int selectCntAll();

	public List<HashMap<String, Object>> selectReviewByTag(Paging paging);

	public List<HashMap<String, Object>> searchReview(Paging paging);

	public List<HashMap<String, Object>> selectViewList(int reviewno);

	public void addHit(int reviewno);

	public int addLike(int reviewno);

	public int selectLike(int reviewno);

	public int minLike(int reviewno);

	public void insertRecommend(Recommend recommend);

	public void deleteRecommend(Recommend recommend);

	public List<Recommend> scanRecommend(int memno);

	public void addRecommend(Recommend recommend);

	public List<Recommend> selectRecommend();

	public void InsertComment(Review_comment comment);

	public List<Review_comment> getComment(int reviewno);

	public List<Review_comment> getNewComment(int reviewno);

	public void deleteNewComment(Review_comment deletecomment);

	public void deleteComment(Review_comment deletecomment);

	public void addCommentRecommend(int recommendno);

	public void minCommentRecommend(int recommendno);

	public List<Comment_recommend> scanCommentRecommend(int memno);

	public void deleteCmtRecommend(Comment_recommend recommend);

	public void insertCmtRecommend(Comment_recommend recommend);

	public void addCmtRecommend(Comment_recommend recommend);

	public int selectCommentLike(int commentno);

	public List<Comment_recommend> getCommentRecommend();

}
