package com.gbm.edu.api.restcontroller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gbm.edu.api.service.EduApiService;
import com.gbm.edu.util.CamelCaseMap;

@RestController
@RequestMapping(path="/web")
public class EduApiRestController {

	// 게시판 메인페이지
    @RequestMapping("/")
	public ModelAndView getMain() {
    	ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
    
    // 글 목록
  	@RequestMapping("/getBoardList.do")
  	public ModelAndView getBoardList() {
  		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardList");
		return mv;
  	}
  	
  	// 글 쓰기
  	@RequestMapping("/moveInsertBoard.do") 
  	public ModelAndView moveInsertBoard()throws Exception{
  		ModelAndView mv = new ModelAndView();
		mv.setViewName("insertBoard");
		return mv;
  	}
  	 
  	// 글 수정
  	@RequestMapping("/updateBoard.do")
  	public ModelAndView updateBoard() {
  		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateBoard");
		return mv;
  	}
    
}
