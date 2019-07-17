package web.dao.recruitment.face;

import java.util.List;

import web.dto.Recruit;
import web.util.Paging;

public interface RecruitmentDao {
	
	public List selectAll(Paging paging);

	public int selectCntAll();
	
	public Recruit select(int recruit_no);
	
	
}
