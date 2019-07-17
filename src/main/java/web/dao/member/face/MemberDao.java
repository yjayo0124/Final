package web.dao.member.face;

import web.dto.Member;
import web.dto.Oauth;

public interface MemberDao {

	public void insert(Member member);
	
	public void socialInsert(Member member);
	
	public Member getUserDetails(String member_id);
	
	public int selectById(String member_id);
	
	public void insertOauth(Oauth oauth);
	
	public void update(Member member);
}
