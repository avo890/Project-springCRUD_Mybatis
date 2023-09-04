package mjh.spring.stationery.product.dao;

import java.util.List;

import mjh.spring.stationery.product.dto.ProductDTO;

public interface ProductDAO {
	public List<ProductDTO> selectAll();
	
	public ProductDTO selectDetail(String productno);
	
	public void insert(ProductDTO productDTO);
	
	public void update(ProductDTO productDTO);
	
	public void delete(String productno);
	
}
