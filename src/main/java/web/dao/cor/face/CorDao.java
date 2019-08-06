package web.dao.cor.face;

import java.util.List;

import web.dto.Cor;
import web.dto.mypage.resume.Resume;
import web.util.resume.Paging;

public interface CorDao {

	public Cor selectByNo(int cor_no);
	
	public void update(Cor cor);
	
	public int countSearch(Paging paging);
	
	public List selectPageSearch(Paging search);

	public int selectMainIntroductionNoByMemberNo(int member_no);
}
