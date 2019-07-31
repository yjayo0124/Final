package web.dao.mypage.face;

import web.dto.mypage.resume.Certificate;
import web.dto.mypage.resume.Resume;

public interface ResumeDao {

	public int insertResume(Resume resume);
	
	public void insertCertificate(Certificate certificate);
	
}
