package web.service.mypage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.mypage.face.IntroductionDao;
import web.dto.mypage.introduction.Introduction;
import web.dto.mypage.introduction.Sub_Introduction;
import web.service.mypage.face.IntroductionService;

@Service
public class IntroductionServiceImpl implements IntroductionService {
	@Autowired IntroductionDao introductionDao;

	@Override
	public void insertIntroduction(Introduction introduction) {
		
		if(introduction.getMember_no() != 0) {
//			if(introduction.getIntroduction_question() == "") {
//				introduction.setIntroduction_question("0");
//			} 
//			if(introduction.getIntroduction_content() == "") {
//				introduction.setIntroduction_content("0");
//			}  
			
		
			introductionDao.insertIntroduction(introduction);
		}

	}

	@Override
	public void insertSub(int introduction_no, String[] list_numbers, String[] list_introduction_question,
			String[] list_introduction_content) {
		for(int i=0; i<list_numbers.length; i++) {
			
			Sub_Introduction sub = new Sub_Introduction();
			sub.setIntroduction_no(introduction_no);
			sub.setNumbers(Integer.parseInt(list_numbers[i]));
			sub.setSub_introduction_question(list_introduction_question[i]);
			sub.setSub_introduction_content(list_introduction_content[i]);
			
			introductionDao.insertSub(sub);
			
		}
		
	}
	

}
