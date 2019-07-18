package web.service.recruitment.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Recruit;
import web.util.Paging;

public interface RecruitmentService {
	
	public List getList(Paging paging);

	public Paging getCurPage(HttpServletRequest req);

	public int getRecruitno(HttpServletRequest req);

	public Recruit view(int recruit_no);
	
	public List<Recruit> getListByMemberNo(int member_no);

}
