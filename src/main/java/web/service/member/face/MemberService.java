package web.service.member.face;

import java.util.List;

import web.dto.Member;
import web.dto.Review;

public interface MemberService {

	public void join(Member member);

	public void corJoin(Member member);


	public void socialJoin(Member member);
	
	public boolean memChk(String member_id);
	
	public void update(Member member);
	
	public Member selectById(String member_id);
	
	public void withdraw(int member_no);
	
	
	public List<Review> getList(int member_no);
}
