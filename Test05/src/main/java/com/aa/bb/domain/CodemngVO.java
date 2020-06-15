package com.aa.bb.domain;

public class CodemngVO{
	String cdno;
	String cdlvl;
	String upcd;
	String cdname;
	String useyn;
	public String getCdno() {
		return cdno;
	}
	public void setCdno(String cdno) {
		this.cdno = cdno;
	}
	public String getCdlvl() {
		return cdlvl;
	}
	public void setCdlvl(String cdlvl) {
		this.cdlvl = cdlvl;
	}
	public String getUpcd() {
		return upcd;
	}
	public void setUpcd(String upcd) {
		this.upcd = upcd;
	}
	public String getCdname() {
		return cdname;
	}
	public void setCdname(String cdname) {
		this.cdname = cdname;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	@Override
	public String toString() {
		return "CodemngVO [cdno=" + cdno + ", cdlvl=" + cdlvl + ", upcd=" + upcd + ", cdname=" + cdname + ", useyn="
				+ useyn + "]";
	}
}