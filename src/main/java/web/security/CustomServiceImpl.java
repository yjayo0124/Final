package web.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import web.dao.member.face.MemberDao;
import web.dto.Member;

@Service
public class CustomServiceImpl implements UserDetailsService {

	@Autowired MemberDao memberDao;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Member member = memberDao.getUserDetails(username);

        if(member==null) throw new UsernameNotFoundException("["+username+"] username cant find :: suggest to join!");

        if(member.getAuthorities().size()==0)

            throw new UsernameNotFoundException("["+username+"] Å»ÅðÇÑ È¸¿ø");

        return member;
		
		
	}
	
	
}
