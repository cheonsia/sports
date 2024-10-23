package com.mbc.sports.board;

import java.util.ArrayList;

public interface BoardService {

	void insert(String part, String title, String writer, String pw, String value, String check);
	ArrayList<BoardDTO> out(int start, int end);
	int total();
	int pwCheck(int num, String pw);
	void clickUp(int num);
	BoardDTO select(int num);


}
