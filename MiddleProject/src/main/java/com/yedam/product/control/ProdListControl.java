package com.yedam.product.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.product.domain.PageDTO;
import com.yedam.product.domain.ProdVO;
import com.yedam.product.service.ProdService;
import com.yedam.product.service.ProdServiceImpl;

public class ProdListControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pageStr = req.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		
		ProdService service = new ProdServiceImpl();
		int total = service.totalViews();
		List<ProdVO> list = service.prodList(page);
		System.out.println(list);
		
		PageDTO dto = new PageDTO(page, total);
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", dto);
		
		List<ProdVO> catlist = service.catList();
		int cattotal;
		int[] cntarr = new int[catlist.size()];
		for(int i = 0; i < catlist.size(); i++) {
			cattotal = service.getCount(catlist.get(i).getCatId());
			cntarr[i] = cattotal;
		}
		req.setAttribute("catlist", catlist);
		req.setAttribute("cntarr", cntarr);
		
		List<ProdVO> genderlist = service.genderList();
		int gendertotal;
		int[] genderarr = new int[genderlist.size()];
		for(int i = 0; i < genderlist.size(); i++) {
			gendertotal = service.getCount(genderlist.get(i).getGenderId());
			genderarr[i] = gendertotal;
		}
		req.setAttribute("genderlist", genderlist);
		req.setAttribute("genderarr", genderarr);
		
		List<ProdVO> brdlist = service.brdList();
		int brdtotal;
		int[] brdarr = new int[brdlist.size()];
		for(int i = 0; i < brdlist.size(); i++) {
			brdtotal = service.getCount(brdlist.get(i).getBrdId());
			brdarr[i] = brdtotal;
		}
		req.setAttribute("brdlist", brdlist);
		req.setAttribute("brdarr", brdarr);
		
		return "product/prodList.tiles";
	}

}
