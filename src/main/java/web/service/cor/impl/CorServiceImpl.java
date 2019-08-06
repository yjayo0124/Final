package web.service.cor.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.cor.face.CorDao;
import web.dto.Cor;
import web.dto.Recruit;
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


	@Override
	public boolean myScrab(HashMap map) {
		
		//스크랩 중복이 안되도록 검사
		int res = corDao.scrabCheck(map);
		//res == 1 이면 이미 스크랩 했던 게시글
		//res == 0 이면 스크랩 한 적 없는 게시글이라는 뜻 
		
		boolean check = false;
		
		if ( res == 1 ) {
		
			System.out.println("해당 아이디로 이미  스크랩된 적 있는 게시글");
			
			check = false;
		
		}else if(res == 0 ){
		
			corDao.insertScrab(map);
	
			check = true;
		}
	
		return check;
		
	}


	@Override
	public boolean scrabCheck(HashMap map) {
		
		int res = corDao.scrabCheck(map);
		
		boolean check = false;
		
		if(res == 1 ) {
			check =false;
			
		}else if(res == 0) {
			
			check = true;
		}
		
		return check;
	}


	@Override
	public boolean myScrabCancel(HashMap map) {
		boolean check = false;
		
		corDao.myScrabDelete(map);
		
		int res = corDao.scrabCheck(map);
		
		if(res == 1 ) { //테이블 행이 남아 있으면 
			check =false;
			
		}else if(res == 0) { //테이블 행 성공적으로 삭제했으면 
			
			check = true;
		}
		
		return check;
	}


	@Override
	public List<Resume> getScrabList(int member_no) {
		
		return corDao.selectScrabList(member_no);
	}
	
}
