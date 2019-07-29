package web.service.mypage.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Recruit;

public interface MypageService {

	/*
	 * param : 스크랩 테이블에 저장될 값
	 * 
	 * view페이지에 스크랩 버튼을 눌렀을 시 시행되는 메소드
	 * 
	 * return : 실행 후 성공 여부 
	 */
	public boolean myScrab(HashMap map);
	
	public boolean scrabCheck(HashMap map);
	
	public boolean myScrabCancel(HashMap map);
	
	public List<Recruit> getScrabList(int member_no);
}
