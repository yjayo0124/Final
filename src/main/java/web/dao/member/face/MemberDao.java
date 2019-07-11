package web.dao.member.face;

import web.dto.Member;

public interface MemberDao {

	public void insert(Member member);
	
	public Member getUserDetails(String member_id);
}
