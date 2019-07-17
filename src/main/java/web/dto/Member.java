package web.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Member implements UserDetails {

	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_email;
	
	private char enab;
	private int company_no;
	private String member_auth;
	
	
	
	
	//--------�떆�걧由ы떚 �꽕�젙 --
	private List authorities; 
	private boolean accountNonExpired = true; 
	private boolean accountNonLocked = true; 
	private boolean credentialsNonExpired = true; 
	private boolean enabled = true; 

	@Override
	public String toString() {
		return "Member [member_no=" + member_no + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_name=" + member_name + ", member_phone=" + member_phone + ", member_email=" + member_email
				+ ", enab=" + enab + ", company_no=" + company_no + ", member_auth=" + member_auth + "]";
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public char getEnab() {
		return enab;
	}

	public void setEnab(char enab) {
		this.enab = enab;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public String getMember_auth() {
		return member_auth;
	}

	public void setMember_auth(String member_auth) {
		this.member_auth = member_auth;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
	
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();   
        authorities.add(new SimpleGrantedAuthority(member_auth));
        return authorities;
		
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	
	
	
	

}
