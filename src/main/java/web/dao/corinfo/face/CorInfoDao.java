package web.dao.corinfo.face;

import java.util.List;

import web.dto.Cor;

public interface CorInfoDao {

	List<Cor> selectCorinfo(int cor_no);

	List<Cor> selectIndustryinfo(String cor_type);
	
}
