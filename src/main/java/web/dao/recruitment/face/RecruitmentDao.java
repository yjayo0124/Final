package web.dao.recruitment.face;

import java.util.List;

import web.dto.Recruit;
import web.dto.Recruit_file;
import web.util.Paging;

public interface RecruitmentDao {

	/**
	 *	게시글 리스트 조회
	 * @param paging - 조회 대상 페이징 객체
	 * @return 게시글을 조회한 결과
	 */
	public List selectAll(Paging paging);

	/**
	 * recruit 테이블 전체 COUNT 조회
	 * @return 테이블 전체 행 수 조회 결과
	 */
	public int selectCntAll();
	/**
	 * 글번호로 게시글 조회
	 * @param recruit_no
	 * @return 게시글 조회 결과
	 */
	public Recruit select(Recruit recruit);

	/**
	 * 게시글 작성
	 * @param recruit
	 */
	public void write(Recruit recruit);
	
	/**
	 * 첨부파일 삽입
	 * @param recruit_file
	 */
	public void insertFile(Recruit_file recruit_file);
//
//	/**
//	 * 글 번호로 첨부파일 조회
//	 * @param recruit_file
//	 * @return 첨부파일 조회 결과
//	 */
//	public Recruit_file selectFile(Recruit_file recruit_file);
//	
	/**
	 * 첨부파일번호로 첨부파일 조회
	 * @param recruit_file_no
	 * @return 첨부파일 조회 결과
	 */
//	public Recruit_file selectByfileno(int recruit_file_no);
	
	
	public List<Recruit> selectByMemberNo(int member_no);

	/**
	 *  게시글 수정
	 * @param recruit
	 */
	public void update(Recruit recruit);

	/**
	 * 	게시글 삭제
	 * @param recruit
	 */
	public void deleteByrecruitno(Recruit recruit);
	
	/**
	 * 	게시글 첨부파일 삭제
	 * @param recruit_file
	 */
	public void deleteFile(Recruit_file recruit_file);
}
