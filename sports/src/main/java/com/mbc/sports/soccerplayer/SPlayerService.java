package com.mbc.sports.soccerplayer;

import java.util.ArrayList;

public interface SPlayerService {

	void playersoccer(String stname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, String play);

	void playerbaseball(String btname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, String play);

	ArrayList<SPlayerDTO> selectTeam(String tname);

	SPlayerDTO detail(int pnumber);

	void clickup(int pnumber);

	ArrayList<UcommentDTO> comment(int pnumber);

	void commentin(int pnumber, String writer, String comment, int step);

	int setStep(int playernum);

	void updateset(int step, int playernum);

	void heart(int playernum, String writer, String ucomment);

	ArrayList<SPlayerDTO> allTeamSelect();

	SPlayerDTO playerdelete(int playernum);

	void delete(int playernum);

	void playersoccerupdate(String tname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, int playernum);

	void playerbaseballupdate(String tname, String pname, int pnumber, String pbirth, int height, int weight,
			String main, String pimage, String pchar, int playernum);

	void commentdelete(int playernum, int step);

	void commentupdate(int playernum, int step, String ucomment);

}
