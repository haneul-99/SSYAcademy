package com.test.academy.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.academy.dto.CommunityCommentDTO;
import com.test.academy.dto.CommunityDTO;
import com.test.academy.dto.QnaCommentDTO;
import com.test.academy.dto.QnaDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private CommunityBoardDAO cdao;
	@Autowired
	QBoardDAO qdao = new QBoardDAO();
	
	@Override
	public int addCommu(CommunityDTO dto) {

		
		return cdao.addComu(dto);
	}
	
	
	@Override
	public List<CommunityDTO> clist(HashMap<String,String> map) {
		
		
		List<CommunityDTO> clist= cdao.clist(map);
		
		for(CommunityDTO dto : clist) {
			
			dto.setCmsubject(dto.getCmsubject().replace("%n", "<br>").replace("<", "&lt").replace(">", "%gt"));
			dto.setCmcontent(dto.getCmcontent().replace("%n", "<br>").replace("<", "&lt").replace(">", "%gt"));
			
			dto.setCocnt(cdao.getCoCnt(dto.getCmseq()) + "");
			long time = Math.round(Double.parseDouble(dto.getTime()) * 24 * 60);
			
			if(time > 1440) {
				time = time / 24 / 60;
				dto.setTime(time + "일 전");
			} else if(time > 60) {
				time /= 60;
				dto.setTime(time + "시간 전");
			} else if(time >= 0) {
				
				dto.setTime(time + "분 전");
			} 
			
		}
		
		return clist;
	}
	@Override
	public List<CommunityDTO> searchclist(HashMap<String, String> map) {
		List<CommunityDTO> searchclist= cdao.searchclist(map);
		
		for(CommunityDTO dto : searchclist) {
			dto.setCocnt(cdao.getCoCnt(dto.getCmseq()) + "");
			long time = Math.round(Double.parseDouble(dto.getTime())*24*60);
			if(time < 60) {
				dto.setTime(time+"분 전");
			} else if(time > 60){
				time = Math.round(Double.parseDouble(dto.getTime())*24);
				dto.setTime(time+"시간 전");
			} else if(time > 1440){
				time = Math.round(Double.parseDouble(dto.getTime()));
				dto.setTime(time+"일 전");
		} else {
			dto.setTime(dto.getCmregdate().substring(0,10));
		}
			
	}
		return searchclist;
	}
	
	@Override
	public int getsearchcommuCnt(HashMap<String, String> map) {
		return cdao.getsearchcommuCnt(map);
	}
	@Override
	public CommunityDTO getCDto(String cmseq) {
		
		return cdao.getCDto(cmseq);
	}
	
	//커뮤니티 게시글 수정
	@Override
	public int editCommu(CommunityDTO dto) {
		return cdao.editCommu(dto);
	}
	@Override
	public int addComment(CommunityCommentDTO dto) {

		
		return cdao.addComment(dto);
	}
	@Override
	public List<CommunityCommentDTO> getCCDto(String seq) {
		return cdao.cclist(seq);
	}
	
	@Override
	public int delComment(String ccseq) {
		return cdao.ccdel(ccseq);
	}
	
	//댓글갯수 가져오기
	@Override
	public int getCoCnt(String cmseq) {

		return cdao.getCoCnt(cmseq);
	}
	
	@Override
	public void readcnt(String cmseq) {

		cdao.readCnt(cmseq);
	}
	//게시판 갯수가져오기
	@Override
	public int getcommuCnt() {

		return cdao.getcommuCnt();
	}

	@Override
		public List<String> getacademy() {
			return cdao.getacademy();
		}	
	@Override
	public List<String> getclassok(String academy) {
		return cdao.getclassok(academy);
	}
	@Override
	public void delCommu(String cmseq) {
		
		cdao.delcomment(cmseq);
		cdao.delcommu(cmseq);
	}
	
	
	
	@Override
	public int addqboard(QnaDTO qdto) {
		
		return qdao.addqboard(qdto);
		
	}
	
	@Override
	public List<CommunityDTO> searchqlist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return qdao.searchqlist(map);
	}
	
	@Override
	public List<QnaDTO> qlist() {
		List<QnaDTO> qlist = qdao.qlist();
		for(QnaDTO dto : qlist) {
			dto.setQacommentcnt(qdao.qaCommentCtn(dto.getQseq()));
			long time = Math.round(Double.parseDouble(dto.getTime()) * 24 * 60);
			
			if(time > 1440) {
				time = time / 24 / 60;
				dto.setTime(time + "일 전");
			} else if(time > 60) {
				time /= 60;
				dto.setTime(time + "시간 전");
			} else if(time >= 0) {
				
				dto.setTime(time + "분 전");
			}
		}
		return qlist;
	}
	
	@Override
	public QnaDTO getQDto(String qseq) {
		return qdao.qdto(qseq);
	}
	
	@Override
	public int delQboard(String qseq) {
		
		
		
		return qdao.delQboard(qseq);
		
	}
	
	@Override
	public String getaname(String aseq) {
		return qdao.getaname(aseq);
	}
	
	@Override
	public int editQboard(QnaDTO qdto) {
		return qdao.editQboard(qdto);
	}
	
	
	@Override
	public int addQboardComment(QnaCommentDTO qadto) {
		
		
		return qdao.addQboardComment(qadto);
	}
	
	@Override
	public List<QnaCommentDTO> getQclist(String qseq) {

		
		return qdao.getQclist(qseq);
	}
	
	@Override
	public int qnacommentdel(String qaseq) {

		return qdao.qnacommentdel(qaseq);
	}
	
}
