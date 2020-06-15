package com.aa.bb.domain;

public class InItemVO{
	String itemcd;
	String itemname;
	String madenmcd;
	String maden;
	String itemunitcd;
	String itemunit;
	String insamt;
	String insitemlistcd;

	public String getInsitemlistcd() {
		return insitemlistcd;
	}
	public void setInsitemlistcd(String insitemlistcd) {
		this.insitemlistcd = insitemlistcd;
	}
	public String getItemunit() {
		return itemunit;
	}
	public void setItemunit(String itemunit) {
		this.itemunit = itemunit;
	}

	public String getItemcd() {
		return itemcd;
	}
	public String getMaden() {
		return maden;
	}
	public void setMaden(String maden) {
		this.maden = maden;
	}
	public void setItemcd(String itemcd) {
		this.itemcd = itemcd;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getMadenmcd() {
		return madenmcd;
	}
	public void setMadenmcd(String madenmcd) {
		this.madenmcd = madenmcd;
	}
	public String getItemunitcd() {
		return itemunitcd;
	}
	public void setItemunitcd(String itemunitcd) {
		this.itemunitcd = itemunitcd;
	}
	public String getInsamt() {
		return insamt;
	}
	public void setInsamt(String insamt) {
		this.insamt = insamt;
	}
	@Override
	public String toString() {
		return "InItemVO [itemcd=" + itemcd + ", itemname=" + itemname + ", madenmcd=" + madenmcd + ", maden=" + maden
				+ ", itemunitcd=" + itemunitcd + ", itemunit=" + itemunit + ", insamt=" + insamt + ", insitemlistcd="
				+ insitemlistcd + "]";
	}
	
	
}