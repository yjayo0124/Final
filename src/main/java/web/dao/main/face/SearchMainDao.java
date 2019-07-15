package web.dao.main.face;

import java.util.List;

import web.dto.Cor;

public interface SearchMainDao {

	public List<Cor> selectCor(String keyword);

	public List<Cor> autocomplete(String result);

}
