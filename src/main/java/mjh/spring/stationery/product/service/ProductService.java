package mjh.spring.stationery.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjh.spring.stationery.product.dto.ProductDTO;

public interface ProductService {
	
	public List<ProductDTO> productSelectAll();
	
	public ProductDTO productSelectDetail(String productno);
	
	public void productInsert(ProductDTO productDTO);
	
	public void productUpdate(ProductDTO productDTO);
	
	public void productDelete(String productno);
	
	public int productnoCheck(HttpServletRequest request, HttpServletResponse response);

}
