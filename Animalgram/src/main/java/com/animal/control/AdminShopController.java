package com.animal.control;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.animal.domain.CareVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.domain.ShopVO;
import com.animal.service.AdminShopService;


@Controller
@RequestMapping("/shop")
public class AdminShopController {
	
	@Inject
	private AdminShopService service;

	//���޸����߰�������
	@RequestMapping("/addshop")
	public String addshopGET()throws Exception{
		
		return "admin/shop/ad_shop_add";
	}
	//���޸����߰�������(DB�Է�)
	@RequestMapping(value="/addshop",method=RequestMethod.POST)
	public String addshopPOST(ShopVO vo,RedirectAttributes attr)throws Exception{
		service.insert(vo);//insert�� ȣ��
		
		attr.addFlashAttribute("msg","SUCCESS"); //"msg"Ű������ "success"����.
		
		
		return "redirect:/shop/ad_list";//�ؿ��ؿ� ad_list�޼ҵ� ȣ��
	}
	
	
	
	
	//���޸������������
	@RequestMapping(value="/modifyshop",method=RequestMethod.POST )
	public String modifyshop(ShopVO vo,RedirectAttributes attr)throws Exception{//������ưŬ��
		
		service.modify(vo);
		attr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/shop/ad_list";
	
	
	
	}
	
	//�������忡�� ��ü����Ʈ �ҷ�����
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String userlist(@ModelAttribute("cri") SearchCriteria cri,Model model)throws Exception{
		
		model.addAttribute("list",service.listSearchCriteria(cri));
			PageMaker maker=new PageMaker();
				maker.setCri(cri);
				maker.setTotalCount(service.listSearchCount(cri));
		        
				model.addAttribute("pageMaker",maker);
		return "user/shop/shop_list";
	}//list
	
	//�������忡�� ��ü����Ʈ �ҷ�����
	@RequestMapping("/ad_list")
	public String adminlist(@ModelAttribute("cri") SearchCriteria cri,Model model)throws Exception{
		//List<ShopVO> list=service.listCriteria(cri);
		
		
		//model.addAttribute("list",list);
		model.addAttribute("list",service.listSearchCriteria(cri));
		PageMaker maker=new PageMaker();
			maker.setCri(cri);
			maker.setTotalCount(service.listSearchCount(cri));
	        
			model.addAttribute("pageMaker",maker);
		return "admin/shop/ad_shop_list";
	}//list
	
	  //����ó��
    @RequestMapping("/deleteshop")
    public String delete(int shno,RedirectAttributes attr)throws Exception{ //int shno, Model model

    	
    	service.remove(shno);
    	attr.addFlashAttribute("msg","SUCCESS");
    	
    	
    	
    	
       return "redirect:/shop/ad_list";//�̵� JSP
    }//delete
    

    
  
    
    
    
    

  
}
