package mjh.spring.stationery.product.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import mjh.spring.stationery.product.reply.dto.ProductReplyDTO;

@Repository
@RequiredArgsConstructor
public class ProductReplyDAOImp implements ProductReplyDAO{
	
	@Autowired
	private final SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ProductReplyDTO> selectAll(String productno) {

		return sqlSessionTemplate.selectList("mjh.spring.stationery.product.reply.selectAll", productno);
	}

	@Override
	public void insert(ProductReplyDTO productReplyDTO) {

		sqlSessionTemplate.insert("mjh.spring.stationery.product.reply.insert",productReplyDTO);
	}

	@Override
	public void update(ProductReplyDTO productReplyDTO) {
		
		sqlSessionTemplate.update("mjh.spring.stationery.product.reply.update", productReplyDTO);
	}

	@Override
	public void delete(ProductReplyDTO productReplyDTO) {
		
		sqlSessionTemplate.delete("mjh.spring.stationery.product.reply.delete", productReplyDTO);
	}

	@Override
	public ProductReplyDTO selectDetail(ProductReplyDTO productReplyDTO) {

		return sqlSessionTemplate.selectOne("mjh.spring.stationery.product.reply.selectDetail", productReplyDTO);
	}

}
