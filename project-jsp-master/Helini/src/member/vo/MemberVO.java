package member.vo;

import java.sql.Date;

public class MemberVO {
	
	private String id;
	private String pwd;
	private String nickname;
	private String email;
	private Date   joindate;
	
	public MemberVO(String id, String pwd, String nickname, String email) {
		this.id       = id;
		this.pwd      = pwd;
		this.nickname = nickname;
		this.email    = email;
	}
	
	public MemberVO(String id, String pwd, String nickname, String email, Date joindate) {
		this.id       = id;
		this.pwd      = pwd;
		this.nickname = nickname;
		this.email    = email;
		this.joindate = joindate;
	}
	
	public MemberVO() {}

	public String getId      () {return id      ;}
	public String getPwd     () {return pwd     ;}
	public String getNickname() {return nickname;}
	public String getEmail   () {return email   ;}
	public Date   getJoindate() {return joindate;}
	
	public void setId      (String id      ) {this.id       = id      ;}
	public void setPwd     (String pwd     ) {this.pwd      = pwd     ;}
	public void setNickname(String nickname) {this.nickname = nickname;}
	public void setEmail   (String email   ) {this.email    = email   ;}
	public void setJoindate(Date   joindate) {this.joindate = joindate;}
	
}