package web.service.mypage.face;

import web.dto.mypage.introduction.Introduction;

public interface IntroductionService {

	public void insertIntroduction(Introduction introduction);
	
	public void insertSub(int introduction_no, String[] list_numbers, String[] list_introduction_question, String[] list_introduction_content);
}
