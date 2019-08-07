package web.dao.cor.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Cor;
import web.dto.Recruit;
import web.dto.mypage.resume.Resume;
import web.util.resume.Paging;

public interface CorDao {

	public Cor selectByNo(int cor_no);
	
	public void update(Cor cor);
	
	public int countSearch(Paging paging);
	
	public List selectPageSearch(Paging search);

	public int selectMainIntroductionNoByMemberNo(int member_no);
	
	public int scrabCheck(HashMap map);
	
	public void insertScrab(HashMap map);
	
	public void myScrabDelete(HashMap map);
	
	public List<Resume> selectScrabList(int member_no);
	
	public int selectScrabCount(int member_no);
}
