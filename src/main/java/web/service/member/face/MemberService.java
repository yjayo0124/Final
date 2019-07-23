package web.service.member.face;

import web.dto.Member;

public interface MemberService {

	public void join(Member member);

	public void corJoin(Member member);


	public void socialJoin(Member member);
	
	public boolean memChk(String member_id);
	
	public void update(Member member);
	
	public Member selectById(String member_id);
	
	public void withdraw(int member_no);
	
}
