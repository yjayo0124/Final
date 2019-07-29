package web.dao.mypage.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Recruit;

public interface MypageDao {

	public int scrabCheck(HashMap map);
	
	public void insertScrab(HashMap map);
	
	public void myScrabDelete(HashMap map);
	
	public List<Recruit> selectScrabList(int member_no);
}
