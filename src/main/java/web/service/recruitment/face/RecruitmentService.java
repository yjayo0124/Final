package web.service.recruitment.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Recruit;
import web.util.Paging;

public interface RecruitmentService {
	
	public List getList(Paging paging);

	public Paging getCurPage(HttpServletRequest req);

	public int getRecruitno(HttpServletRequest req);

	public Recruit view(int recruit_no);
	
	public void write(Recruit recruit);
	
	public void filesave(
			MultipartFile file, //첨부파일
			ServletContext context //서블릿컨텍스트
			);

}
