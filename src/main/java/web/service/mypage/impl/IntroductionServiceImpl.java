package web.service.mypage.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.mypage.face.IntroductionDao;
import web.dto.mypage.introduction.Introduction;
import web.dto.mypage.introduction.Sub_Introduction;
import web.service.mypage.face.IntroductionService;
import web.util.mypage.MypagePaging;

@Service
public class IntroductionServiceImpl implements IntroductionService {
	@Autowired IntroductionDao introductionDao;

	@Override
	public void insertIntroduction(Introduction introduction) {
			
			introductionDao.insertIntroduction(introduction);
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

	@Override
	public Boolean checkIntroduction(int member_no) {
		Boolean check = false;
		int totalCount = introductionDao.selectCntIntroduction(member_no);
		
		if(totalCount != 0) {
			check = true;
		}
		
		return check;
	}
	
	@Override
	public MypagePaging getCurPage(HttpServletRequest request, int member_no) {
		//전달파라미터 curPage 파싱
				String param = request.getParameter("curPage");
				int curPage = 0;
				if( param!=null && !"".equals(param) ) {
					curPage = Integer.parseInt(param);
				}

				// 전체 게시글 수
				int totalCount = introductionDao.selectCntIntroduction(member_no);

				// 페이징 객체 생성
				MypagePaging paging = new MypagePaging(totalCount, curPage);
				paging.setMember_no(member_no);

				return paging;
	}

	@Override
	public List<Introduction> getList(MypagePaging paging) {
		
		return introductionDao.getList(paging);
	}

	@Override
	public Boolean checkMainIntroduction(int member_no) {

		Boolean check = false;
		
		int count = introductionDao.cntMainIntroduction(member_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}

	@Override
	public int getMainIntroduction_no(int member_no) {
		
		return introductionDao.getMainIntroduction_no(member_no);
	}

	@Override
	public void changeMainIntroduction(int introduction_no) {
		introductionDao.changeMainIntroduction(introduction_no);
		
	}

	@Override
	public void updateMainIntroduction(int introduction_no) {
		introductionDao.updateMainIntroduction(introduction_no);
		
	}

	@Override
	public Boolean checkSub(int introduction_no) {
		Boolean check = false;
		
		int count = introductionDao.checkSub(introduction_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}

	@Override
	public void deleteSub(int introduction_no) {
		introductionDao.deleteSub(introduction_no);
		
	}

	@Override
	public void deleteIntroduction(int introduction_no) {
		introductionDao.deleteIntroduction(introduction_no);	
		
	}

	@Override
	public Introduction selelctIntroduction(int introduction_no) {
		
		
		return introductionDao.selelctIntroduction(introduction_no);
	}

	@Override
	public List<Sub_Introduction> selectSub(int introduction_no) {
		
		return introductionDao.selectSub(introduction_no);
	}

	@Override
	public void updateIntroduction(Introduction introduction) {
		introductionDao.updateIntroduction(introduction);
		
	}
	

}
