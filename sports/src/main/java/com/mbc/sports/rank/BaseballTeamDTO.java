package com.mbc.sports.rank;

public class BaseballTeamDTO {
	String rank, image, title, match, victory, defeat, draw, rate, between, winning, base, slugging, recent;

	public BaseballTeamDTO(String rank, String image, String title, String match, String victory, String defeat,
			String draw, String rate, String between, String winning, String base, String slugging, String recent) {
		super();
		this.rank = rank;
		this.image = image;
		this.title = title;
		this.match = match;
		this.victory = victory;
		this.defeat = defeat;
		this.draw = draw;
		this.rate = rate;
		this.between = between;
		this.winning = winning;
		this.base = base;
		this.slugging = slugging;
		this.recent = recent;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMatch() {
		return match;
	}

	public void setMatch(String match) {
		this.match = match;
	}

	public String getVictory() {
		return victory;
	}

	public void setVictory(String victory) {
		this.victory = victory;
	}

	public String getDefeat() {
		return defeat;
	}

	public void setDefeat(String defeat) {
		this.defeat = defeat;
	}

	public String getDraw() {
		return draw;
	}

	public void setDraw(String draw) {
		this.draw = draw;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getBetween() {
		return between;
	}

	public void setBetween(String between) {
		this.between = between;
	}

	public String getWinning() {
		return winning;
	}

	public void setWinning(String winning) {
		this.winning = winning;
	}

	public String getBase() {
		return base;
	}

	public void setBase(String base) {
		this.base = base;
	}

	public String getSlugging() {
		return slugging;
	}

	public void setSlugging(String slugging) {
		this.slugging = slugging;
	}

	public String getRecent() {
		return recent;
	}

	public void setRecent(String recent) {
		this.recent = recent;
	}
	
}
