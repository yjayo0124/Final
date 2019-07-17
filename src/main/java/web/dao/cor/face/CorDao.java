package web.dao.cor.face;

import web.dto.Cor;

public interface CorDao {

	public Cor selectByNo(int cor_no);
	
	public void update(Cor cor);
}
