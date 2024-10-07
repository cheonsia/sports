package com.mbc.sports;
public class TopDTO {
	String area_eng="ALL", area_kor="ALL";

	public TopDTO() {}
	public TopDTO(String area_eng, String area_kor) {
		super();
		this.area_eng = area_eng;
		this.area_kor = area_kor;
	}

	public String getArea_eng() {
		return area_eng;
	}
	public void setArea_eng(String area_eng) {
		this.area_eng = area_eng;
	}
	public String getArea_kor() {
		return area_kor;
	}
	public void setArea_kor(String area_kor) {
		this.area_kor = area_kor;
	}
}