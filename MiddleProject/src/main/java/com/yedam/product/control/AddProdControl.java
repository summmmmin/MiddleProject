package com.yedam.product.control;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class AddProdControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDir = req.getServletContext().getRealPath("images");
		int maxSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
		MultipartRequest multi 
				= new MultipartRequest(req, saveDir, maxSize, encoding, rn);
		
//		Enumeration<?> enu = multi.getFileNames();
//		while (enu.hasMoreElements()) {
//		String file = (String) enu.nextElement();
//		System.out.println("file: " + file);
//		}
		
		int catId = Integer.parseInt(multi.getParameter("catId"));
		int subcatId = Integer.parseInt(multi.getParameter("subcatId"));
		String pdtName = multi.getParameter("pdtName");
		int price = Integer.parseInt(multi.getParameter("price"));
		int brdId = Integer.parseInt(multi.getParameter("brdId"));
		int genderId = Integer.parseInt(multi.getParameter("genderId"));
		String img = multi.getFilesystemName("img");
		
		ProdVO vo = new ProdVO();
		vo.setCatId(catId);
		vo.setSubcatId(subcatId);
		vo.setPdtNm(pdtName);
		vo.setPdtPrice(price);
		vo.setBrdId(brdId);
		vo.setGenderId(genderId);
		vo.setPdtImg(img);
		System.out.println("vo확인용" + vo);
		
		ProdService service = new ProdServiceImpl();
		if (service.addProd(vo)) {
			return "prodList.do";
		} else {
			return "main.do";
		}
	}

}
