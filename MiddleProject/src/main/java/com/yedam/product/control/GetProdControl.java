package com.yedam.product.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class GetProdControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pid = req.getParameter("pid");
		
		ProdService service = new ProdServiceImpl();
		ProdVO vo = service.getProd(Integer.parseInt(pid));
		List<ProdVO> list = service.prodList2();
		req.setAttribute("prodInfo", vo);
		req.setAttribute("pageNum", list);
		System.out.println(vo);
		
		if (vo.getPdtImg() != null) {
			String imgPath = req.getServletContext().getRealPath("images");
			Path file = Paths.get(imgPath + "/" + vo.getPdtImg());
			System.out.println(Files.probeContentType(file));
			String fileType = Files.probeContentType(file);
			req.setAttribute("fileType", fileType.substring(0, fileType.indexOf("/")));
		}
		
		return "product/prodGet.tiles";
	}

}
