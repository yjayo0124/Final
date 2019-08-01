package web.service.corinfo.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.corinfo.face.CorInfoDao;
import web.dto.Cor;
import web.dto.Recruit;
import web.dto.Review;
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
		int cordate = 0;
		int sys_date = 0;
		for(int i = 0; i < corlist.size(); i++) {
			formatdate = corlist.get(i).getCor_history();
		}
		formatdate = formatdate.substring(0,4);
		cordate = Integer.parseInt(formatdate);
		
		// date to String
		Date sysdate = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy");
		String to = transFormat.format(sysdate);
//		System.out.println("to : " + to); // test
		sys_date = Integer.parseInt(to);
		
		cordate = sys_date - cordate;
		formatdate = Integer.toString(cordate);
		System.out.println("formatedate : " + formatdate);
		
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

	@Override
	public String idformatDate(List<Cor> industrylist) {
		String idformatdate = null;
		long cordate = 0;
		int sys_date = 0;
		
		for(int i = 0; i < industrylist.size(); i++) {
			idformatdate = industrylist.get(i).getCor_history();
			long formatdate = Integer.parseInt(idformatdate);
			cordate += formatdate;
		}
		cordate = cordate/industrylist.size();
//		System.out.println("cordate : " + cordate); // test
		idformatdate = Long.toString(cordate);
		idformatdate = idformatdate.substring(0,4);
		cordate = Integer.parseInt(idformatdate);
		
		// date to String
		Date sysdate = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy");
		String to = transFormat.format(sysdate);
//		System.out.println("to : " + to); // test
		sys_date = Integer.parseInt(to);
		
		cordate = sys_date - cordate;
		idformatdate = Long.toString(cordate);
		System.out.println("idformatdate : " + idformatdate);
		
		return idformatdate;
	}

	@Override
	public List<HashMap<String, Object>> getReview(int cor_no) {
		return corinfoDao.selectReview(cor_no);
	}


	@Override
	public String getCorname(int cor_no) {
		return corinfoDao.selectCorname(cor_no);
	}


	@Override
	public List<Recruit> getRecruit(String corname) {
		return corinfoDao.selectRecruit(corname);
	}
	
	

}
