package mjh.spring.stationery.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;
import mjh.spring.stationery.product.dto.ProductDTO;
import mjh.spring.stationery.product.reply.dto.ProductReplyDTO;
import mjh.spring.stationery.product.reply.service.ProductReplyServiceImp;
import mjh.spring.stationery.product.service.ProductServiceImp;

@Controller
@RequiredArgsConstructor
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired
	private final ProductServiceImp productServiceImp;
	
	@Autowired
	private final ProductReplyServiceImp productReplyServiceImp;

	@GetMapping("/ProductSelectAll")
	public String productlist(Model model) {
		model.addAttribute("productlist", productServiceImp.productSelectAll());
		logger.info("productlist", model);
		return "./product/product_select_view";
	}

	@GetMapping("/ProductSelectDetail")
	public String selectDetail(Model model, ProductDTO productDTO, ProductReplyDTO productReplyDTO) {
		model.addAttribute(productServiceImp.productSelectDetail(productDTO.getProductno()));
		
		
		List<ProductReplyDTO> reply = null;
		reply = productReplyServiceImp.productReplySelectAll(productReplyDTO.getProductno());
		model.addAttribute("reply", reply);
		logger.info("댓글로그",reply);
		return "./product/product_selcetDetail_view";
	}

	@GetMapping("/ProductInsert")
	public String insert() {
		logger.info("인서트 컨트롤러");
		return "./product/product_insert";
	}

	@PostMapping("/ProductInsert")
	public String insert(Model model, ProductDTO productDTO, MultipartHttpServletRequest multipartHttpServletRequest)
			throws Exception {
		model.addAttribute("productlist", productServiceImp.productSelectAll());
		productServiceImp.productInsert(productDTO);
		return "./product/product_insert_view";
	}

	@GetMapping("/ProductUpdate")
	public String update(Model model, ProductDTO productDTO) {
		model.addAttribute("productDTO", productServiceImp.productSelectDetail(productDTO.getProductno()));
		logger.info("update 컨트롤러" + productServiceImp.productSelectDetail(productDTO.getProductno()));
		return "./product/product_update";
	}

	@PostMapping("/ProductUpdate")
	public String update(ProductDTO productDTO) {
		productServiceImp.productUpdate(productDTO);
		return "./product/product_update_view";
	}

	@GetMapping("/ProductDelete")
	public String delete(String productno) {
		productServiceImp.productDelete(productno);
		return "./product/product_delete";
	}

	@GetMapping("/ProductnoCheck")
	@ResponseBody
	public Map<String, Integer> productnoCheck(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Integer> resultMap = new HashMap<>();
		int result = productServiceImp.productnoCheck(request, response);
		if (result == 0) {
			logger.info("등록가능한 상품번호");
		} else if (result == 1) {
			logger.info("이미 등록된 상품번호");
		}

		resultMap.put("result", result);
		return resultMap;
	}

	@PostMapping("/ProductUpload")
	@ResponseBody
	public void upload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile)
			throws Exception {
		@SuppressWarnings("unused")
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {

						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();

						String uploadPath = request.getSession().getServletContext()
								.getRealPath("/resources/productUpload");
						logger.info("저장경로:" + uploadPath);

						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdir();
						}
						String fileName2 = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName2 + fileName;

						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = response.getWriter();
						String fileUrl = request.getContextPath() + "/resources/productUpload/" + fileName2 + fileName;
						logger.info("fileUrl :" + fileUrl);
						JsonObject json = new JsonObject();
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.print(json);

					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}

			}

		}

	}

}
