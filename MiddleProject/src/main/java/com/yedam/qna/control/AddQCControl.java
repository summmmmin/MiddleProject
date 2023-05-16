package com.yedam.qna.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.note.domain.NoteVO;
import com.yedam.note.service.NoteServiceImpl;
import com.yedam.qna.domain.QCommentVO;
import com.yedam.qna.domain.QnaVO;
import com.yedam.qna.service.QCommentService;
import com.yedam.qna.service.QCommentServiceImpl;
import com.yedam.qna.service.QnaService;
import com.yedam.qna.service.QnaServiceImpl;

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
		QnaService service3 = new QnaServiceImpl();
		
		
	
		NoteServiceImpl service2 = new NoteServiceImpl();
		NoteVO vo2 = new NoteVO();
		vo2.setNoteCT("관리자가 답변을 보냈습니다.<a href=\"http://localhost:8081/MiddleProject/getQna.do?postId="+id+"\">Q&A 답변 보러가기</a>");
		
		
		QnaVO vo3 = service3.getQna(Integer.parseInt(id));
		vo2.setUserId(vo3.getUserId());
		
		
		
		if(service.addComment(vo)) {
			service2.sendNote(vo2);
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
