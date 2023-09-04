package mjh.spring.stationery.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import mjh.spring.stationery.product.dao.ProductDAO;
import mjh.spring.stationery.product.dto.ProductDTO;

@Service

public class ProductServiceImp implements ProductService {

	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImp.class);
	public final ProductDAO productDAO;

	@Autowired
	public ProductServiceImp(@Qualifier("productDAOImp") ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List<ProductDTO> productSelectAll() {
		return productDAO.selectAll();
	}

	@Override
	public ProductDTO productSelectDetail(String productno) {
		return productDAO.selectDetail(productno);
	}

	@Override
	public void productInsert(ProductDTO productDTO) {
		productDAO.insert(productDTO);
		logger.info("인서트서비스");
		
	}



	@Override
	public void productUpdate(ProductDTO productDTO) {
		productDAO.update(productDTO);
	}

	@Override
	public void productDelete(String productno) {
		productDAO.delete(productno);
	}

	@Override
	public int productnoCheck(HttpServletRequest request, HttpServletResponse response) {
		int productnoCheck = 1;
		String productno = request.getParameter("productno");
		productDAO.selectDetail(productno);
		
		if (productDAO.selectDetail(productno)  == null) {
			productnoCheck = 0;
		} else {
			productnoCheck = 1;
		}
		return productnoCheck;

	}

}
