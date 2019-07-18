package web.service.recruitment.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import file.dto.Filetest;
import web.dao.recruitment.face.RecruitmentDao;
import web.dto.Recruit;
import web.dto.Recruit_file;
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
	public void write(Recruit recruit) {
		
		recruitmentDao.write(recruit);
	}

	@Override
	public void filesave(MultipartFile file, ServletContext context) {
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		//저장될 파일의 이름 (원본이름 + UUID)
		String name = file.getOriginalFilename()+"_"+uId;

		//저장될 파일 객체
		File dest = new File(storedPath, name);
		
				
		//파일 저장
		try {
			file.transferTo(dest); //실제 저장
					
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//DB에저장 (업로드 정보 기록)
		Recruit_file recruit_file = new Recruit_file();
		recruit_file.setRecruit_file_originname(file.getOriginalFilename());
		recruit_file.setRecruit_file_storedname(name);
		recruit_file.setRecruit_file_upload_date();
		
		RecruitmentDao.insertFile(recruit_file);		
	}

	
}
