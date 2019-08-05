package web.dao.mypage.face;

import web.dto.mypage.introduction.Introduction;
import web.dto.mypage.introduction.Sub_Introduction;

public interface IntroductionDao {
	
	public int insertIntroduction(Introduction introduction);
	
	public void insertSub(Sub_Introduction sub);

}
