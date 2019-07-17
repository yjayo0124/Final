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

	@Override
	public List<Cor> getIndustryinfo(String cor_type) {
		return corinfoDao.selectIndustryinfo(cor_type);
	}

	@Override
	public int addIndustrymem(List<Cor> industrylist) {
		int idmem = 0;
		for(int i = 0; i < industrylist.size(); i++) {
			idmem += industrylist.get(i).getCor_mem();
		}
		idmem = idmem/industrylist.size();
		return idmem;
	}

	@Override
	public String formatDate(List<Cor> corlist) {
		String formatdate = null;
		for(int i = 0; i < corlist.size(); i++) {
			formatdate = corlist.get(i).getCor_history();
		}
		formatdate = formatdate.substring(0,4)+ "-" +formatdate.substring(4, formatdate.length());
		formatdate = formatdate.substring(0,7)+ "-" +formatdate.substring(7, formatdate.length());
		return formatdate;
	}

	@Override
	public int addNewmem(List<Cor> industrylist) {
		int newmem = 0;
		for(int i = 0; i < industrylist.size(); i++) {
			newmem += industrylist.get(i).getCor_new_mem();
		}
		newmem = newmem/industrylist.size();
		return newmem;
	}

	@Override
	public int addLevmem(List<Cor> industrylist) {
		int levmem = 0;
		for(int i = 0; i < industrylist.size(); i++) {
			levmem += industrylist.get(i).getCor_lev_mem();
		}
		levmem = levmem/industrylist.size();
		return levmem;
	}

}
