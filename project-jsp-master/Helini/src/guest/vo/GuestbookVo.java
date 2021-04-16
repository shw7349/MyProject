package guest.vo;

public class GuestbookVo {
	// fiends
	private int    gb_no;
	private String gb_id;
	private String gb_pass;
	private String gb_con;
	private String gb_date;
	private int    readcount;
	private int    bnum;
	private int    lvl;
	private int    step;
	private int    nref;

	// constructor
	public GuestbookVo () {}

	public GuestbookVo(int gb_no, String gb_id, String gb_pass, String gb_con, String gb_date, int readcount, int bnum,
			int lvl, int step, int nref) {
		this.gb_no = gb_no;
		this.gb_id = gb_id;
		this.gb_pass = gb_pass;
		this.gb_con = gb_con;
		this.gb_date = gb_date;
		this.readcount = readcount;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
	}

	public GuestbookVo(String gb_id, String gb_pass, String gb_con, int bnum, int lvl, int step, int nref) {
		this.gb_id = gb_id;
		this.gb_pass = gb_pass;
		this.gb_con = gb_con;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
	}

	// getter & setter
	public int getGb_no() {
		return gb_no;
	}
	public void setGb_no(int gb_no) {
		this.gb_no = gb_no;
	}
	public String getGb_id() {
		return gb_id;
	}
	public void setGb_id(String gb_id) {
		this.gb_id = gb_id;
	}
	public String getGb_pass() {
		return gb_pass;
	}
	public void setGb_pass(String gb_pass) {
		this.gb_pass = gb_pass;
	}
	public String getGb_con() {
		return gb_con;
	}
	public void setGb_con(String gb_con) {
		this.gb_con = gb_con;
	}
	public String getGb_date() {
		return gb_date;
	}
	public void setGb_date(String gb_date) {
		this.gb_date = gb_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getNref() {
		return nref;
	}
	public void setNref(int nref) {
		this.nref = nref;
	}

	// toString
	@Override
	public String toString() {
		return "GuestbookVo [gb_no=" + gb_no + ", gb_id=" + gb_id + ", gb_pass=" + gb_pass + ", gb_con=" + gb_con
				+ ", gb_date=" + gb_date + ", readcount=" + readcount + ", bnum=" + bnum + ", lvl=" + lvl + ", step="
				+ step + ", nref=" + nref + "]";
	}			


}