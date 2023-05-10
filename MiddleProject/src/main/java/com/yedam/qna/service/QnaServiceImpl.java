package com.yedam.qna.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.qna.domain.QnaVO;
import com.yedam.qna.mapper.QnaMapper;

public class QnaServiceImpl implements QnaService {

	SqlSession session = DataSource.getInstance().openSession(true);
	QnaMapper mapper = session.getMapper(QnaMapper.class);
	
	@Override
	public List<QnaVO> qnaList(int page) {
		return mapper.qnaWithPage(page);
	}

	@Override
	public boolean addQna(QnaVO vo) {
		return mapper.insertQna(vo) == 1;
	}

	@Override
	public boolean modifyQna(QnaVO vo) {
		return mapper.updateQna(vo) == 1;
	}

	@Override
	public QnaVO getQna(int qnaId) {
		return mapper.searchQna(qnaId);
	}

	@Override
	public int totalQnaCount() {
		return mapper.getQnaCount();
	}

	@Override
	public boolean delQna(int qid) {
		return mapper.deleteQna(qid) == 1;
	}

	@Override
	public List<QnaVO> myqnaList(String userId, int page) {
		return mapper.myQna(userId,page);
	}

	@Override
	public int myQnaCount(String uid) {
		return  mapper.getMyQnaCount(uid);
	}


}
