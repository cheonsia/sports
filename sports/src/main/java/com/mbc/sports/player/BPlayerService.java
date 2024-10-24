package com.mbc.sports.player;

import java.util.ArrayList;

public interface BPlayerService {

	void playerbaseball(String btname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, String play);

	ArrayList<PlayerDTO> allTeamSelect();

	ArrayList<PlayerDTO> selectTeam(String tname);

	PlayerDTO select(int playernum);

	void clickup(int playernum);

	void delete(int playernum);

	void update(String tname, String pname, int pnumber, String pbirth, int height, int weight, String main,
			String pimage, String pchar, int playernum);

	ArrayList<PlayerDTO> bmain(String value);

	ArrayList<PlayerDTO> bpname(String value);
}
