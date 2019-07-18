package web.service.admin.face;

import java.util.List;

import web.util.admin.Paging;

public interface AdminService {

	public List getList(Paging paging);
	public List getCorList(Paging paging);
	
	public Paging getCurPage(int curPage);
	
}
