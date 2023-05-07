package com.yedam.product.control;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.buy.domain.BuyVO;
import com.yedam.buy.service.BuyService;
import com.yedam.buy.service.BuyServiceImpl;
import com.yedam.common.Control;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;
import com.yedam.size.domain.SizeVO;
import com.yedam.size.service.SizeService;
import com.yedam.size.service.SizeServiceImpl;

public class GetProdControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pid = req.getParameter("pid");

		ProdService service = new ProdServiceImpl();
		ProdVO vo = service.getProd(Integer.parseInt(pid));
		List<ProdVO> list = service.prodList2();
		req.setAttribute("prodInfo", vo);
		req.setAttribute("product2", list);
		System.out.println(vo);
		System.out.println(list);

		if (vo.getPdtImg() != null) {
			String imgPath = req.getServletContext().getRealPath("images");
			Path file = Paths.get(imgPath + "/" + vo.getPdtImg());
			System.out.println(Files.probeContentType(file));
			String fileType = Files.probeContentType(file);
			req.setAttribute("fileType", fileType.substring(0, fileType.indexOf("/")));
		}

		// 상품의 사이즈리스트
		SizeService sizeService = new SizeServiceImpl();
		List<SizeVO> sizeList = sizeService.getSizeList(vo.getCatId());
		req.setAttribute("sizeList", sizeList);

		// 즉시판매가
		BuyService buyService = new BuyServiceImpl();
		List<BuyVO> priceList = new ArrayList<BuyVO>();
		BuyVO buy = new BuyVO();
		for (int i = 0; i < sizeList.size(); i++) {
			buy = new BuyVO();
			buy.setPdtId(vo.getPdtId());
			buy.setSizeId(sizeList.get(i).getSizeId());
			buy = buyService.getBuyPrice(buy);
			priceList.add(buy);
		}
		req.setAttribute("priceList", priceList);

		return "product/prodGet.tiles";
	}

}
