package com.animal.control;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.animal.domain.AnimalVO;
import com.animal.domain.Criteria;
import com.animal.domain.MemConfirmVO;
import com.animal.domain.PageMaker;
import com.animal.domain.ProfessionalVO;
import com.animal.domain.SellerVO;
import com.animal.service.AnimalService;
import com.animal.service.CenterService;
import com.animal.service.MemberConfirmSer;

@Controller
@RequestMapping("/member")
public class AnimalMemController {

	@Inject
	private MemberConfirmSer service;
	@Inject
	private AnimalService aniservice;
	@Inject
	private CenterService cservice;

	// ����
	@RequestMapping("/main")
	public String login() throws Exception {
		return "user/base/main";
	}

	// ȸ������ ��
	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public String regist() throws Exception {
		return "user/member/member_confirm";
	}

	// ȸ�� ����
	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public String regist2(MemConfirmVO vo, String birth1, String birth2, String birth3, String addrno, String addr1,
			String addr2) throws Exception {
		String birth = birth1 + "/" + birth2 + "/" + birth3;
		String maddr = addrno + "/" + addr1 + "/" + addr2;

		vo.setBirth(birth);
		vo.setMaddr(maddr);

		System.out.println("�Էµ� �� Ȯ�� : " + vo.toString());
		service.regist(vo);
		return "redirect:/member/main";
	}
	
	// ���̵� �ߺ�Ȯ��
	@RequestMapping("/idcheck")
	public String idCheck() throws Exception {
		return "user/member/idcheck";
	}

	// ���̵� ã��
	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public String idFind() throws Exception {
		return "user/member/member_idpass";
	}

	// ��й�ȣ ã�� ��
	@RequestMapping(value = "/pass", method = RequestMethod.GET)
	public String passFind() throws Exception {
		return "user/member/member_pass";
	}

	// �α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/member/main";
	}

	// ���������� �̵�
	@RequestMapping(value="/mypage",method=RequestMethod.GET)
	public String mypage(Criteria cri, HttpSession session, Model model,String tab) throws Exception {
		
		String nickname = (String) session.getAttribute("user");
		// Job ������
		model.addAttribute("job",service.selectPro(nickname));
		
		model.addAttribute("mem", service.meminfo(nickname));  // ȸ������ �ҷ�����
	
		model.addAttribute("list", aniservice.selecAni(nickname));  //������ ���
		cri.setNickname(nickname);
		
		
		int selectedPage= cri.getPage();
		cri.setPage(1);
		
		if(tab != null && tab.equals("matching"))
		// �Ҹ��� ��Ȳ ���
		{
			cri.setPage(selectedPage);
		}
		model.addAttribute("agroup", aniservice.agroupList(cri));	
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(aniservice.agroupCount(cri));
		model.addAttribute("pageMaker", maker);
		model.addAttribute("select1",cri.getPage());
		
		cri.setPage(1);
		
		 if(tab != null && tab.equals("training"))
		// �Ʒ� ��Ȳ ���
		{
			 cri.setPage(selectedPage);
	    }
		 
		model.addAttribute("care",aniservice.careList(cri));		
		maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(aniservice.careCount(cri));
		model.addAttribute("carePage",maker);
		model.addAttribute("select2",cri.getPage());
		
		cri.setPage(1);
		
		if(tab != null && tab.equals("training_select_pro"))
			// �Ʒ� ��Ȳ ��� (��������)
			{
				 cri.setPage(selectedPage);
			}
				 
			model.addAttribute("care_select_pro",aniservice.procareSelect(cri));		
			maker = new PageMaker();
			maker.setCri(cri);
			maker.setTotalCount(aniservice.careProSelcount(cri));
			model.addAttribute("care_select_proPage",maker);
			model.addAttribute("select3",cri.getPage());
				
			cri.setPage(1);
		
		if(tab != null && tab.equals("training_pro"))
			// �Ʒ� ��Ȳ ��û ��� (��������)
			{
				 cri.setPage(selectedPage);
		    }
			 
			model.addAttribute("care_pro",aniservice.procare(cri));		
			maker = new PageMaker();
			maker.setCri(cri);
			maker.setTotalCount(aniservice.careProcount(cri));
			model.addAttribute("care_proPage",maker);
			model.addAttribute("select4",cri.getPage());
			
			cri.setPage(1);
			
			if(tab != null && tab.equals("training_pro_comit"))
				// �Ʒ� ��Ȳ ��û ���� ��� (��������)
				{
					 cri.setPage(selectedPage);
			    }
				 
				model.addAttribute("care_comit",aniservice.procareComit(cri));		
				maker = new PageMaker();
				maker.setCri(cri);
				maker.setTotalCount(aniservice.careProcountComit(cri));
				model.addAttribute("care_comitPage",maker);
				model.addAttribute("select5",cri.getPage());
				
			cri.setPage(1);
			
			if(tab != null && tab.equals("custom_sel"))
				// �Ǹ� ��ǰ ��� (�Ǹ��ڿ�)
				{
					 cri.setPage(selectedPage);
			    }
				 
				model.addAttribute("custom_sel",aniservice.customSelect(cri));		
				maker = new PageMaker();
				maker.setCri(cri);
				maker.setTotalCount(aniservice.customPage(cri));
				model.addAttribute("custom_page",maker);
				model.addAttribute("select6",cri.getPage());
				
			cri.setPage(1);
			
			if(tab != null && tab.equals("bill_sel"))
				// �Ǹ� ��û ��� (�Ǹ��ڿ�)
				{
					 cri.setPage(selectedPage);
			    }
				 
				model.addAttribute("bill_sel",aniservice.billSelect(cri));		
				maker = new PageMaker();
				maker.setCri(cri);
				maker.setTotalCount(aniservice.billCount(cri));
				model.addAttribute("bill_page",maker);
				model.addAttribute("select7",cri.getPage());
				
			cri.setPage(1);
			
			if(tab != null && tab.equals("bill_comit_sel"))
				// �Ǹ� ��û ��� (�Ǹ��ڿ�)
				{
					 cri.setPage(selectedPage);
			    }
				 
				model.addAttribute("bill_comit_sel",aniservice.billComit(cri));		
				maker = new PageMaker();
				maker.setCri(cri);
				maker.setTotalCount(aniservice.billComitCount(cri));
				model.addAttribute("bill_comit_page",maker);
				model.addAttribute("select8",cri.getPage());
				
			cri.setPage(1);
			
			if(tab != null && tab.equals("center_list"))
				// �Ǹ� ��û ��� (�Ǹ��ڿ�)
				{
					 cri.setPage(selectedPage);
			    }
				 
				model.addAttribute("center", cservice.clist(cri));
				maker = new PageMaker();
				maker.setCri(cri);
				maker.setTotalCount(cservice.clistcount(cri));
				model.addAttribute("center_maker", maker);
				model.addAttribute("select9",cri.getPage());
				
			cri.setPage(1);
		
		//ó�� ���޵� ������ ������ �ǵ�����
		//cri.setPage(selectedPage);
		
		
		return "user/member/mypage";
	}
	
	// �� ���� ����
	@RequestMapping("/modify_mem")
	public String modify(MemConfirmVO vo, String addrno, String addr1,String addr2)throws Exception{
		String maddr = addrno + "/" + addr1 + "/" + addr2;
		vo.setMaddr(maddr);
		System.out.println(vo.toString());
		boolean aa = service.modify(vo);
		return "redirect:mypage";
	}
	
	// ���� �� ���
	@RequestMapping("/pet_insert")
	public String petInsert(AnimalVO vo, HttpServletRequest request) {
		System.out.println("���� �� ��Ʈ��");
		try {
			MultipartHttpServletRequest m = (MultipartHttpServletRequest) request;

			Iterator<String> itr = m.getFileNames();
			MultipartFile multipartFile = null;

			String filePath = "C:/Users/Heesu/workspace/Animalgram_local/src/main/webapp/resources/upload";

			File file = new File(filePath + "/" + vo.getNickname());

			while (itr.hasNext()) {
				if (!file.exists())
					file.mkdirs();
				multipartFile = m.getFile(itr.next());
				if (!multipartFile.isEmpty()) {
					File serverFile = new File(
							filePath + "/" + vo.getNickname() + "/" + multipartFile.getOriginalFilename());
					multipartFile.transferTo(serverFile);
					vo.setAimage(multipartFile.getOriginalFilename());
				}
			}
			aniservice.insertAni(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:mypage";
	}

	// ������ ���
	@RequestMapping(value="/pro_insert",method=RequestMethod.POST)
	public String proInsert(ProfessionalVO vo,String pcareer1, String pcareer2, 
			                  HttpServletRequest request ) {
		//ServletContext application = request.getSession().getServletContext();
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println("�Ŀ�: "+ rootPath);
		try {
			String pcareer = pcareer1 + pcareer2;
			MultipartHttpServletRequest m = (MultipartHttpServletRequest) request;
			
			Iterator<String> itr = m.getFileNames();
			MultipartFile multipartFile = null;
			
			String filePath = rootPath+"resources/proimage";
			//String filePath = rootPath+"src/main/webapp/resources/proimage";
					//"C:/Users/Heesu/workspace/Animalgram_local/src/main/webapp/resources/proimage";
			
			File file = new File(filePath + "/" + vo.getNickname());
			
			while (itr.hasNext()) {
				if (!file.exists())
					file.mkdirs();
				multipartFile = m.getFile(itr.next());
				if (!multipartFile.isEmpty()) {
					File serverFile = new File(filePath + "/" + vo.getNickname() + "/" + multipartFile.getOriginalFilename());
					multipartFile.transferTo(serverFile);
					vo.setPimage(multipartFile.getOriginalFilename());
				}
			}
			vo.setPcareer(pcareer);
			Map<String,Object> map = new HashMap<>();
			map.put("job", "pro");
			map.put("nickname", vo.getNickname());
			aniservice.insertPro(vo,map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:mypage";
	}

	// �Ǹ��� ���
	@RequestMapping("/sel_insert")
	public String selInsert(SellerVO vo, HttpSession session, String addrno, String addr1, String addr2)
			throws Exception {
		String nickname = (String) session.getAttribute("user");
		String saddr = addrno + "/" + addr1 + "/" + addr2;
		vo.setSaddr(saddr);
		vo.setNickname(nickname);
		aniservice.insertSel(vo);
		return "redirect:mypage";
	}
	
} // class