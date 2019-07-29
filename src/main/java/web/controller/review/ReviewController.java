package web.controller.review;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Cor;
import web.dto.Member;
import web.dto.Recommend;
import web.dto.Review;
import web.dto.Review_comment;
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
	public void writeProc(String selectCor, String selectTag, int selectMem, String title, String content, Review review) {
		int corno = reviewService.getCorno(selectCor);

		review.setMem_no(selectMem);
		review.setCor_no(corno);
		review.setReview_tag(selectTag);
		review.setReview_title(title);
		review.setReview_content(content);
		
		System.out.println(review);
		reviewService.write(review);
	}
	
	// 검색어 자동완성 기능
	@RequestMapping(value="/review/autocomplete", method=RequestMethod.POST)
	public void autocompleteText(Model model, HttpServletRequest request, HttpServletResponse resp) {
		String result = request.getParameter("keyword");

		List<Cor> list = searchmainService.autocomplete(result);

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

		logger.info("테이블 스캔 중...");
		String scanResult = reviewService.scanTable(result);

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
	public void review(HttpServletRequest request, Model model, @RequestParam String tag, String keyword, Authentication auth) {
		logger.info("리뷰 페이지");
		Paging paging = reviewService.getCurPage(request);
		String selectTag = reviewService.getTag(tag);
		paging.setTag(selectTag);
		
		List<HashMap<String, Object>> reviewlist = reviewService.tagSearch(paging);
		List<Recommend> recommendlist = reviewService.getRecommend();
		
		model.addAttribute("reclist", recommendlist);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("paging", paging);
		model.addAttribute("tag", selectTag);

		//인증된 객체의 상세정보 가져오기
		if(auth == null) {
			return;
		} else {
			Member member = (Member) auth.getDetails();
			model.addAttribute("member_no", member.getMember_no());
		}
	}
	
	// 검색 값 받기
	@RequestMapping(value = "/review/list", method = RequestMethod.POST) 
	public void reviewSearch(HttpServletRequest request, Model model, String keyword) {
		logger.info("검색값 받기");
		Paging paging = reviewService.getCurPage(request);
		paging.setTag(keyword);
		
		List<HashMap<String, Object>> reviewlist = reviewService.reviewSearch(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("reviewlist", reviewlist);
	}
	
	// 뷰 페이지
	@RequestMapping(value = "/review/view", method = RequestMethod.GET)
	public void view(int reviewno, Model model) {
		logger.info("뷰 페이지");

		reviewService.upHit(reviewno);
		List<HashMap<String, Object>> viewlist = reviewService.getViewList(reviewno);
		List<Review_comment> getcomment = reviewService.getComment(reviewno);

		model.addAttribute("viewlist", viewlist);
		model.addAttribute("comment", getcomment);
	}
	
	// 추천수 
	@RequestMapping(value="/review/addlike", method=RequestMethod.POST)
	public void addlike(Model model, HttpServletRequest request, HttpServletResponse resp, Recommend recommend) {
		String result = request.getParameter("reviewno");
		String change  = request.getParameter("change");
		String mem = request.getParameter("memno");
		int reviewno = Integer.parseInt(result);
		int changeno = Integer.parseInt(change);
		int memno = Integer.parseInt(mem);
		
		reviewService.updateLike(reviewno, changeno);
		List<Recommend> rec = reviewService.updateRecommend(recommend, reviewno, changeno, memno);
		System.out.println("rec : " + rec);
		int uplike = reviewService.selectLike(reviewno);
		

		JSONObject obj = new JSONObject();
		obj.put("data", uplike);


        resp.setContentType("application/json ; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        try {
			resp.getWriter().write(obj.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// view 댓글
	@RequestMapping(value="/review/comment", method=RequestMethod.POST)
	public void comment(Model model, HttpServletRequest request, HttpServletResponse resp, Review_comment commentParam) {
		Review_comment comment = reviewService.getCommentParameter(request, commentParam);

		reviewService.InsertComment(comment);
		int reviewno = comment.getReview_no();
		
		List<Review_comment> newcomment = reviewService.getNewComment(reviewno);
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("newcomment : " + newcomment);
		
		JSONArray array = new JSONArray();
		for(int i  = 0; i <newcomment.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("commentno", newcomment.get(i).getComment_no());
			obj.put("nick", newcomment.get(i).getComment_nick());
			obj.put("content", newcomment.get(i).getComment_content());
			obj.put("pw", newcomment.get(i).getComment_password());
			obj.put("recommend", newcomment.get(i).getComment_recommend());
			obj.put("date",formatdate.format(newcomment.get(i).getComment_written_date()));
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
	
	@RequestMapping(value="/review/deleteNewComment", method=RequestMethod.POST)
	public void deleteNewComment(Model model, HttpServletRequest request, HttpServletResponse resp, Review_comment commentParam) {
			Review_comment deletecomment = reviewService.getDeleteParameter(request, commentParam);
			
			reviewService.deleteNewComment(deletecomment);
	}
	
	@RequestMapping(value="/review/deleteComment", method=RequestMethod.POST)
	public void deleteComment(Model model, HttpServletRequest request, HttpServletResponse resp, Review_comment commentParam) {
			Review_comment deletecomment = reviewService.getDeleteParameter(request, commentParam);
			System.out.println("deletecomment : " + deletecomment);
			
			reviewService.deleteComment(deletecomment);
	}
}
