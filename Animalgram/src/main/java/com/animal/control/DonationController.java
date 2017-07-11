package com.animal.control;

import javax.annotation.Resource;
import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.animal.domain.DonationAskVO;
import com.animal.domain.DonationVO;
import com.animal.domain.PageMaker;
import com.animal.domain.SearchCriteria;
import com.animal.service.DonationAskService;
import com.animal.service.DonationService;

@Controller
@RequestMapping("/user/donation") //공통매핑
public class DonationController {
   
	/*	private static final Logger logger = LoggerFactory.getLogger(DonationController.class);
	@Resource(name = "uploadPath")
	  private String uploadPath;*/
  
	@Inject
    private DonationService donationservice; //DB관련작업	
   
	@Inject
	private DonationAskService askservice;

	@Resource
	String path;
	
	@RequestMapping("/donation_seller_list")
	public String seller(SearchCriteria cri, Model model)throws Exception{
		model.addAttribute("list", donationservice.listSearchCriteria(cri));  
		   PageMaker maker = new PageMaker();
		     maker.setCri(cri);
		     
		  maker.setTotalCount(donationservice.listSearchCount(cri));//끝페이지 번호를 조정  11~20  ---->  11~18 pageMaker
		     
		  model.addAttribute("pageMaker", maker); 
		
	    return "user/donation/donation_seller_list";
	}
	
	@RequestMapping("/donation_bill_list")
	public void exercise(SearchCriteria cri,Model model,DonationAskVO davo)throws Exception{
		
		System.out.println("askservice.listAsk(cri) :"+askservice.listAsk(cri));
		model.addAttribute("list", askservice.listAsk(cri));
		 PageMaker maker = new PageMaker();
	     maker.setCri(cri);
	     
	     System.out.println("페이징 한페이지갯수 ::::::"+askservice.listSearchCount(cri));
	  maker.setTotalCount(askservice.listSearchCount(cri));//끝페이지 번호를 조정  11~20  ---->  11~18 pageMaker
    
	  model.addAttribute("pageMaker", maker); 	
	    
	}
	
   @RequestMapping(value="/donation_list", method=RequestMethod.GET)
   public void listPage(SearchCriteria cri, Model model)throws Exception{
	   
	   
	 System.out.println("cri :"+ cri);  
	 model.addAttribute("list", donationservice.listSearchCriteria(cri));  
	 System.out.println("donation controller list ::"+donationservice.listSearchCriteria(cri));
	 
	 
	   PageMaker maker = new PageMaker();
	     maker.setCri(cri);
	     
	   System.out.println("list 뿌려주는 경로");
	  maker.setTotalCount(donationservice.listSearchCount(cri));//끝페이지 번호를 조정  11~20  ---->  11~18 pageMaker
	     
	  model.addAttribute("pageMaker", maker); 

   }//listPage
  
   @RequestMapping("/donationask")
   public String billask(DonationAskVO davo,int dno) throws Exception{
	      
	   askservice.registAsk(davo);
	   System.out.println("donationController.registAsk :"+davo);
	   /*service.sellcount(vo);*/
	   return "redirect:/user/donation/donation_list";
   }
   
   @RequestMapping("/donation_sale")
   public void sale(int dno,Model model, SearchCriteria cri){
	  try {
		model.addAttribute("donationVO",donationservice.read(dno));
		
		model.addAttribute("cri",cri);
	} catch (Exception e) {
		e.printStackTrace();
	}
   }//readPage
   
   @RequestMapping("/donation_readPage")
   public String readPage(int dno, Model model, SearchCriteria cri )throws Exception{    
	   model.addAttribute("donationVO",donationservice.read(dno));   

   	model.addAttribute("cri",cri);
   	return "user/donation/donation_readPage";//이동 JSP
   }
   
   @RequestMapping(value = "/donation_removePage", method = RequestMethod.POST)
   public String remove(@RequestParam("dno") int dno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

	   System.out.println("donation controller :"+dno);
	   askservice.removeAsk(dno);
	   donationservice.remove(dno);
     
     rttr.addAttribute("page", cri.getPage());
     rttr.addAttribute("perPageNum", cri.getPerPageNum());
     rttr.addAttribute("searchType", cri.getSearchType());
     rttr.addAttribute("keyword", cri.getKeyword());

     rttr.addFlashAttribute("msg", "SUCCESS");

     return "redirect:/user/donation/donation_seller_list";
   }

   @RequestMapping(value = "/donation_modifyPage", method = RequestMethod.GET)
   public void modifyPagingGET(int dno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
     model.addAttribute("donationVO",donationservice.read(dno));
     System.out.println("donation controller modify: "+dno);
   }

   @RequestMapping(value = "/donation_modifyPage", method = RequestMethod.POST)
   public String modifyPagingPOST(DonationVO dvo, SearchCriteria cri, RedirectAttributes rttr,MultipartFile file) throws Exception {
	   String fileName = file.getOriginalFilename();
		  FileUpload.fileUpload(file,path,fileName);
		   
		   dvo.setDimage("/resources/bootstrapPro/img/custom/"+fileName);
	   
	   
	  System.out.println("donation controller :"+dvo);
	 donationservice.modify(dvo);

     rttr.addAttribute("page", cri.getPage());
     rttr.addAttribute("perPageNum", cri.getPerPageNum());
     rttr.addAttribute("searchType", cri.getSearchType());
     rttr.addAttribute("keyword", cri.getKeyword());

     rttr.addFlashAttribute("msg", "SUCCESS");

     return "redirect:/user/donation/donation_seller_list";
   }
   
   @RequestMapping(value="/donation_confirm", method= RequestMethod.GET)//입력폼 출력
   public void form(){	 
	   
   }
   
   @RequestMapping(value="/donation_confirm", method= RequestMethod.POST)//입력처리
   public String register(DonationVO dvo,RedirectAttributes attr, MultipartFile file)throws Exception{	   
	   String fileName = file.getOriginalFilename();
	  FileUpload.fileUpload(file,path,fileName);
	   
	   dvo.setDimage("/resources/bootstrapPro/img/custom/"+fileName);

	   donationservice.regist(dvo);
	   
	   attr.addFlashAttribute("msg", "SUCCESS");
	   
	  return "redirect:/user/donation/donation_list";
   }
   
   @RequestMapping("/donation_result")
   public String result(int dno,Model model)throws Exception{
	   model.addAttribute("donationVO",donationservice.read(dno));   	
	   return "user/donation/donation_result";
   }
   /*  
   @RequestMapping("/bill")
   public String bill()throws Exception{
	   
	   return "user/custom/custom_list";
   }
   */
   
 /*  @RequestMapping("/getAttach/{cuno}")
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
	  */
//========================================================주문제작 여기까지===================================================================//	
	  
	  
	  
}//SearchBoardController
