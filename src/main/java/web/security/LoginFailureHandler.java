package web.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String loginIdName;
	private String loginPwName;
	private String errormsgname;
	private String defaultFailureUrl;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String username = request.getParameter(loginIdName);
		String password = request.getParameter(loginPwName);
		String errormsg = null;
		
		if(exception instanceof BadCredentialsException) {
			errormsg = "비밀번호를 확인해주세요";
		}else if(exception instanceof AuthenticationCredentialsNotFoundException) {
			errormsg = "-_-^ 나쁜 계정!! ";
		}else if(exception instanceof DisabledException) {
			errormsg = "탈퇴하셨었네요.. >> '<a href='/member/join'>다시가입하기</a>'";
		}else if(exception instanceof UsernameNotFoundException) {
			errormsg = "존재하지 않는 아이디입니다.";
		}
		
		
		request.setAttribute(loginIdName, username);
		request.setAttribute(loginPwName, password);
		request.setAttribute(errormsgname, errormsg);
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
		
	}

	public String getLoginIdName() {
		return loginIdName;
	}

	public void setLoginIdName(String loginIdName) {
		this.loginIdName = loginIdName;
	}

	public String getLoginPwName() {
		return loginPwName;
	}

	public void setLoginPwName(String loginPwName) {
		this.loginPwName = loginPwName;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

	
	
	
}
