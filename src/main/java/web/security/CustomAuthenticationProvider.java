package web.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import web.dto.Member;



public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired CustomServiceImpl customServiceImpl;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {	
		String input_id = authentication.getName();
		String input_password = (String) authentication.getCredentials();
	
	//	logger.info("authentication : "+authentication );

		Member member = new Member();
		
		try {
			member = (Member) customServiceImpl.loadUserByUsername(input_id );
			
			
			if( !input_password.equals(member.getMember_pw())) {
				throw new BadCredentialsException("비밀번호 불일치");
			
			}else if( member.getEnab() != '1') {
				throw new BadCredentialsException("탈퇴한 회원입니다. ");
			}
			
			
		 } catch(UsernameNotFoundException e) {
	            e.printStackTrace();
	            throw new UsernameNotFoundException(e.getMessage());
		 } catch(BadCredentialsException e) {
	            e.printStackTrace();
	            throw new BadCredentialsException(e.getMessage());
		 } catch(Exception e) {
	            e.printStackTrace();
	            throw new RuntimeException(e.getMessage());
	     }
		
	

        UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(member.getMember_id(), member.getMember_pw(), member.getAuthorities() );
        result.setDetails(member);
		
    	logger.info(result.toString());
		
		return result;
	}
	
	

	

	@Override
	public boolean supports(Class<?> authentication) {
		
		return authentication.equals(UsernamePasswordAuthenticationToken.class);

	}

}
