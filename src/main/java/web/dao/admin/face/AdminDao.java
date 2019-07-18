package web.dao.admin.face;

import java.util.List;

import web.util.admin.Paging;

public interface AdminDao {

	public List selectAll(Paging paging);
	public List selectCorAll(Paging paging);
	public int selectCntAll();
	
}
