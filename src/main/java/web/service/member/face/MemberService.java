package web.service.member.face;

import web.dto.Member;

public interface MemberService {

	public void join(Member member);

	public void socialJoin(Member member);
	
	public boolean memChk(String member_id);
	
	
}
