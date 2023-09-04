package mjh.spring.stationery.product.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mjh.spring.stationery.product.reply.dao.ProductReplyDAO;
import mjh.spring.stationery.product.reply.dto.ProductReplyDTO;

@Service
public class ProductReplyServiceImp implements ProductReplyService {

	public final ProductReplyDAO productReplyDAO;

	@Autowired
	public ProductReplyServiceImp(ProductReplyDAO productReplyDAO) {
		super();
		this.productReplyDAO = productReplyDAO;
	}

	@Override
	public List<ProductReplyDTO> productReplySelectAll(String productno) {

		return productReplyDAO.selectAll(productno);
	}

	@Override
	public void productReplyInsert(ProductReplyDTO productReplyDTO) {

		productReplyDAO.insert(productReplyDTO);
	}

	@Override
	public void productReplyUpdate(ProductReplyDTO productReplyDTO) {

		productReplyDAO.update(productReplyDTO);
	}

	@Override
	public void productReplyDelete(ProductReplyDTO productReplyDTO) {

		productReplyDAO.delete(productReplyDTO);
	}

	@Override
	public ProductReplyDTO productReplySelectDetail(ProductReplyDTO productReplyDTO) {
		
		return productReplyDAO.selectDetail(productReplyDTO);
	}

}
