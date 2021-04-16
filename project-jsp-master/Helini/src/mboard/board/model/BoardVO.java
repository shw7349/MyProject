package mboard.board.model;

import java.util.Date;
//순번, 제목, 작성자, 내용, 날짜, 조회수 , 파일, 회원아이디(없으면 비회원 출력)
public class BoardVO {
	private int id;
	private String title;
	private String writer_id; 
	private String content;	
	private Date regdate; 
	private int hit; 
	private String files;
	private String regid;
	
	public BoardVO() {
		
	}

	public BoardVO(int id, String title, String writer_id, String content, Date regdate, int hit, String files,
			String regid) {
		this.id = id;
		this.title = title;
		this.writer_id = writer_id;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
		this.files = files;
		this.regid = regid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getRegid() {
		return regid;
	}

	public void setRegid(String regid) {
		this.regid = regid;
	}

	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", title=" + title + ", writer_id=" + writer_id + ", content=" + content
				+ ", regdate=" + regdate + ", hit=" + hit + ", files=" + files + ", regid=" + regid + "]";
	}
	
	
}
