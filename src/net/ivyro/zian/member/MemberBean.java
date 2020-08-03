package net.ivyro.zian.member;

import java.sql.Date;

public class MemberBean {

private String id; 
private String passwd; 
private String name; 
private int age; 
private int mobile; 
private String gender;
private String email; 
private String birth; 
private String addr; 
private int post; 
private Date reg_date;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public int getMobile() {
	return mobile;
}
public void setMobile(int mobile) {
	this.mobile = mobile;
}

public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getBirth() {
	return birth;
}
public void setBirth(String birth) {
	this.birth = birth;
}
public String getAddr() {
	return addr;
}
public void setAddr(String addr) {
	this.addr = addr;
}
public int getPost() {
	return post;
}
public void setPost(int post) {
	this.post = post;
}
public Date getReg_date() {
	return reg_date;
}
public void setReg_date(Date reg_date) {
	this.reg_date = reg_date;
}

@Override
public String toString() {
	return "MemberBean [id=" + id + ", passwd=" + passwd + ", name=" + name + ", age=" + age + ", mobile=" + mobile
			+ ", gender=" + gender + ", email=" + email + ", birth=" + birth + ", addr=" + addr + ", post=" + post
			+ ", reg_date=" + reg_date + "]";
}


	

}
