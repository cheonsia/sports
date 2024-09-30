package com.mbc.sports.soccerdirect;
public class SoccerCalendarDTO {
	String TRNAME, TRDATE, TRDATE2, TRMEMBER, TRPLACE, TRCONTENT, TRMEMO;
	int TRNUM;
	String TRINFO;

	public SoccerCalendarDTO() {}
	public SoccerCalendarDTO(String tRNAME, String tRDATE, String tRDATE2, String tRMEMBER, String tRPLACE,
			String tRCONTENT, String tRMEMO, int tRNUM, String tRINFO) {
		super();
		TRNAME = tRNAME;
		TRDATE = tRDATE;
		TRDATE2 = tRDATE2;
		TRMEMBER = tRMEMBER;
		TRPLACE = tRPLACE;
		TRCONTENT = tRCONTENT;
		TRMEMO = tRMEMO;
		TRNUM = tRNUM;
		TRINFO = tRINFO;
	}

	public String getTRNAME() {
		return TRNAME;
	}
	public void setTRNAME(String tRNAME) {
		TRNAME = tRNAME;
	}
	public String getTRDATE() {
		return TRDATE;
	}
	public void setTRDATE(String tRDATE) {
		TRDATE = tRDATE;
	}
	public String getTRDATE2() {
		return TRDATE2;
	}
	public void setTRDATE2(String tRDATE2) {
		TRDATE2 = tRDATE2;
	}
	public String getTRMEMBER() {
		return TRMEMBER;
	}
	public void setTRMEMBER(String tRMEMBER) {
		TRMEMBER = tRMEMBER;
	}
	public String getTRPLACE() {
		return TRPLACE;
	}
	public void setTRPLACE(String tRPLACE) {
		TRPLACE = tRPLACE;
	}
	public String getTRCONTENT() {
		return TRCONTENT;
	}
	public void setTRCONTENT(String tRCONTENT) {
		TRCONTENT = tRCONTENT;
	}
	public String getTRMEMO() {
		return TRMEMO;
	}
	public void setTRMEMO(String tRMEMO) {
		TRMEMO = tRMEMO;
	}
	public int getTRNUM() {
		return TRNUM;
	}
	public void setTRNUM(int tRNUM) {
		TRNUM = tRNUM;
	}
	public String getTRINFO() {
		return TRINFO;
	}
	public void setTRINFO(String tRINFO) {
		TRINFO = tRINFO;
	}
	
	@Override
	public String toString() {
		return "SoccerCalendarDTO [TRNAME=" + TRNAME + ", TRDATE=" + TRDATE + ", TRDATE2=" + TRDATE2 + ", TRMEMBER="
				+ TRMEMBER + ", TRPLACE=" + TRPLACE + ", TRCONTENT=" + TRCONTENT + ", TRMEMO=" + TRMEMO + ", TRNUM="
				+ TRNUM + ", TRINFO=" + TRINFO + "]";
	}
}