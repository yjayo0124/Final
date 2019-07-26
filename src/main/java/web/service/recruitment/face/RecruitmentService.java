package web.service.recruitment.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Recruit;
import web.dto.Recruit_file;
import web.util.Paging;

public interface RecruitmentService {
	
	public List getList(Paging paging);

	public Paging getCurPage(HttpServletRequest req);

	public int getRecruitno(HttpServletRequest req);

	public Recruit view(int recruit_no);
	
	public int write(Recruit recruit);
	
	public void filesave(
			
			int recruit_no,
			MultipartFile file, //첨부파일
			ServletContext context //서블릿컨텍스트
			);


	public List<Recruit> getListByMemberNo(int member_no);

	public void update(Recruit recruit);

	public void delete(Recruit recruit);

	public String getFilename(int recruit_no);
	
	public int recruitSeqCurr();

	


}
