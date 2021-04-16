package map.vo;

public class MapVo {

		private	int	   idx;
		private	String title;
		private	String addr;
		private	String tel;
		private	String gyeongdo;
		private	String wido;
		public MapVo(int idx, String title, String addr, String tel, String gyeongdo, String wido) {
			super();
			this.idx = idx;
			this.title = title;
			this.addr = addr;
			this.tel = tel;
			this.gyeongdo = gyeongdo;
			this.wido = wido;
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
			public String getAddr() {
				return addr;
			}
			public void setAddr(String addr) {
				this.addr = addr;
			}
			public String getTel() {
					return tel;
				}
				public void setTel(String tel) {
					this.tel = tel;
				}
				public String getGyeongdo() {
					return gyeongdo;
				}
				public void setGyeongdo(String gyeongdo) {
					this.gyeongdo = gyeongdo;
				}
				public String getWido() {
					return wido;
				}
				public void setWido(String wido) {
					this.wido = wido;
				}
				@Override
				public String toString() {
					return "MapVo [idx=" + idx + ", title=" + title + ", addr=" + addr + ", tel=" + tel + ", gyeongdo="
							+ gyeongdo + ", wido=" + wido + "]";
				}
		
		
}
