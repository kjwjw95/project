package com.aa.bb.domain;

public class ItemVO{
	String itemcd;
	String itemname;
	String madenmcd;
	String maden;
	String itemunitcd;
	String itemunit;
	String stockamt;
	String stockyn;
	String useyn;
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
	public String getStockamt() {
		return stockamt;
	}
	public void setStockamt(String stockamt) {
		this.stockamt = stockamt;
	}
	public String getStockyn() {
		return stockyn;
	}
	public void setStockyn(String stockyn) {
		this.stockyn = stockyn;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	@Override
	public String toString() {
		return "ItemVO [itemcd=" + itemcd + ", itemname=" + itemname + ", madenmcd=" + madenmcd + ", maden=" + maden
				+ ", itemunitcd=" + itemunitcd + ", itemunit=" + itemunit + ", stockamt=" + stockamt + ", stockyn="
				+ stockyn + ", useyn=" + useyn + "]";
	}
	
}