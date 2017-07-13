package com.animal.control;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.animal.domain.MemConfirmVO;
import com.animal.service.AnimalService;
import com.animal.service.MemberConfirmSer;

@RestController
public class AnimalMemControllerR {

	@Inject
	MemberConfirmSer service;
	@Inject
	AnimalService aniservice;
	
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
		public ResponseEntity<List<String>> idfindCheck(@RequestParam(value="mname") String mname,@RequestParam(value="birth") String birth,
										@RequestParam(value="mtel") String mtel,Model model)throws Exception{
			
			ResponseEntity<List<String>> entity = null;
			MemConfirmVO vo = new MemConfirmVO();
			vo.setMname(mname);
			vo.setBirth(birth);
			vo.setMtel(mtel);
		
			List<String> list = service.foundId(vo);
			System.out.println(list);
			if (list.size() != 0){
				entity = new ResponseEntity<>(list,HttpStatus.OK);
			} else {
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
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
		
	// 훈련 현황 삭제 (User용)
		@RequestMapping(value="/care_delete/{cano}",method = RequestMethod.DELETE)
		public ResponseEntity<String> delete_care_user(@PathVariable("cano") int cano)throws Exception{
			ResponseEntity<String> entity = null;
			
			if(aniservice.careUserDel(cano)){
				entity = new ResponseEntity<>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
	// 훈련 요청 승인 (전문가)
		@RequestMapping(value="/care_pro_update/{cano}",method=RequestMethod.PUT)
		public ResponseEntity<String> careDelete(@PathVariable("cano") int cano)throws Exception{
			ResponseEntity<String> entity = null;
			if(aniservice.careProUp(cano)){
				entity = new ResponseEntity<>(HttpStatus.OK);		
			}else{		
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
				return entity;
		}
	// 훈련 현황 삭제
		@RequestMapping(value="/care_pro_delete/{cno}",method=RequestMethod.DELETE)
		public ResponseEntity<String> proDelete(@PathVariable("cno") int cno)throws Exception{
			ResponseEntity<String> entity = null;
			if(aniservice.careProdelete(cno) == 1){
				entity = new ResponseEntity<>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	// 주문 수령 승인
		@RequestMapping(value="/bill_update/{bno}", method=RequestMethod.PUT)
		public ResponseEntity<String> bill_update(@PathVariable("bno") int bno)throws Exception{
			ResponseEntity<String> entity = null;
			if(aniservice.bill_update(bno)){
				entity = new ResponseEntity<>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	// 장터 현황 삭제(User 용)
		@RequestMapping(value="/custom_udel/{bno}",method=RequestMethod.DELETE)
		public ResponseEntity<String> customUdel(@PathVariable("bno") int bno)throws Exception{
			ResponseEntity<String> entity = null;
			if(aniservice.customUdel(bno)){
				entity = new ResponseEntity<>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	// 나눔 등록 삭제
		@RequestMapping(value="/donation_del/{dno}",method = RequestMethod.DELETE)
		public ResponseEntity<String> donationDel(@PathVariable("dno") int dno)throws Exception{
			ResponseEntity<String> entity = null;
			if(aniservice.donation_del(dno)){
				entity = new ResponseEntity<>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	// 나눔 승인
		@RequestMapping(value="/donation_up/{dano}",method=RequestMethod.PUT)
		public ResponseEntity<String> donationUp(@PathVariable("dano") int dano)throws Exception{
			ResponseEntity<String> entity = null;
			if(aniservice.donationUp(dano)){
				entity = new ResponseEntity<>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
} // class
