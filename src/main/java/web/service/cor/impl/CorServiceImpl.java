package web.service.cor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.cor.face.CorDao;
import web.dto.Cor;
import web.dto.mypage.resume.Resume;
import web.service.cor.face.CorService;
import web.util.resume.Paging;

@Service
public class CorServiceImpl implements CorService{

	@Autowired
	CorDao corDao;
	
	@Override
	public Cor select(int cor_no) {
				
		return corDao.selectByNo(cor_no);
	}

	@Override
	public void update(Cor cor) {
	
		
		corDao.update(cor);
		
	}

	@Override
	public int getTotal(Paging paging) {
		return corDao.countSearch(paging);
	}

	@Override
	public List getResumeList(Paging search) {
		return corDao.selectPageSearch(search);
	}

	@Override
	public int getMainIntroductionNoByMemberNo(int member_no) {
		return corDao.selectMainIntroductionNoByMemberNo(member_no);
	}


	
}
