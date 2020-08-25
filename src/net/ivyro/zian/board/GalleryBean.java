package net.ivyro.zian.board;

import java.sql.Date;

public class GalleryBean {

	private int bno;
	private String id;
	private String name;
	private String passwd;
	private String subject;
	private String content;
	private Date date;
	private String period;
	private int readcount;
	private String category;
	private String thumnail;
	private String pic;
	private int re_ref;
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	@Override
	public String toString() {
		return "GalleryBean [bno=" + bno + ", id=" + id + ", name=" + name + ", passwd=" + passwd + ", subject="
				+ subject + ", content=" + content + ", date=" + date + ", period=" + period + ", readcount="
				+ readcount + ", category=" + category + ", thumnail=" + thumnail + ", pic=" + pic + ", re_ref="
				+ re_ref + "]";
	}
	
	
	
}
