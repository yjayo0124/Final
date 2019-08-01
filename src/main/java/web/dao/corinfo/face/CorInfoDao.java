package web.dao.corinfo.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Cor;
import web.dto.Recruit;
import web.dto.Review;

public interface CorInfoDao {

	List<Cor> selectCorinfo(int cor_no);

	List<Cor> selectIndustryinfo(String cor_type);

	List<HashMap<String, Object>> selectReview(int cor_no);

	String selectCorname(int cor_no);

	List<Recruit> selectRecruit(String corname);
	
}
