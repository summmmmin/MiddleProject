package com.yedam.qna.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.service.QCommentService;
import com.yedam.qna.service.QCommentServiceImpl;

public class AddQCControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 댓글등록 컨트롤...ing...
		String id = req.getParameter("postId"); // 	Q 번호
		String comment = req.getParameter("subject"); //답변 내용
		System.out.println(comment);
		QCommentVO vo = new QCommentVO();
		vo.setPostId(Integer.parseInt(id));
		vo.setCommentCT(comment);
		System.out.println(vo);
		
		QCommentService service = new QCommentServiceImpl();
		
		if(service.addComment(vo)) {
			return "getQna.do?postId="+id;
		}else {
			return "main.do";
		}

		
		
//		String json = "";
//		
//		Map<String, Object> map = new HashMap<>();
//		
//		
//		if(result) {
//			// {"retCode":"Success"}
//			// json = "{\"retCode\":\"Success\"}";
//			// {"retCode":"Success","data":vo}
//			map.put("retCode", "Success");
//			map.put("data", vo);
//		}else {
//			//{"retCode":"Fail"}
//			// json = "{\"retCode\":\"Fail\"}";
//			map.put("retCode","Fail");
//			
//		}
//		Gson gson = new GsonBuilder().create();//gson 객체
//		json = gson.toJson(map);
//	
//		return json + ".json";
	}

}
