package web.controller.review;

import java.io.IOException;
import java.util.List;

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
import web.service.main.face.SearchMainService;

@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired SearchMainService searchmainService;
	
	@RequestMapping(value = "/review/writePop", method = RequestMethod.GET) 
	public void corInfo() {
		
	}
	
	@RequestMapping(value="/review/autocomplete", method=RequestMethod.POST)
	public void autocompleteText(Model model, HttpServletRequest request, HttpServletResponse resp) {
		String result = request.getParameter("keyword");

//		System.out.println(result);
		List<Cor> list = searchmainService.autocomplete(result);
		
//		System.out.println(list);
		JSONArray array = new JSONArray();
		for(int i  = 0; i <list.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("data", list.get(i).getCor_name());
			// jsonobject�뿉 �뱾�뼱媛��뒗 媛� test
//			System.out.println(obj);
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
	
}
