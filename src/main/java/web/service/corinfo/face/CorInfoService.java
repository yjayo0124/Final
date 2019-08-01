package web.service.corinfo.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Cor;
import web.dto.Recruit;
import web.dto.Review;

public interface CorInfoService {

	List<Cor> getCorinfo(int cor_no);

	List<Cor> getIndustryinfo(String cor_type);

	int addIndustrymem(List<Cor> industrylist);

	String formatDate(List<Cor> corlist);

	int addNewmem(List<Cor> industrylist);

	int addLevmem(List<Cor> industrylist);

	String idformatDate(List<Cor> industrylist);

	List<HashMap<String, Object>> getReview(int cor_no);

	String getCorname(int cor_no);

	List<Recruit> getRecruit(String corname);
}
