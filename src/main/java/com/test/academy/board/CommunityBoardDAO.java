package com.test.academy.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.academy.dto.CommunityCommentDTO;
import com.test.academy.dto.CommunityDTO;

@Repository
public class CommunityBoardDAO {

		@Autowired
		private SqlSessionTemplate template;
	
	public int addComu(CommunityDTO dto) {
		
		return template.insert("board.addcomu",dto);
	}

	public List<CommunityDTO> clist(HashMap<String, String> map) {

		return template.selectList("board.clist",map);
	}

	public CommunityDTO getCDto(String seq) {
		
		
		return template.selectOne("board.cmdto",seq);
	}

	
	public int addComment(CommunityCommentDTO dto) {
		
		return template.insert("board.commentadd",dto);
	}

	public List<CommunityCommentDTO> cclist(String seq) {
		
		return template.selectList("board.cclist",seq);
	}

	public int ccdel(String ccseq) {
		
		
		return template.delete("board.ccdel",ccseq);
	}

	public int getCoCnt(String cmseq) {

		return template.selectOne("board.cocnt",cmseq);
	}

	public void readCnt(String cmseq) {
		 template.update("board.readcnt",cmseq);
	}

	public int getcommuCnt() {
		return template.selectOne("board.commucnt");
	}

	public List<CommunityDTO> searchclist(HashMap<String,String> map) {
		return template.selectList("board.searchclist",map);
	}

	public int getsearchcommuCnt(HashMap<String, String> map) {
		return template.selectOne("board.searchcommucnt",map);
	}

	public List<String> getacademy() {
		return template.selectList("board.getacademy");
	}

	public List<String> getclassok(String academy) {
		
		if(academy.equals("all")) {
		return template.selectList("board.getclassallok",academy);
		} else {
			return template.selectList("board.getclassok",academy);
		}
	}

	public void delcommu(String cmseq) {

		template.delete("board.delcommu",cmseq);
	}
//게시글 삭제할때 먼저 참조된 댓글부터 삭제
	public void delcomment(String cmseq) {
		template.delete("board.delcomment",cmseq);
	}

	public int editCommu(CommunityDTO dto) {

		
		return template.update("board.editcommu",dto);
	}

}















