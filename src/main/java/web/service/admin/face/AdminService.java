package web.service.admin.face;

import java.util.List;

import web.util.admin.Paging;

public interface AdminService {

//	public List getList(Paging paging);
//	public List getCorList(Paging paging);
//	
//	public Paging getCurPage(int curPage, String select, String search);

	public int getTotal(Paging paging);
	public int getCorTotal(Paging paging);
	
	public List getSearchPagingList(Paging search);
	public List getSearchPagingCorList(Paging search);
}
