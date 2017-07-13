package com.animal.control;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.animal.domain.CenterReplyVO;
import com.animal.domain.CenterVO;
import com.animal.domain.Criteria;
import com.animal.domain.PageMaker;
import com.animal.service.CenterService;


@Controller
@RequestMapping("/center")
public class CenterController {

   @Inject
   private CenterService cservice;

   // 고객센터 게시글 입력창 오픈
   @RequestMapping(value = "/cinsert", method = RequestMethod.GET)
   public String centerinsertGET() throws Exception {
      return "user/center/center_confirm";
   }

   // 고객센터 게시글 입력
   @RequestMapping(value = "/cinsert", method = RequestMethod.POST)
   public String centerinsertPOST(CenterVO vo) throws Exception {
      cservice.cinsert(vo);
      return "redirect:/center/clist";
   }
   
   @RequestMapping("/cinfo")
   public String cread(int ctno,Model model,Criteria cri)throws Exception{
      model.addAttribute("CenterVO",cservice.cread(ctno));
      model.addAttribute("cri",cri);
      return "/user/center/center_info";
   }
   
   @RequestMapping(value="/clist",method=RequestMethod.GET)
   public String clist(@ModelAttribute("cri") Criteria cri, Model model)throws Exception{
      model.addAttribute("list", cservice.clist(cri));
      PageMaker maker = new PageMaker();
      maker.setCri(cri);
      maker.setTotalCount(cservice.clistcount(cri));
      model.addAttribute("pageMaker", maker);
      return "user/center/center_list";
   }
   
   //답변 호출
      @RequestMapping(value="/replies/all/{ctno}", method=RequestMethod.GET)
      @ResponseBody
      public List<CenterReplyVO> list(@PathVariable("ctno")int ctno)throws Exception{
         List<CenterReplyVO> list = cservice.creply(ctno);
         System.out.println(list.get(0));
         return list;
      }
}