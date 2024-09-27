package com.mbc.sports.baseballplayer;

import java.util.ArrayList;

public interface BPlayerService {

	void playersoccer(String tname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, String play);

	void playerbaseball(String tname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, String play);

	ArrayList<BPlayerDTO> selectTeam(String tname);

	BPlayerDTO detail(int playernum);

	void clickup(int pnumber);

	ArrayList<BUcommentDTO> comment(int pnumber);

	void commentin(int pnumber, String writer, String comment, int step);

	int setStep(int playernum);

	void updateset(int step, int playernum);

	void heart(int playernum, String writer, String ucomment);

	ArrayList<BPlayerDTO> allTeamSelect();

	BPlayerDTO playerdelete(int playernum);

	void delete(int playernum);

	void playerbaseballupdate(String tname, String pname, int pnumber, String pbirth, int height, int weight,
			String main, String pimage, String pchar, int playernum);

	void playersoccerupdate(String tname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, int playernum);

	void commentdelete(int playernum, int step);

	void commentupdate(int playernum, int step, String ucomment);

	ArrayList<BPlayerDTO> brandom();
	


}
