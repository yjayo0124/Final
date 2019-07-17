package web.service.cor.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.cor.face.CorDao;
import web.dto.Cor;
import web.service.cor.face.CorService;

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

}
