package web.dao.main.face;

import java.util.List;

import web.dto.Recruit;

public interface MainDao {

	public List<Recruit> selectRecruitList();
	
	public List selectReviewList();
	
}
