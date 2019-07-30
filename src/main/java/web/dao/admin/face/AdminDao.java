package web.dao.admin.face;

import java.util.List;
import java.util.Map;

import web.util.admin.Paging;

public interface AdminDao {

	//---------search
	public int countSearch(Paging paging);
	public int countCorSearch(Paging paging);
	
	public List selectPageSearch(Paging search);
	public List selectCorPageSearch(Paging search);
	
	
	//--withdraw
	public void withdrawMember(int member_no);
	
}
