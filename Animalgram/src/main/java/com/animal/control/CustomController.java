package com.animal.control;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.animal.domain.BillVO;
import com.animal.domain.Criteria;
import com.animal.domain.CustomAttachVO;
import com.animal.domain.CustomVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.BillService;
import com.animal.service.CustomService;
import com.animal.util.MediaUtils;

@Controller
@RequestMapping("/user/custom") //공통매핑
public class CustomController {
   
	private static final Logger logger = LoggerFactory.getLogger(CustomController.class);
	@Resource(name = "uploadPath")
	  private String uploadPath;
  
	@Inject
   private CustomService service; //DB관련작업	
   
	@Inject
	private BillService bservice;

	@RequestMapping("/seller_list")
	public String seller(SearchCriteria cri, Model model)throws Exception{
		model.addAttribute("list", service.listSearchCriteria(cri));  
		   PageMaker maker = new PageMaker();
		     maker.setCri(cri);
		     
		  maker.setTotalCount(service.listSearchCount(cri));//끝페이지 번호를 조정  11~20  ---->  11~18 pageMaker
		     
		  model.addAttribute("pageMaker", maker); 
		
	    return "user/custom/seller_list";
	}
	
	@RequestMapping("/bill_list")
	public void exercise(SearchCriteria cri,Model model,BillVO bvo)throws Exception{
	
		model.addAttribute("list", bservice.listBill(cri));
		System.out.println("bservice.listBill(cri) :"+bservice.listBill(cri));
		 PageMaker maker = new PageMaker();
	     maker.setCri(cri);
	     
	  maker.setTotalCount(bservice.listSearchCount(cri));//끝페이지 번호를 조정  11~20  ---->  11~18 pageMaker
    
	  model.addAttribute("pageMaker", maker); 	
	    
	}
	
   @RequestMapping(value="/custom_list", method=RequestMethod.GET)
   public void listPage(SearchCriteria cri, Model model)throws Exception{
	   
	   
	 System.out.println("cri :"+ cri);  
	 model.addAttribute("list", service.listSearchCriteria(cri));  
	 System.out.println("service.listSearchCriteria(cri) :"+service.listSearchCriteria(cri));
	 
	 
	   PageMaker maker = new PageMaker();
	     maker.setCri(cri);
	     
	   System.out.println("list 뿌려주는 경로");
	  maker.setTotalCount(service.listSearchCount(cri));//끝페이지 번호를 조정  11~20  ---->  11~18 pageMaker
	     
	  model.addAttribute("pageMaker", maker); 

/*	  bservice.registBill(bvo);*/
   }//listPage
  
   @RequestMapping("/billask")
   public String billask(BillVO bvo,CustomVO vo,int cuno) throws Exception{
	      
	   System.out.println("bservice.registBill(bvo)"+bvo);
	   bservice.registBill(bvo);
/*	   service.sellcount(vo);*/
	   return "redirect:/user/custom/custom_list";
   }
   
   @RequestMapping("/custom_sale")
   public void sale(int cuno,Model model, SearchCriteria cri){
	  try {
		  System.out.println("service.read(cuno):"+service.read(cuno));
		model.addAttribute("customVO",service.read(cuno));
		
		model.addAttribute("cri",cri);
	} catch (Exception e) {
		e.printStackTrace();
	}
   }//readPage
   
   @RequestMapping("/readPage")
   public String readPage(int cuno, Model model, SearchCriteria cri )throws Exception{    
	   model.addAttribute("customVO",service.read(cuno));   
   	System.out.println("readPage===="+service.read(cuno));
   	System.out.println("cuno :"+cuno);
   	model.addAttribute("cri",cri);
   	return "user/custom/readPage";//이동 JSP
   }
   
   @RequestMapping(value = "/removePage", method = RequestMethod.POST)
   public String remove(@RequestParam("cuno") int cuno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

     service.remove(cuno);
     
     System.out.println("removePage: 00000000000000000000");
     rttr.addAttribute("page", cri.getPage());
     rttr.addAttribute("perPageNum", cri.getPerPageNum());
     rttr.addAttribute("searchType", cri.getSearchType());
     rttr.addAttribute("keyword", cri.getKeyword());

     rttr.addFlashAttribute("msg", "SUCCESS");
     System.out.println("곧 삭제 후 리스트 나온다!");
     return "redirect:/user/custom/seller_list";
   }

   @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
   public void modifyPagingGET(int cuno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	   System.out.println("수정 들어옴===========================================");
	   System.out.println("service.read(cuno): "+service.read(cuno));
     model.addAttribute("customVO",service.read(cuno));
     System.out.println(11);
   }

   @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
   public String modifyPagingPOST(CustomVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

     logger.info(cri.toString());
     System.out.println("service.modify(vo) :"+ vo);
     System.out.println("vo.getcInfo:"+vo.getCuinfo());
     service.modify(vo);

     rttr.addAttribute("page", cri.getPage());
     rttr.addAttribute("perPageNum", cri.getPerPageNum());
     rttr.addAttribute("searchType", cri.getSearchType());
     rttr.addAttribute("keyword", cri.getKeyword());

     rttr.addFlashAttribute("msg", "SUCCESS");

     logger.info(rttr.toString());

     return "redirect:/user/custom/seller_list";
   }
   
   @RequestMapping(value="/custom_confirm", method= RequestMethod.GET)//입력폼 출력
   public void form(){	 
	   
   }
   
   @RequestMapping(value="/custom_confirm", method= RequestMethod.POST)//입력처리
   public String register(CustomVO vo,CustomAttachVO avo, RedirectAttributes attr)throws Exception{	   
	   
	   service.regist(vo,avo);
	   System.out.println("customcontroller-vo :"+vo);
	   System.out.println("customcontroller-avo :"+avo);
	   attr.addFlashAttribute("msg", "SUCCESS");
	   
	  return "redirect:/user/custom/seller_list";
   }
   
   @RequestMapping("/custom_result")
   public String result(int cuno,Model model,int bcount, Map map)throws Exception{
	   model.addAttribute("customVO",service.read(cuno));
	   map.put("bcount", bcount);
	   System.out.println("bcount :"+bcount);
	 
	   	
	   return "user/custom/custom_result";
   }
   
   @RequestMapping("/bill")
   public String bill()throws Exception{
	   
	   return "user/custom/custom_list";
   }
   
   
   @RequestMapping("/getAttach/{cuno}")
   @ResponseBody
   public List<String> getAttach(@PathVariable("cuno")int cuno,CustomVO vo)throws Exception{
     System.out.println("service.getAttach(cuno):"+service.getAttach(cuno));
     return service.getAttach(cuno);
   }  
   
   
	  @ResponseBody //수정창에서 사진 X버튼 누르면 여기로 들어옴.
	  @RequestMapping(value="/removeFile", method=RequestMethod.POST)
	  public ResponseEntity<String> removeFile(int cuno, String fileName){
		  
		  logger.info("delete file: "+ fileName);
		  
		  String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		  
		  MediaType mType = MediaUtils.getMediaType(formatName);
		  
		  if(mType != null){      
			  
			  String front = fileName.substring(0,12);
			  String end = fileName.substring(14);
			  new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		  }
		  
		  new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		  
		  try {
			service.deleteAttach(cuno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  return new ResponseEntity<String>("deleted", HttpStatus.OK);
	  }  
	  
//========================================================주문제작 여기까지===================================================================//	
	  
	  
	  
}//SearchBoardController





