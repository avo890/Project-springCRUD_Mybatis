package mjh.spring.stationery.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import mjh.spring.stationery.product.dto.ProductDTO;


@Repository
@RequiredArgsConstructor
public class ProductDAOImp implements ProductDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImp.class);
	
	@Autowired
	private final SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ProductDTO> selectAll() {
		return sqlSessionTemplate.selectList("mjh.spring.stationery.product.selectAll");
	}

	@Override
	public ProductDTO selectDetail(String productno) {	
		return sqlSessionTemplate.selectOne("mjh.spring.stationery.product.selectDetail", productno);
	}

	@Override
	public void insert(ProductDTO productDTO) {
		sqlSessionTemplate.insert("mjh.spring.stationery.product.insert",productDTO);
		logger.info("인설트DAO");
	}

	@Override
	public void update(ProductDTO productDTO) {
		sqlSessionTemplate.update("mjh.spring.stationery.product.update",productDTO);
	}

	@Override
	public void delete(String productno) {
		sqlSessionTemplate.delete("mjh.spring.stationery.product.delete",productno)	;	
	}

}
