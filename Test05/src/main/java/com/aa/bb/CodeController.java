package com.aa.bb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.aa.bb.domain.CodemngVO;
import com.aa.bb.domain.InItemVO;
import com.aa.bb.domain.ItemVO;
import com.aa.bb.domain.OutItemVO;
import com.aa.bb.userservice.userservice;

@Controller
public class CodeController{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private userservice userService;
	
	
	@RequestMapping(value = "codemng.do", method=RequestMethod.POST)
	public ModelAndView CodeList(ModelAndView md) throws Exception {
		
		List<CodemngVO> list = userService.ListAll();
		md.addObject("list", list);
		md.setViewName("Code/codmng");
		return md;
	}
	
	@RequestMapping(value = "/codeInsert.do", method=RequestMethod.POST)
	public ModelAndView CodeInsert(CodemngVO cdvo, ModelAndView md) throws Exception {
		

			logger.debug(">>>>>>>>>>>>>>>>"+cdvo.getCdlvl() +"<<<<<<<<<<<<<<<<<");
			userService.InsertCode(cdvo);
			List<CodemngVO> list = userService.ListAll();
			md.addObject("list", list);
			md.setViewName("Code/codmng");
			return md;
		
	}
	
	
	
	@RequestMapping(value = "/codeUpdate.do", method=RequestMethod.POST)
	public ModelAndView CodeUpdate(CodemngVO cdvo, ModelAndView md) throws Exception {
		

			logger.debug(">>>>>>>>>>>>>>>>"+cdvo.getCdlvl() +"<<<<<<<<<<<<<<<<<");
			userService.UpdateCode(cdvo);
			List<CodemngVO> list = userService.ListAll();
			md.addObject("list", list);
			md.setViewName("Code/codmng");
			return md;
		
	}
	
	@RequestMapping(value = "itemlist.do")
	public ModelAndView Itemlist(ModelAndView md) throws Exception {
		
		List<CodemngVO> list = userService.Categori();
		List<CodemngVO> mdname = userService.Madename();
		List<CodemngVO> unname = userService.Unitname();
		md.addObject("list", list);
		md.addObject("mdname", mdname);
		md.addObject("unname", unname);
		md.setViewName("Code/itemlist");
		return md;
		
	}
	
	@ResponseBody
	@RequestMapping(value="itemCategori.do", method = RequestMethod.POST) 
	public List<CodemngVO> Classfication(@RequestParam("cdno") String cdno  ) throws Exception {
		List<CodemngVO> classfica = userService.Classfication(cdno);
		//logger.debug(">>>>>>>>>>>>>"+cdno);
		return classfica;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "itemLookup.do", method=RequestMethod.POST)
	public List<ItemVO> ItemSearch(@RequestParam("itemclscd") String itemclscd) throws Exception {
		
	
			List<ItemVO> list = userService.ItemList(itemclscd);
			
			//for(ItemVO a : list)
			//	logger.debug(">>>>>>>>>>>>>"+a.getItemname());
			
			return list;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "itemInsert.do", method=RequestMethod.POST)
	public List<ItemVO> ItemInsert(@RequestParam("itemrefrsh") String itemrefrsh, @RequestParam("itemname") String itemname, @RequestParam("madenmcd") String madenmcd, @RequestParam("itemunitcd") String itemunitcd, @RequestParam("useyn") String useyn) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("itemclscd", itemrefrsh);
		map.put("itemname", itemname);
		map.put("madenmcd", madenmcd);
		map.put("itemunitcd", itemunitcd);
		map.put("useyn", useyn);
		logger.debug(">>>>>>>>>>>>>"+itemname);
		
		userService.InsertItem(map);
		List<ItemVO> list = userService.ItemList(itemrefrsh);
		logger.debug(">>>>>>>>>>>>>"+itemrefrsh);
		return list;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/itemUpdate.do", method=RequestMethod.POST)
	public List<ItemVO> ItemUpdate(@RequestParam("itemrefrsh") String itemrefrsh, @RequestParam("itemcd") String itemcd, @RequestParam("itemname") String itemname, @RequestParam("madenmcd") String madenmcd, @RequestParam("itemunitcd") String itemunitcd, @RequestParam("useyn") String useyn) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("itemcd", itemcd);
		map.put("itemname", itemname);
		map.put("madenmcd", madenmcd);
		map.put("itemunitcd", itemunitcd);
		map.put("useyn", useyn);
		//logger.debug(">>>>>>>>>>>>>"+itemname);

		userService.UpdateItem(map);
		List<ItemVO> list = userService.ItemList(itemrefrsh);
		return list;
	}
	
	@RequestMapping(value = "initem.do")
	public ModelAndView InItem(ModelAndView md) throws Exception {
		
		List<CodemngVO> list = userService.Categori();
		md.addObject("list", list);
		md.setViewName("Code/insitem");
		return md;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "initemLookup.do", method=RequestMethod.POST)
	public List<InItemVO> InItemSearch(@RequestParam("itemcd") String itemcd) throws Exception {
		
	
			List<InItemVO> list = userService.InItemList(itemcd);
			
		//	for(InItemVO a : list)
		//		a.getInsamt();
			
			return list;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "initemInsert.do", method=RequestMethod.POST)
	public List<InItemVO> InItemInsert(@RequestParam("insamt") String insamt, @RequestParam("itemcd") String itemcd, @RequestParam("insitemlistcd") String insitemlistcd) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("insamt", insamt);
		map.put("itemcd", itemcd);
		map.put("insitemlistcd", insitemlistcd);
		logger.debug(">>>>>>>>>>>>>"+itemcd);
		userService.InsertInItem(map);
		List<InItemVO> list = userService.InItemList(itemcd);
		
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "initemUpdate.do", method=RequestMethod.POST)
	public List<InItemVO> InItemUpdate(@RequestParam("insamt") String insamt, @RequestParam("itemcd") String itemcd, @RequestParam("insitemlistcd") String insitemlistcd) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("itemcd", itemcd);
		map.put("insamt", insamt);
		map.put("insitemlistcd", insitemlistcd);
		//logger.debug(">>>>>>>>>>>>>"+itemname);

		userService.UpdateInItem(map);
		List<InItemVO> list = userService.InItemList(itemcd);
		return list;
	}
	
	@RequestMapping(value = "outitem.do")
	public ModelAndView OutItem(ModelAndView md) {
		
		List<CodemngVO> list = userService.DeliveList();
		md.addObject("list", list);
		md.setViewName("Code/outitem");
		return md;
		
	}
//	@ResponseBody
	@RequestMapping(value = "OutItemList.do")
	public String OutItemList(Model md) throws Exception {
		
		List<OutItemVO> lists = userService.Outitemlist();
		md.addAttribute("lists", lists);
		return "Code/test";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "outitemupdate.do", method = RequestMethod.POST)
	public void OutItemUpdate(@RequestParam("checkyn") String checkyn, @RequestParam("delivyn") String delivyn, @RequestParam("delivcom") String delivcom, @RequestParam("delivno") String delivno, @RequestParam("outitemlistcd") String outitemlistcd, @RequestParam("delivamt") String delivamt, @RequestParam("itemcd") String itemcd) throws InterruptedException{
		Map<String, String> map = new HashMap<String, String>();
		map.put("checkyn", checkyn);
		map.put("delivyn", delivyn);
		map.put("delivcorpcd", delivcom);
		map.put("delivno", delivno);
		map.put("outitemlistcd", outitemlistcd);
		map.put("delivamt", delivamt);
		map.put("itemcd", itemcd);
		//logger.debug(">>>>>>>>>>>>>"+itemname);
		
		userService.UpdateOutItem(map);
	}
	
	
}