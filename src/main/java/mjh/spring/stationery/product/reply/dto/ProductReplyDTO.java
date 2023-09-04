package mjh.spring.stationery.product.reply.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

public class ProductReplyDTO {
	//https://kuzuro.blogspot.com/2019/10/15.html


	private int replyno;
	private String productno;
	private String id;
	private String content;
	private String replyPostDate;
	private String replyPassword;
	
}
