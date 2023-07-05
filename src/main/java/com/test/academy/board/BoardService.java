package com.test.academy.board;

import java.util.HashMap;
import java.util.List;

import com.test.academy.dto.CommunityCommentDTO;
import com.test.academy.dto.CommunityDTO;
import com.test.academy.dto.QnaCommentDTO;
import com.test.academy.dto.QnaDTO;

public interface BoardService {

	int addCommu(CommunityDTO dto);

	List<CommunityDTO> clist(HashMap<String, String> map);

	CommunityDTO getCDto(String seq);

	int addComment(CommunityCommentDTO dto);

	List<CommunityCommentDTO> getCCDto(String seq);

	int delComment(String ccseq);

	int getCoCnt(String cmseq);

	void readcnt(String cmseq);


	int getcommuCnt();

	List<CommunityDTO> searchclist(HashMap<String, String> map);

	int getsearchcommuCnt(HashMap<String, String> map);

	List<String> getacademy();

	List<String> getclassok(String academy);

	void delCommu(String cmseq);

	int addqboard(QnaDTO qdto);

	List<CommunityDTO> searchqlist(HashMap<String, String> map);

	List<QnaDTO> qlist();

	QnaDTO getQDto(String qseq);

	int delQboard(String qseq);


	int editCommu(CommunityDTO dto);

	String getaname(String qseq);

	int editQboard(QnaDTO qdto);

	int addQboardComment(QnaCommentDTO qadto);

	List<QnaCommentDTO> getQclist(String qseq);

	int qnacommentdel(String qaseq);




}
