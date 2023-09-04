package mjh.spring.stationery.member.dao;

import java.util.List;

import mjh.spring.stationery.member.dto.MemberDTO;

public interface MemberDAO {
	public List<MemberDTO> selectAll();

	public MemberDTO selectDetail(String id);

	public void insert(MemberDTO memberDTO);

	public void update(MemberDTO memberDTO);

	public void delete(String id);

	public MemberDTO login(String id, String password);
	
	public MemberDTO searchId(String name, String phoneNum);
	
	public MemberDTO searchPassword(String id, String phoneNum);
	
	public List<MemberDTO> productDeleteMember(MemberDTO memberDTO);
	public List<MemberDTO> productReplyDeleteMember(MemberDTO memberDTO);
	

}
