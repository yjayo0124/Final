package web.dao.mypage.face;

import java.util.List;

import web.dto.mypage.introduction.Introduction;
import web.dto.mypage.introduction.Sub_Introduction;
import web.util.mypage.MypagePaging;

public interface IntroductionDao {
	
	public int insertIntroduction(Introduction introduction);
	
	public void insertSub(Sub_Introduction sub);
	
	public List<Introduction> getList(MypagePaging paging);

	public int selectCntIntroduction(int member_no);
	
	public int cntMainIntroduction(int member_no);
	
	public int getMainIntroduction_no(int member_no);
	
	public void changeMainIntroduction(int introduction_no);
	
	public void updateMainIntroduction(int introduction_no);
	
	public int checkSub(int introduction_no);
	
	public void deleteSub(int introduction_no);
	
	public void deleteIntroduction(int introduction_no);
	
	public Introduction selelctIntroduction(int introduction_no);
	
	public List<Sub_Introduction> selectSub(int introduction_no);

	public void updateIntroduction(Introduction introduction);

}
