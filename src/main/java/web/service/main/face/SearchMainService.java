package web.service.main.face;

import java.util.List;

import web.dto.Cor;

public interface SearchMainService {

	public List<Cor> getSearch(String keyword);

	public List autocomplete(String result);
}
