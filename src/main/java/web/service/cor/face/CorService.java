package web.service.cor.face;

import web.dto.Cor;

public interface CorService {

	public Cor select(int cor_no);
	
	public void update(Cor cor);
}
