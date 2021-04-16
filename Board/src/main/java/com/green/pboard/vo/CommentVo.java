package com.green.pboard.vo;

import java.util.Date;

public class CommentVo {
	
	private Integer comment_num; 	//댓글번호 
	private Integer idx;			// 게시판 번호
	private String comment_content;	// 댓글내용
	private String commentUser;			// 댓글 작성자
	private String mem_id;		// 댓글 작성자
	private Date comment_regdate;			// 댓글 작성일자
	private String secretComment;
	private String writer;
	public Integer getComment_num() {
		return comment_num;
	}
	public void setComment_num(Integer comment_num) {
		this.comment_num = comment_num;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCommentUser() {
		return commentUser;
	}
	public void setCommentUser(String commentUser) {
		this.commentUser = commentUser;
	}
	public Date getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public String getSecretComment() {
		return secretComment;
	}
	public void setSecretComment(String secretComment) {
		this.secretComment = secretComment;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "CommentVo [comment_num=" + comment_num + ", idx=" + idx + ", comment_content=" + comment_content
				+ ", mem_id=" + mem_id + ", commentUser=" + commentUser + ", comment_regdate=" + comment_regdate
				+ ", secretComment=" + secretComment + ", writer=" + writer + ", getComment_num()=" + getComment_num()
				+ ", getIdx()=" + getIdx() + ", getComment_content()=" + getComment_content() + ", getMem_id()="
				+ getMem_id() + ", getCommentUser()=" + getCommentUser() + ", getComment_regdate()="
				+ getComment_regdate() + ", getSecretComment()=" + getSecretComment() + ", getWriter()=" + getWriter()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	public CommentVo() {}
	public CommentVo(Integer comment_num, Integer idx, String comment_content, String mem_id, String commentUser,
			Date comment_regdate, String secretComment, String writer) {
		super();
		this.comment_num = comment_num;
		this.idx = idx;
		this.comment_content = comment_content;
		this.mem_id = mem_id;
		this.commentUser = commentUser;
		this.comment_regdate = comment_regdate;
		this.secretComment = secretComment;
		this.writer = writer;
	}
	
}