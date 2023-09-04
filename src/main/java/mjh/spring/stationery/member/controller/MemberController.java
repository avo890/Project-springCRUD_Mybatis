package mjh.spring.stationery.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import mjh.spring.stationery.member.dto.MemberDTO;
import mjh.spring.stationery.member.service.MemberServiceImp;

@Controller
@RequiredArgsConstructor

public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private final MemberServiceImp memberServiceImp;

	@GetMapping("/MemberSelectAll")
	public String list(Model model) {
		model.addAttribute("list", memberServiceImp.memberSelectAll());
		logger.info("list", model);
		return "./member/member_select_view";
	}

	@GetMapping("/MemberSelectDetail")
	public String selectDetail(Model model, MemberDTO memberDTO) {
		model.addAttribute(memberServiceImp.memberSelectDetail(memberDTO.getId()));
		return "./member/member_selcetDetail_view";
	}

	@GetMapping("/MemberInsert")
	public String insert() {
		return "./member/member_insert";

	}

	@PostMapping("/MemberInsert")
	public String insert(Model model, MemberDTO memberDTO) {
		model.addAttribute("list", memberServiceImp.memberSelectAll());
		memberServiceImp.memberInsert(memberDTO);
		return "./member/member_insert_view";

	}
	
	@GetMapping("/MemberUpdate")
	public String update(Model model, MemberDTO memberDTO) {
		
		model.addAttribute("memberDTO", memberServiceImp.memberSelectDetail(memberDTO.getId()));
		
		return "./member/member_update";
	}
	
	@PostMapping("/MemberUpdate")
	public String update(MemberDTO memberDTO) {
		memberServiceImp.memberUpdate(memberDTO);		
		return "./member/member_update_view";
		
	}
	
	@GetMapping("/MemberDelete")
	public String delete(String id, MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response) {
		memberServiceImp.memberProductDeleteMember(memberDTO);
		memberServiceImp.memberProductReplyDeleteMember(memberDTO);
		memberServiceImp.memberDelete(id);
		memberServiceImp.memberLogout(request, response);
		return "./member/member_delete";
		
	}
	
	@GetMapping("/Login")
	public String login( ) {
		return "./main/login";	
	}
	
	@PostMapping("/Login")
	public String login(Model model, MemberDTO memberDTO,HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("login", memberServiceImp.memberLogin(memberDTO.getId(), memberDTO.getPassword(), request, response));
		return "./main/login_check";		
	}
	
	@GetMapping("/Logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		memberServiceImp.memberLogout(request, response);
		return "./main/logout";
	}
	
	@GetMapping("/SearchId")
	public String searchId() {
		return"./main/id_search";
	}
	
	@PostMapping("/SearchId")
	public String searchId(Model model, MemberDTO memberDTO) {
		model.addAttribute("searchId", memberServiceImp.memberSearchId(memberDTO.getName(), memberDTO.getPhoneNum()));
		return "./main/id_search_view";
	}
	
	@GetMapping("/SearchPassword")
	public String searchPassword() {
		return"./main/password_search";
	}
	
	@PostMapping("/SearchPassword")
	public String searchPassword(Model model, MemberDTO memberDTO) {
		model.addAttribute("searchPassword", memberServiceImp.memberSearchPassword(memberDTO.getId(), memberDTO.getPhoneNum()));
		return "./main/password_search_view";
	}
	
	@GetMapping("/IdCheck")
	@ResponseBody
	public Map<String, Integer> idCheck(HttpServletRequest request, HttpServletResponse response) {
	   Map<String, Integer> resultMap = new HashMap<>();
	   int result = memberServiceImp.memberIdCheck(request, response);
	   
	   if (result == 0) {
	      logger.info("등록가능한 아이디");
	   } else if (result == 1) {
	      logger.info("이미 등록된 아이디");
	   }
	   
	   resultMap.put("result", result);
	   return resultMap;
	}



}
