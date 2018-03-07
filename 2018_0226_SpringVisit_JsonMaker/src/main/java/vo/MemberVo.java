package vo;

public class MemberVo {
	
	int idx;
	String name,id,pwd,address,zipcode,ip,regdate;
	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	public MemberVo(int idx, String name, String id, String pwd, String address, String zipcode, String ip) {
		super();
		this.idx = idx;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.address = address;
		this.zipcode = zipcode;
		this.ip = ip;
	}
	
	public MemberVo(String name, String id, String pwd, String address, String zipcode, String ip) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.address = address;
		this.zipcode = zipcode;
		this.ip = ip;
	}


	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
