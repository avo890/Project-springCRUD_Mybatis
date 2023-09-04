package mjh.spring.stationery.product.reply.service;

import java.util.List;

import mjh.spring.stationery.product.reply.dto.ProductReplyDTO;

public interface ProductReplyService {
	public List<ProductReplyDTO> productReplySelectAll(String productno);
	
	public void productReplyInsert(ProductReplyDTO productReplyDTO);

	public void productReplyUpdate(ProductReplyDTO productReplyDTO);
	
	public void productReplyDelete(ProductReplyDTO productReplyDTO);
	
	public ProductReplyDTO productReplySelectDetail(ProductReplyDTO productReplyDTO);

}
