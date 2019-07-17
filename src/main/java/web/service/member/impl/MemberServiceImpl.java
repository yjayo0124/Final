package web.service.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.member.face.MemberDao;
import web.dto.Member;
import web.dto.Oauth;
import web.service.member.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberDao memberDao;
	
	@Override
	public void join(Member member) {
	 
		memberDao.insert(member);
	}

	@Override
	public void socialJoin(Member member) {
		
		int res = memberDao.selectById(member.getMember_id());
		
		if( res == 0){
			memberDao.socialInsert(member);
			
			Member newMem = memberDao.getUserDetails(member.getMember_id());
			
			System.out.println("newMem : "+ newMem);
			
			Oauth oauth = new Oauth();
			
			oauth.setMember_no(newMem.getMember_no());
			oauth.setSocial_email(newMem.getMember_email());
			oauth.setSocial_id(newMem.getMember_id());
			oauth.setSocial_name(newMem.getMember_name());
			
			memberDao.insertOauth(oauth);
			
		}
	
	}
	
	@Override
	public boolean memChk(String member_id) {
		
		boolean res = false;
		
		if( memberDao.selectById(member_id) == 0) {
			res = false;
		}else if(memberDao.selectById(member_id) == 1) {
			res = true;
		}
	
		return res;
		
	}

	@Override
	public void update(Member member) {
		
		memberDao.update(member);
		
	}

	

}
