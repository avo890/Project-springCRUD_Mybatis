package mjh.spring.stationery.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import mjh.spring.stationery.member.dto.MemberDTO;

@Repository
@RequiredArgsConstructor
public class MemberDAOImp implements MemberDAO {

	@Autowired
	private final SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MemberDTO> selectAll() {
		return sqlSessionTemplate.selectList("mjh.spring.stationery.member.selectAll");
	}

	@Override
	public MemberDTO selectDetail(String id) {
		return sqlSessionTemplate.selectOne("mjh.spring.stationery.member.selectDetail", id);
	}

	@Override
	public void insert(MemberDTO memberDTO) {
		sqlSessionTemplate.insert("mjh.spring.stationery.member.insert", memberDTO);

	}

	@Override
	public void update(MemberDTO memberDTO) {
		
		sqlSessionTemplate.update("mjh.spring.stationery.member.update",memberDTO);
	}

	@Override
	public void delete(String id) {
		
		sqlSessionTemplate.delete("mjh.spring.stationery.member.delete", id);
	}

	@Override
	public MemberDTO login(String id, String password) {
		//https://developer-joe.tistory.com/235
				Map<String, String> paramMap = new HashMap<String, String>();
				paramMap.put("id", id); 
				paramMap.put("password", password);
				return sqlSessionTemplate.selectOne("mjh.spring.stationery.member.login",paramMap);
			}

	@Override
	public MemberDTO searchId(String name, String phoneNum) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("name", name);
		paramMap.put("phoneNum", phoneNum);
		return sqlSessionTemplate.selectOne("mjh.spring.stationery.member.searchId", paramMap);
	}

	@Override
	public MemberDTO searchPassword(String id, String phoneNum) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("id", id);
		paramMap.put("phoneNum", phoneNum);
		return sqlSessionTemplate.selectOne("mjh.spring.stationery.member.searchPassword", paramMap);
	}

	@Override
	public List<MemberDTO> productDeleteMember(MemberDTO memberDTO) {

		return sqlSessionTemplate.selectList("mjh.spring.stationery.member.productDeleteMember", memberDTO);
	}

	@Override
	public List<MemberDTO> productReplyDeleteMember(MemberDTO memberDTO) {

		return sqlSessionTemplate.selectList("mjh.spring.stationery.member.productReplyDeleteMember", memberDTO);
	}


}
