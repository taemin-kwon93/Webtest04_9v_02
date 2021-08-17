package ez2.logon0817;

import java.sql.Timestamp;

public class LogonDataBean02 {
/*	
    m_id varchar2(12) not null primary key,--아이디
	m_passwd varchar2(12) not null,--비밀번호
	m_name varchar2(10) not null,--이름
	m_jumin1 varchar2(6) not null,--주민등록번호 앞자리
	m_jumin2 varchar2(7) not null,--주민등록번호 뒷자리
	m_email varchar2(30),--이메일주소
	m_blog varchar2(50),--블로그주소
	m_reg_date date not null,--등록날짜
	m_zipcode varchar2(7) null,--우편번호
	address varchar2(30) null--주소
*/	
	private String m_passwd;
	private String m_name;
	private String m_jumin1;
	private String m_jumin2;
	private String m_email;
	private String m_blog;
	private Timestamp m_reg_date;
	private String m_zipcode;
	private String address;

	private String m_id;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_passwd() {
		return m_passwd;
	}
	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_jumin1() {
		return m_jumin1;
	}
	public void setM_jumin1(String m_jumin1) {
		this.m_jumin1 = m_jumin1;
	}
	public String getM_jumin2() {
		return m_jumin2;
	}
	public void setM_jumin2(String m_jumin2) {
		this.m_jumin2 = m_jumin2;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_blog() {
		return m_blog;
	}
	public void setM_blog(String m_blog) {
		this.m_blog = m_blog;
	}
	public Timestamp getM_reg_date() {
		return m_reg_date;
	}
	public void setM_reg_date(Timestamp m_reg_date) {
		this.m_reg_date = m_reg_date;
	}
	public String getM_zipcode() {
		return m_zipcode;
	}
	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
