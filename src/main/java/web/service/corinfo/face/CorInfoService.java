package web.service.corinfo.face;

import java.util.List;

import web.dto.Cor;

public interface CorInfoService {

	List<Cor> getCorinfo(int cor_no);

	List<Cor> getIndustryinfo(String cor_type);

	int addIndustrymem(List<Cor> industrylist);

	String formatDate(List<Cor> corlist);

	int addNewmem(List<Cor> industrylist);

	int addLevmem(List<Cor> industrylist);

	String idformatDate(List<Cor> industrylist);

}
