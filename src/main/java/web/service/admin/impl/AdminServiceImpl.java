package web.service.admin.impl;

import java.util.List;

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
		public List<Member> getList(Paging paging) {
			return adminDao.selectAll(paging);
			
		}

		@Override
		public Paging getCurPage(int curPage) {

			
			int totalCount = adminDao.selectCntAll();

			Paging paging = new Paging(totalCount, curPage);
			
					
			//paging.setSearch(search);
			
			return paging;
		
		}

		@Override
		public List getCorList(Paging paging) {
			return adminDao.selectCorAll(paging);
		}
	
}
