package mjh.spring.stationery.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjh.spring.stationery.member.dto.MemberDTO;

public interface MemberService {

	public List<MemberDTO> memberSelectAll();

	public MemberDTO memberSelectDetail(String id);

	public void memberInsert(MemberDTO memberDTO);

	public void memberUpdate(MemberDTO memberDTO);

	public void memberDelete(String id);
	
	public MemberDTO memberLogin(String id, String password, HttpServletRequest request, HttpServletResponse response);
	
	public void memberLogout(HttpServletRequest request, HttpServletResponse response);
	
	public MemberDTO memberSearchId(String name, String phoneNum);
	
	public MemberDTO memberSearchPassword(String id, String phoneNum);
	
	public int memberIdCheck(HttpServletRequest request, HttpServletResponse response);
	
	public List<MemberDTO> memberProductDeleteMember (MemberDTO memberDTO);
	
	public List<MemberDTO> memberProductReplyDeleteMember (MemberDTO memberDTO);
	
	
}
