package web.service.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.member.face.MemberDao;
import web.dto.Member;
import web.service.member.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberDao memberDao;
	
	@Override
	public void join(Member member) {
	 
		memberDao.insert(member);
	}

}
