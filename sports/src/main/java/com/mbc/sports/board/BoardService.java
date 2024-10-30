package com.mbc.sports.board;

import java.util.ArrayList;

public interface BoardService {

	void insert(String part, String title, String writer, String pw, String value, String check);
	int max();
	ArrayList<BoardDTO> out(int start, int end);
	int total();
	int pwCheck(int num, String pw);
	void clickUp(int num);
	BoardDTO select(int num);
	BCommentDTO comment(int num);
	int getStep(int num);
	void answer(int num, int step, String writer, String comment);
	void setStep(int num, int step);
	void statusUpdate(int num);
	void delete(int num);
	void update(int num, String part, String title, String writer, String pw, String value, String check);
	void commentDelete(int num);
	void commentUpdate(int num, String ucomment);
	ArrayList<BoardDTO> search(String option, String value);
}
