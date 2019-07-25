package web.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import web.dto.Member;

public class CustomOAuthenticationProvider  implements AuthenticationProvider {

	@Autowired CustomServiceImpl customServiceImpl;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomOAuthenticationProvider.class);
	
	
	public Authentication authenticate(String member_id, String token) throws AuthenticationException{

		//logger.info("social_id : "+member_id);
	
		Member member = new Member();
		
		member = (Member) customServiceImpl.loadUserByUsername(member_id +"@naver");
	
        UsernamePasswordAuthenticationToken result = 
        		new UsernamePasswordAuthenticationToken(member_id, token);

        result.setDetails(member);

		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		return null;
	}

}
