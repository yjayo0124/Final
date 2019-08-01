package web.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.stereotype.Service;

import web.dao.member.face.MemberDao;
import web.dto.Member;

@Service
public class CustomServiceImpl implements UserDetailsService{

	@Autowired MemberDao memberDao;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Member member = memberDao.getUserDetails(username);
				
        if(member==null) {
        	
        	throw new UsernameNotFoundException("존재하지 않는 아이디");

        }
        if(member.getAuthorities().size()==0)

            throw new UsernameNotFoundException("["+username+"] 탈퇴한 회원입니다. ");
        	
        return member;
		
		
	}
	
	
	
}

