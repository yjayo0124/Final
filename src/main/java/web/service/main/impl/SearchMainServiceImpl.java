package web.service.main.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.main.face.SearchMainDao;
import web.dto.Cor;
import web.service.main.face.SearchMainService;

@Service
public class SearchMainServiceImpl implements SearchMainService {

	@Autowired SearchMainDao searchmainDao;

	@Override
	public List<Cor> getSearch(String keyword) {
		return searchmainDao.selectCor(keyword);
	}

	@Override
	public List autocomplete(String result) {
		return searchmainDao.autocomplete(result);
	}
}
