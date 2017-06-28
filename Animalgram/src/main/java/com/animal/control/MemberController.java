package com.animal.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	@RequestMapping("/login")
	public String login(){
		return "user/login/login_confirm";
	}
}
