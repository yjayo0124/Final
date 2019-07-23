package web.service.admin.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.admin.face.AdminDao;
import web.dto.Member;
import web.service.admin.face.AdminService;
import web.util.admin.Paging;

@Service
public class AdminServiceImpl implements AdminService {

		@Autowired
		AdminDao adminDao;
		
		@Override
		public Paging getCurPage(int curPage, String select, String search) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("select", select);
			map.put("search", search);
			
			int totalCount = adminDao.selectCntAll(map);
			
			
			Paging paging = new Paging(totalCount, curPage);
			
			
			paging.setSearch(search);
			
			return paging;
			
		}

		
		@Override
		public List<Member> getList(Paging paging) {
			
			System.out.println("paging" + paging);
			
			return adminDao.selectAll(paging);
			
			
			
		}

		@Override
		public List getCorList(Paging paging) {
			return adminDao.selectCorAll(paging);
		}
	
}
