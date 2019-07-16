package web.service.corinfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.corinfo.face.CorInfoDao;
import web.dto.Cor;
import web.service.corinfo.face.CorInfoService;

@Service
public class CorInfoServiceImpl implements CorInfoService {

	@Autowired CorInfoDao corinfoDao;
	
	@Override
	public List<Cor> getCorinfo(int cor_no) {
		return corinfoDao.selectCorinfo(cor_no);
	}

}
