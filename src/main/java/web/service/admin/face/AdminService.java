package web.service.admin.face;

import java.util.List;

import web.util.admin.Paging;

public interface AdminService {

	public int getTotal(Paging paging);
	public int getCorTotal(Paging paging);
	
	public List getSearchPagingList(Paging search);
	public List getSearchPagingCorList(Paging search);
	
	public void withdrawMember(int member_no);
	
}
