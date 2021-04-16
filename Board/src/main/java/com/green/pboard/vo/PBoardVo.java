package com.green.pboard.vo;

public class PBoardVo {
	private int idx;
	private String title; 
	private String mem_id;
	private String img_url;
	private String cont;
	private String regdate;
	
	public PBoardVo() {}
	public PBoardVo(int idx, String title, String mem_id, String img_url, String cont, String regdate) {
		super();
		this.idx = idx;
		this.title = title;
		this.mem_id = mem_id;
		this.img_url = img_url;
		this.cont = cont;
		this.regdate = regdate;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "PBoardVo [idx=" + idx + ", title=" + title + ", mem_id=" + mem_id + ", img_url=" + img_url + ", cont="
				+ cont + ", regdate=" + regdate + "]";
	}
	
	
	
}
