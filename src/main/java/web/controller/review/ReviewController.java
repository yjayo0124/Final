package web.controller.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Cor;
import web.dto.Review;
import web.service.main.face.SearchMainService;
import web.service.review.face.ReviewService;
import web.util.Paging;

@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired SearchMainService searchmainService;
	@Autowired ReviewService reviewService;
	
	// 글쓰기 페이지 이동
	@RequestMapping(value = "/review/writePop", method = RequestMethod.GET) 
	public void write() {
		logger.info("글쓰기 페이지");

	}
	
	// review table insert
	@RequestMapping(value = "/review/writePop", method = RequestMethod.POST) 
	public void writeProc(String selectCor, String selectTag, String title, String content, Review review) {
		int corno = reviewService.getCorno(selectCor);
		
		review.setCor_no(corno);
		review.setReview_tag(selectTag);
		review.setReview_title(title);
		review.setReview_content(content);
		
		reviewService.write(review);
	}
	
	// 검색어 자동완성 기능
	@RequestMapping(value="/review/autocomplete", method=RequestMethod.POST)
	public void autocompleteText(Model model, HttpServletRequest request, HttpServletResponse resp) {
		String result = request.getParameter("keyword");

		System.out.println(result);
		List<Cor> list = searchmainService.autocomplete(result);
		
//		System.out.println(list);
		JSONArray array = new JSONArray();
		for(int i  = 0; i <list.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("data", list.get(i).getCor_name());
			array.add(obj);
		}
        resp.setContentType("application/json ; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
			resp.getWriter().write(array.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// table scan
	@RequestMapping(value = "/review/scantable", method = RequestMethod.GET) 
	public void scanTable(HttpServletRequest request, HttpServletResponse resp) {
		String result = request.getParameter("keyword");
//		System.out.println(result);
		
		logger.info("테이블 스캔 중...");
		String scanResult = reviewService.scanTable(result);
		System.out.println(scanResult);

		JSONObject obj = new JSONObject();
		obj.put("data", scanResult);
        resp.setContentType("application/json ; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        try {
			resp.getWriter().write(obj.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 리뷰 페이지 이동
	@RequestMapping(value = "/review/list", method = RequestMethod.GET) 
	public void review(HttpServletRequest request, Model model, Map map) {
		logger.info("리뷰 페이지");
		Paging paging = reviewService.getCurPage(request);

		List<HashMap<String, Object>> reviewlist = reviewService.getReviewList(paging);
//		System.out.println(reviewlist);
		
		model.addAttribute("paging", paging);
		model.addAttribute("reviewlist", reviewlist);
	}
	
	// tag 선택시 리스트 불러오기
	@RequestMapping(value = "/review/tagsearch", method = RequestMethod.GET) 
	public void tagSearch(HttpServletRequest request, HttpServletResponse resp, Model model) {
		String result = request.getParameter("selectTag");
		System.out.println(result);
		Paging paging = reviewService.getCurPage(request);
		
		List<HashMap<String, Object>> tagSearch = reviewService.tagSearch(result);
		System.out.println(tagSearch);
		
		JSONArray array = new JSONArray();
		for(int i  = 0; i <tagSearch.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("data", tagSearch.get(i));
			array.add(obj);
		}
        resp.setContentType("application/json ; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        try {
			resp.getWriter().write(array.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("taglist", tagSearch);
	}
}
