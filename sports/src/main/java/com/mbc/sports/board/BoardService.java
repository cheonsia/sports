package com.mbc.sports.board;

import java.util.ArrayList;

public interface BoardService {

	void insert(String part, String writer, String pw, String title, String value);

	ArrayList<BoardDTO> out();

}
