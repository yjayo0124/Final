package web.controller.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

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

import web.dto.Cor;
import web.dto.Member;
import web.service.main.face.SearchMainService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	
	@Autowired SearchMainService searchmainService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main() {
			
		logger.info("main");
		
	}
	
	
	@RequestMapping(value="/main/autocomplete", method=RequestMethod.POST)
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

	@RequestMapping(value="/main/search", method=RequestMethod.GET)
	public void searchCor(String keyword, Model model) {
		
		List<Cor> corList = searchmainService.getSearch(keyword);

		model.addAttribute("list", corList);
	}
	
	

}
