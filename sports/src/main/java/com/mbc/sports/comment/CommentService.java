package com.mbc.sports.comment;

import java.util.ArrayList;

public interface CommentService {
	//저장 시 사용 함수
	int getStep(int playernum);
	void input(int playernum, String writer, String comment, int step);
	void updatePlayerStep(int step, int playernum);

	//출력 시 사용되는 함수
	int total(int playernum);
	ArrayList<CommentDTO> comment(int playernum, int start, int end);

	void delete(int playernum, int step);

	void update(int playernum, int step, String ucomment);
	
	void heart(int playernum, String writer, String comment);
}
