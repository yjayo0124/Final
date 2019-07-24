package web.service.main.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.main.face.MainDao;
import web.dto.Recruit;
import web.service.main.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;

	@Override
	public List<Recruit> getRecruitList() {
		
		return mainDao.selectRecruitList();
	}

	@Override
	public List getReviewList() {

		return mainDao.selectReviewList();
	}
	
	
	
	
}
