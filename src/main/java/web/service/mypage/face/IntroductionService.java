package web.service.mypage.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.mypage.introduction.Introduction;
import web.dto.mypage.introduction.Sub_Introduction;
import web.util.mypage.MypagePaging;

public interface IntroductionService {

	public void insertIntroduction(Introduction introduction);
	
	public void insertSub(int introduction_no, String[] list_numbers, String[] list_introduction_question, String[] list_introduction_content);
	
	public Boolean checkIntroduction(int introduction_no);
	
	public MypagePaging getCurPage(HttpServletRequest request, int member_no);
	
	public List<Introduction> getList(MypagePaging paging);
	
	public Boolean checkMainIntroduction(int member_no);
	
	public int getMainIntroduction_no(int member_no);
	
	public void changeMainIntroduction(int introduction_no);
	
	public void updateMainIntroduction(int introduction_no);
	
	public Boolean checkSub(int introduction_no);
	
	public void deleteSub(int introduction_no);
	
	public void deleteIntroduction(int introduction_no);
	
	public Introduction selelctIntroduction(int introduction_no);
	
	public List<Sub_Introduction> selectSub(int introduction_no);
}
