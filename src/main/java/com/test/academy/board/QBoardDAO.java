package com.test.academy.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.CommunityDTO;
import com.test.academy.dto.QnaCommentDTO;
import com.test.academy.dto.QnaDTO;

@Repository
public class QBoardDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public int addqboard(QnaDTO qdto) {

		
		return template.insert("board.addqboard",qdto);
	}

	public List<CommunityDTO> searchqlist(HashMap<String, String> map) {
		return template.selectList("board.searchqlist",map);
	}

	public List<QnaDTO> qlist() {
		return template.selectList("board.qlist");
	}

	public QnaDTO qdto(String qseq) {
		
		return template.selectOne("board.qdto",qseq);
	}

	public int delQboard(String qseq) {
		return template.delete("board.delQboard",qseq);
	}

	public String getaname(String aseq) {
		return template.selectOne("board.getaname",aseq);
	}

	public int editQboard(QnaDTO qdto) {

		
		return template.update("board.editQboard",qdto);
	}

	public int addQboardComment(QnaCommentDTO qadto) {
		return template.insert("board.addqboardcomment",qadto);
	}

	public List<QnaCommentDTO> getQclist(String qseq) {
		return template.selectList("board.getqclist",qseq);
	}

	public String qaCommentCtn(String qseq) {
		
		
		return template.selectOne("board.qacommentcnt",qseq);
	}

	public int qnacommentdel(String qaseq) {

		return template.delete("board.qnacommentdel",qaseq);
	}
	
	
	
}
