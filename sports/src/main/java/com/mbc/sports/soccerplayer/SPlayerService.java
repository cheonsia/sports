package com.mbc.sports.soccerplayer;

import java.util.ArrayList;

public interface SPlayerService {

	void playersoccer(String stname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, String play);

	void playerbaseball(String btname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, String play);

	ArrayList<SPlayerDTO> allTeamSelect();

	ArrayList<SPlayerDTO> selectTeam(String tname);

	SPlayerDTO select(int playernum);

	ArrayList<UcommentDTO> comment(int playernum, int start, int end);

	void clickup(int playernum);

	int setStep(int playernum);

	void commentin(int playernum, String id , String writer, String comment, int step);

	void updateset(int step, int playernum);

	void heart(int playernum, String writer, String ucomment);

	void delete(int playernum);

	void playersoccerupdate(String tname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, int playernum);

	void playerbaseballupdate(String tname, String pname, int pnumber, String pbirth, int height, int weight,
			String main, String pimage, String pchar, int playernum);

	void commentdelete(int playernum, int step);

	void commentupdate(int playernum, int step, String ucomment);

	int total(int playernum);



}
