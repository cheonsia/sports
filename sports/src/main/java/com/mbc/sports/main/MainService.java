package com.mbc.sports.main;
import java.util.ArrayList;
import com.mbc.sports.game.GameDTO;
public interface MainService {
	ArrayList<GameDTO> soccerSelectToday();
	ArrayList<GameDTO> baseballSelectToday();
}