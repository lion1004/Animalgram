package com.animal.control;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.animal.domain.MemConfirmVO;
import com.animal.service.MemberConfirmSer;

@RestController
public class AnimalMemControllerR {

	@Inject
	MemberConfirmSer service;
	
	@RequestMapping("/aniidcheck")
	public String idcheck(String id)throws Exception{
		String idmail = service.memIdCheck(id);
		if(idmail == null){
			return "possible";
		}else
		return idmail;
	}
	
	@RequestMapping("/nickcheck")
	public String nickCheck(String nickname)throws Exception{
		String nick = service.nickCheck(nickname);
		if(nick == null)
		{
			return "possible";
		}else
			return nick;
	}
	
	// 아이디 확인
		@RequestMapping(value ="/member/id", method = RequestMethod.POST)
		public ResponseEntity<String> idfindCheck(@RequestParam(value="mname") String mname,@RequestParam(value="birth") String birth,
										@RequestParam(value="mtel") String mtel)throws Exception{
			
			ResponseEntity<String> entity = null;
			MemConfirmVO vo = new MemConfirmVO();
			vo.setMname(mname);
			vo.setBirth(birth);
			vo.setMtel(mtel);
		
			String id = service.foundId(vo);
	
			if (id != null){
				entity = new ResponseEntity<String>(id, HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
	// 로그인 하기
		@RequestMapping("/login")
		public ResponseEntity<String> login(HttpSession session, String idmail,String pass)throws Exception{
			ResponseEntity<String> entity = null;
			Map<String,Object> map = new HashMap<>();
			map.put("idmail", idmail);
			map.put("mpass",pass);

			String nickname = service.loginsession(idmail);
			
			int t = service.login(map);
			if(t == 1){
				entity = new ResponseEntity<String>(HttpStatus.OK);
				session.setAttribute("user", nickname);
			}else{
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
	// 비밀번호 찾기
		@RequestMapping(value = "/member/pass", method = RequestMethod.POST)
		public ResponseEntity<String> pass(String pwcode,String pwcodeas,String idmail)throws Exception{
			ResponseEntity<String> entity = null;
			
			Map<String,Object> map = new HashMap<>();
			map.put("pwcode", pwcode);
			map.put("pwcodeas", pwcodeas);
			map.put("idmail", idmail);
			
			int t = service.selectPass(map);
			if(t == 1){
				entity = new ResponseEntity<String>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	// 비밀번호 변경
		@RequestMapping("/passupdate")
		public ResponseEntity<String> passUpdate(String mpass,String idmail)throws Exception{
			ResponseEntity<String> entity = null;
			
			Map<String,Object> map = new HashMap<>();
			map.put("mpass", mpass);
			map.put("idmail", idmail);
			
			if(service.updatePass(map)){
				entity = new ResponseEntity<>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
} // class
