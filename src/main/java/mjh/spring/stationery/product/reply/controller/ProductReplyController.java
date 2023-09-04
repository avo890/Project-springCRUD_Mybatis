package mjh.spring.stationery.product.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;
import mjh.spring.stationery.product.reply.dto.ProductReplyDTO;
import mjh.spring.stationery.product.reply.service.ProductReplyServiceImp;

@Controller
@RequiredArgsConstructor
public class ProductReplyController {
	
	@Autowired
	private final ProductReplyServiceImp productReplyServiceImp;
	
	@PostMapping("/ProductReply")
	public String productReply(ProductReplyDTO productReplyDTO) {
		productReplyServiceImp.productReplyInsert(productReplyDTO);
		return "redirect:/ProductSelectDetail?productno=" + productReplyDTO.getProductno();
	}
	
	@GetMapping("/ProductReplyUpdate")
	public String  productReplyUpdate(Model model, int replyno, String productno) {
		ProductReplyDTO productReplyDTO = new ProductReplyDTO();
		productReplyDTO.setReplyno(replyno);
		productReplyDTO.setProductno(productno);
		
		ProductReplyDTO reply = productReplyServiceImp.productReplySelectDetail(productReplyDTO);
		
		model.addAttribute("reply", reply);
		return "./reply/product_reply_update";
	}
		
		@PostMapping("/ProductReplyUpdate")
		public String productReplyUpdate(ProductReplyDTO productReplyDTO) {
			productReplyServiceImp.productReplyUpdate(productReplyDTO);
			return "redirect:/ProductSelectDetail?productno=" + productReplyDTO.getProductno();	
	}

	@GetMapping("/ProductReplyDelete")
	public String productReplydelete(ProductReplyDTO productReplyDTO) {
		productReplyServiceImp.productReplyDelete(productReplyDTO);
		return "redirect:/ProductSelectDetail?productno=" + productReplyDTO.getProductno();	
	}
		
}
