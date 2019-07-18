package web.service.recruitment.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.recruitment.face.RecruitmentDao;
import web.dto.Recruit;
import web.service.recruitment.face.RecruitmentService;
import web.util.Paging;

@Service
public class RecruimentServiceImpl implements RecruitmentService{

	@Autowired RecruitmentDao recruitmentDao;
	
	@Override
	public List getList(Paging paging) {
		return recruitmentDao.selectAll(paging);
	}

	@Override
	public Paging getCurPage(HttpServletRequest req) {
		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		
			int totalCount = recruitmentDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, curPage);
//		System.out.println(paging); //TEST
		
		return paging;
	}

	@Override
	public int getRecruitno(HttpServletRequest req) {
		
		String param = req.getParameter("recruit_no");
		int recruitno = 0;
		if( param!=null && !"".equals(param) ) {
			recruitno = Integer.parseInt(param);
		}
		
		return recruitno;
	}

	@Override
	public Recruit view(int recruit_no) {
		return recruitmentDao.select(recruit_no);
	}

	@Override
	public List<Recruit> getListByMemberNo(int member_no) {
		
		return recruitmentDao.selectByMemberNo(member_no);
		
	}

}
