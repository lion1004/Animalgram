package com.animal.control;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.AdminShopService;

@Controller
@RequestMapping("/admin/*")
public class AdminShopController {
	
	@Inject
	AdminShopService service;
	
	@RequestMapping("/shop_list")
	public String shopList(@ModelAttribute("cri") SearchCriteria cri,Model model,
			RedirectAttributes rttr, HttpSession session){
		
		model.addAttribute("list",service.listShop(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.shopCount(cri));
		model.addAttribute("pageMaker",pageMaker);

		return "admin/shop/ad_shop_list";
	}
	
	@RequestMapping("/shop_delete")
	public @ResponseBody String customDelete(@RequestParam(value="shno", required=true)List<Integer>list){
		if(service.deleteShop(list)>0){
			return "삭제 성공";
		}else{
			return "삭제 실패";
		}
	}
}
