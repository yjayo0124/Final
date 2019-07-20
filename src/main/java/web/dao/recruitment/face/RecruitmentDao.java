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
	
	public Recruit select(int recruit_no);

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

	public List<Recruit> selectByMemberNo(int member_no);

	/**
	 *  게시글 수정
	 * @param recruit
	 */
	public void update(Recruit recruit);

	
}
