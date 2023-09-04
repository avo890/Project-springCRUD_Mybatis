package mjh.spring.stationery.member.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import mjh.spring.stationery.member.dao.MemberDAO;
import mjh.spring.stationery.member.dto.MemberDTO;

@Service

public class MemberServiceImp implements MemberService {

	private final MemberDAO memberDAO;

	@Autowired
	public MemberServiceImp(@Qualifier("memberDAOImp") MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public List<MemberDTO> memberSelectAll() {
		return memberDAO.selectAll();
	}

	@Override
	public MemberDTO memberSelectDetail(String id) {
		return memberDAO.selectDetail(id);
	}

	@Override
	public void memberInsert(MemberDTO memberDTO) {
		memberDAO.insert(memberDTO);
	}

	@Override
	public void memberUpdate(MemberDTO memberDTO) {
		memberDAO.update(memberDTO);
	}

	@Override
	public void memberDelete(String id) {
		memberDAO.delete(id);
	}

	@Override
	public MemberDTO memberLogin(String id, String password, HttpServletRequest request, HttpServletResponse response) {
		MemberDTO member = memberDAO.login(id, password);
		if (member == null) {
			return null;
		} else {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", member.getId());
			httpSession.setAttribute("name", member.getName());
			Cookie cookie = new Cookie("id", member.getId());
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			response.addCookie(cookie);
			return member;
		}
	}

	@Override
	public void memberLogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		String id = (String) httpSession.getAttribute("id");
		httpSession.setAttribute("id", id);
		httpSession.invalidate();

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("id")) {
					// cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}
	}

	@Override
	public MemberDTO memberSearchId(String name, String phoneNum) {

		return memberDAO.searchId(name, phoneNum);
	}

	@Override
	public MemberDTO memberSearchPassword(String id, String phoneNum) {

		return memberDAO.searchPassword(id, phoneNum);
	}

	@Override
	public int memberIdCheck(HttpServletRequest request, HttpServletResponse response) {
		int idcheck = 1;
		String id = request.getParameter("id");
		memberDAO.selectDetail(id);

		if (memberDAO.selectDetail(id) == null) {
			idcheck = 0;
		} else {
			idcheck = 1;
		}
		return idcheck;
	}

	@Override
	public List<MemberDTO> memberProductDeleteMember(MemberDTO memberDTO) {
		return  memberDAO.productDeleteMember(memberDTO);
	}

	@Override
	public List<MemberDTO> memberProductReplyDeleteMember(MemberDTO memberDTO) {

		return memberDAO.productReplyDeleteMember(memberDTO);
	}


	
	
}