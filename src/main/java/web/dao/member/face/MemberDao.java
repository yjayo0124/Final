package web.dao.member.face;

import java.util.List;

import web.dto.Member;
import web.dto.Oauth;
import web.dto.Review;

public interface MemberDao {

	public void insert(Member member);
	
	public void corInsert(Member member);
	
	public void socialInsert(Member member);
	
	public Member getUserDetails(String member_id);
	
	public int selectById(String member_id);
	
	public void insertOauth(Oauth oauth);
	
	public void update(Member member);
	
	public void getWithdrawByNo(int member_no);
	
	public List<Review> getMyReviewList(int member_no);
	
	public void updateMemberInfoExceptPw(Member member);
	
}
