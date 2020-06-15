package com.aa.bb;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.aa.bb.domain.UserDetailVO;
import com.aa.bb.domain.UserVO;
import com.aa.bb.userservice.userservice;

@Controller 
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private userservice userService;
	

	@RequestMapping(value = "/", method = RequestMethod.GET) //***********로그인 화면 이동
	public String home() {		
		return "Login/login";
	}
	
	@RequestMapping("join.do") //***********회원가입 화면 이동
	public String Join( Model model) {		
		return "Login/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/idChk.do", method = RequestMethod.POST) //***********회원가입 중 아이디 중복확인
	public boolean idChk(@RequestParam("id") String id ) throws Exception {
		
		logger.debug(">>>>>>>>>>>>>"+id);

		return userService.Login(id,"");
	}
	
	@RequestMapping(value="/userCreate.do", method=RequestMethod.POST)//***********회원가입
	public ModelAndView userCreate(UserVO uservo, ModelAndView md) throws Exception{
		userService.Create(uservo);
		md.addObject("userid", uservo.getId());
		md.addObject("getInsdate", uservo.getInsdate());
		md.setViewName("Login/detail");
		return md;
		
	}
	
	
	@RequestMapping(value="/userDetail.do", method=RequestMethod.POST)//***********회원가입 상세
	public String userDetail(UserDetailVO userdetailvo) throws Exception{
		logger.debug(">>>>>>>>>><<<<<<<<<<"+userdetailvo.getUseyn());

		userService.CreateDetail(userdetailvo);
		return "Login/login";
		
	}
	

	@ResponseBody
	@RequestMapping(value = "login.do", method=RequestMethod.GET)//***********로그인
	public boolean login(@RequestParam("id") String id, @RequestParam("password") String password, HttpServletResponse response) throws IOException {
		
		boolean isSucess=userService.Login(id, password);
		logger.debug(id);
		logger.debug(password);
/*
		if(isSucess) {
			logger.info("로그인 성공");
			
		}else {
			logger.info("로그인 실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디나 비밀번호가 맞지 않습니다.'); history.go(-1); </script>");
			out.flush();
			
		}*/

		return isSucess;
	}
	
	
	
	/*
	@RequestMapping("empList.do")
	public ModelAndView empList(ModelAndView model) {
		List<BoardVO> list = empService.empList();
		model.addObject("empList",list);
		model.setViewName("EMP/empList");
		
		return model;
	}	
	
	@RequestMapping("empCreate.do")
	public ModelAndView empListCreate(ModelAndView md) throws Exception {
		
		List<BoardVO> list = empService.empList();
		md.addObject("empList",list);
		md.setViewName("EMP/empCreate");
		logger.info("WRITE GET	");
		return md;
	}	
	@RequestMapping(value="empCreate.do", method=RequestMethod.POST)
	public ModelAndView empListCreateFinish(BoardVO boardvo, ModelAndView md, HttpServletResponse response) throws Exception{
		logger.info(boardvo.toString());
		int cnt= empService.Count("EMPNO",boardvo.getEmpno());
		if(cnt>0) {
			logger.info("존재하는 회원번호");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 존재하는 회원번호입니다.'); history.go(-1); </script>");
			out.flush();
		}
		else {
		empService.Create(boardvo);
		List<BoardVO> list = empService.empList();
		md.addObject("empList",list);
		
		
		}
		md.setViewName("EMP/empCreate");
		return md;
		
	}
	
	@RequestMapping("empDelete.do")
	public ModelAndView empListDelete(ModelAndView md) throws Exception {
		
		List<BoardVO> list = empService.empList();
		md.addObject("empList",list);
		md.setViewName("EMP/empDelete");
		logger.info("delete GET	");
		return md;
	}
	@ResponseBody
	@RequestMapping(value="empDelete.do", method=RequestMethod.POST)
	public ModelAndView delete(@RequestParam("empNo") List<String> ids,ModelAndView md) throws Exception {
		for(String id : ids) empService.Delete(id);
		
		List<BoardVO> list = empService.empList();
		md.addObject("empList",list);
		md.setViewName("EMP/empDelete");
		return md;
	}
	
	@RequestMapping("empSearch.do")
	public ModelAndView empListSearch(@RequestParam(defaultValue="ENAME") String searchOption, @RequestParam(defaultValue="") String keyword) throws Exception {
		List<BoardVO> list = empService.empListSearch(searchOption,keyword);
		
		int cnt= empService.Count(searchOption,keyword);
		ModelAndView model = new ModelAndView();
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("empList", list);
		map.put("count", cnt);
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);

		model.addObject("map", map);
		model.setViewName("EMP/empSearch");

		
		return model;
	}	*/
	
	
}
