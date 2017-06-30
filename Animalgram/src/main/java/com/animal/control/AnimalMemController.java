package com.animal.control;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.animal.domain.MemConfirmVO;
import com.animal.service.MemberConfirmSer;

@Controller
@RequestMapping("/member")
public class AnimalMemController {

	@Inject
	private MemberConfirmSer service;
	
	// ����
	@RequestMapping("/main")
	public String login()throws Exception{
		return "user/base/main";
	}
	
	// ȸ������ ��
	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public String regist()throws Exception{
		return "user/member/member_confirm";
	}
	
	// ȸ�� ����
	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public String regist2(MemConfirmVO vo,String birth1, String birth2,String birth3,
			String addrno,String addr1,String addr2)throws Exception{
		String birth = birth1 +"/"+ birth2 +"/"+ birth3;
		String maddr = addrno +"/"+ addr1 +"/"+ addr2;

		vo.setBirth(birth);
		vo.setMaddr(maddr);

		System.out.println("�Էµ� �� Ȯ�� : "+vo.toString());
		service.regist(vo);
		return "redirect:/member/main";
	}
	
	// ���̵� �ߺ�Ȯ��
	@RequestMapping("/idcheck")
	public String idCheck()throws Exception{
		return "user/member/idcheck";
	}
	
	// ���̵� ã��
	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public String idFind()throws Exception{
		return "user/member/member_idpass";
	}
	
	// ��й�ȣ ã�� ��
	@RequestMapping(value = "/pass", method = RequestMethod.GET)
	public String passFind()throws Exception{
		return "user/member/member_pass";
	}
	
	// �α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/member/main";
	}

} // class
