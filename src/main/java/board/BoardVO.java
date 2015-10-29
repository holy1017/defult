package board;

import org.apache.ibatis.type.Alias;

@Alias("BoardVO")
public class BoardVO {

	private int b_no;
	private String b_title;
	private String b_content;
	private String b_indate;
	private String b_eddate;
	private int u_no;
	private int b_delete;

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_indate() {
		return b_indate;
	}

	public void setB_indate(String b_indate) {
		this.b_indate = b_indate;
	}

	public String getB_eddate() {
		return b_eddate;
	}

	public void setB_eddate(String b_eddate) {
		this.b_eddate = b_eddate;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getB_delete() {
		return b_delete;
	}

	public void setB_delete(int b_delete) {
		this.b_delete = b_delete;
	}
}
