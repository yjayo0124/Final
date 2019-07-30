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
		public int getTotal(Paging paging) {
			
			return adminDao.countSearch(paging);
		}

		@Override
		public int getCorTotal(Paging paging) {
			
			return adminDao.countCorSearch(paging);
		}


		@Override
		public List getSearchPagingList(Paging search) {
		
			return adminDao.selectPageSearch(search);
		}
	
		@Override
		public List getSearchPagingCorList(Paging search) {
		
			return adminDao.selectCorPageSearch(search);
		}

		@Override
		public void withdrawMember(int member_no) {
			
			adminDao.withdrawMember(member_no);
			
		}

}
