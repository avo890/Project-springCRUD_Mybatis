package mjh.spring.stationery.product.reply.dao;

import java.util.List;

import mjh.spring.stationery.product.reply.dto.ProductReplyDTO;

public interface ProductReplyDAO {
	
	public List<ProductReplyDTO> selectAll(String productno);
	
	public void insert(ProductReplyDTO productReplyDTO);

	public void update(ProductReplyDTO productReplyDTO);
	
	public void delete(ProductReplyDTO productReplyDTO);
	
	public ProductReplyDTO selectDetail(ProductReplyDTO productReplyDTO);
	

}
