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
	
	// 메인
	@RequestMapping("/main")
	public String login()throws Exception{
		return "user/base/main";
	}
	
	// 회원가입 폼
	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public String regist()throws Exception{
		return "user/member/member_confirm";
	}
	
	// 회원 가입
	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public String regist2(MemConfirmVO vo,String birth1, String birth2,String birth3,
			String addrno,String addr1,String addr2)throws Exception{
		String birth = birth1 +"/"+ birth2 +"/"+ birth3;
		String maddr = addrno +"/"+ addr1 +"/"+ addr2;

		vo.setBirth(birth);
		vo.setMaddr(maddr);

		System.out.println("입력된 값 확인 : "+vo.toString());
		service.regist(vo);
		return "redirect:/member/main";
	}
	
	// 아이디 중복확인
	@RequestMapping("/idcheck")
	public String idCheck()throws Exception{
		return "user/member/idcheck";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public String idFind()throws Exception{
		return "user/member/member_idpass";
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value = "/pass", method = RequestMethod.GET)
	public String passFind()throws Exception{
		return "user/member/member_pass";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/member/main";
	}

} // class
