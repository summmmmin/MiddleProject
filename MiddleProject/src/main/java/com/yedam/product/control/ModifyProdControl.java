package com.yedam.product.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class ModifyProdControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getMethod().equals("GET")) {
			String pid = req.getParameter("pid");
			
			ProdService service = new ProdServiceImpl();
			ProdVO vo = service.getProd(Integer.parseInt(pid));
			req.setAttribute("prodInfo", vo);
			
			return "product/prodModify.tiles";
			
		} else if(req.getMethod().equals("POST")) {
			
			String saveDir = req.getServletContext().getRealPath("images");
			int maxSize = 5 * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
			MultipartRequest multi 
					= new MultipartRequest(req, saveDir, maxSize, encoding, rn);
			
			String pid = multi.getParameter("pid");
			String pdtName = multi.getParameter("pdtName");
			String price = multi.getParameter("price");
			String img = multi.getFilesystemName("img");
			
			ProdVO vo = new ProdVO();
			vo.setPdtId(Integer.parseInt(pid));
			vo.setPdtNm(pdtName);
			vo.setPdtPrice(Integer.parseInt(price));
			vo.setPdtImg(img);
			System.out.println(vo);
			
			ProdService service = new ProdServiceImpl();
			if (service.modifyProd(vo)) {
				return "getProd.do?pid="+pid;
			} else {
				return "modifyProd.do";
			}
			
		}
		return "prodList.do";
	}

}
