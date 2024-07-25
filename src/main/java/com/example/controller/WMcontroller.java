package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.WordDAO;
import com.example.model.WordTO;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class WMcontroller {
	
	@Autowired
	private WordDAO wdao;

	// 메인 페이지
	@RequestMapping("wm.do")
	public ModelAndView main() {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/main");
		
		return modelAndView;
	}
	
	
	// 영어 단어 리스트 페이지
	@RequestMapping("ememorize.do")
	public ModelAndView memorize(HttpServletRequest request) {
		
		ArrayList<WordTO> totalList = wdao.wordList();
		ArrayList<WordTO> engList = new ArrayList<>();
		
		String wId = request.getParameter("wId");
		
		for(WordTO to : totalList) {
		if(to.getCategory().equals("English")) {
			
			engList.add(to);
						
			}
		
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("memorizeList/english_memorize");
		modelAndView.addObject("engList", engList);
		modelAndView.addObject("wId", wId);
		
		return modelAndView;
	}
	
	// 일본어 단어 리스트 페이지
	@RequestMapping("jmemorize.do")
	public ModelAndView jmemorize(HttpServletRequest request) {
		
		ArrayList<WordTO> totalList = wdao.wordList();
		ArrayList<WordTO> japanList = new ArrayList<>();
		
		for(WordTO to : totalList) {
		if(to.getCategory().equals("Japanese")) {
			
			japanList.add(to);
			
			}
		
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("memorizeList/japan_memorize");
		modelAndView.addObject("japanList", japanList);
		
		return modelAndView;
	}
	
	//중국어 단어 리스트 페이지
	@RequestMapping("cmemorize.do")
	public ModelAndView cmemorize(HttpServletRequest request) {
		
		ArrayList<WordTO> totalList = wdao.wordList();
		ArrayList<WordTO> chinaList = new ArrayList<>();
		
		for(WordTO to : totalList) {
		if(to.getCategory().equals("Chinese")) {
			
			chinaList.add(to);
			
			}
		
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("memorizeList/china_memorize");
		modelAndView.addObject("chinaList", chinaList);
		
		return modelAndView;
	}
	
	@RequestMapping("wordWrite.do")
	public ModelAndView wordWrite(HttpServletRequest request) {
		
		WordTO to = new WordTO();
		
		to.setCategory(request.getParameter("category"));
		to.setWname(request.getParameter("word"));
		to.setWmean(request.getParameter("mean"));
		to.setWtype(request.getParameter("part"));
		
		int flag = wdao.wordWrite(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("memorizeList/wordWriteOk");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	
	// 삭제, 전체삭제
	@RequestMapping("wordDelete.do")
	public ModelAndView ewordmanage(HttpServletRequest request) {
		
		int flag = 1;
		
		String wId = request.getParameter("wId");
		String delete = request.getParameter("dbtn");
		String allDelete = request.getParameter("abtn");
				
		//단어삭제 버튼
		if(delete != null) {
			WordTO to = new WordTO();
			to.setWId(request.getParameter(wId));
			flag = wdao.wordDelete(to);
		}
		//전체삭제 버튼
		else if(allDelete != null) {
			String category = request.getParameter("category");
			flag = wdao.allDelete(category);
			
		}
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("memorizeList/wordDeleteOk");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	// 단어 수정
	@RequestMapping("wordModifyOk.do")
	public ModelAndView wordModifyOk(HttpServletRequest request) {
		
		WordTO to = new WordTO();
		
		String wId = request.getParameter("wId");
			
		to.setWId(wId);
		
		to.setWname(request.getParameter("mword"));
		to.setWmean(request.getParameter("mmean"));
		to.setWtype(request.getParameter("mpart"));
		
		int flag = wdao.wordModify(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("memorizeList/wordModifyOk");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
}
