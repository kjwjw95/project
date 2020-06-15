package com.aa.bb.domain;

public class BoardVO {

	private String ename;
	private String comm;
	private String hiredate;
	private String empno;
	private String mgr;	
	private String job;	
	private String deptno;	
	private String sal;
	
	
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getMgr() {
		return mgr;
	}
	public void setMgr(String mgr) {
		this.mgr = mgr;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getSal() {
		return sal;
	}
	public void setSal(String sal) {
		this.sal = sal;
	}
	@Override
	public String toString() {
		return "EmpVo [getEname()=" + getEname() + ", getComm()=" + getComm() + ", getHiredate()=" + getHiredate()
				+ ", getEmpno()=" + getEmpno() + ", getMgr()=" + getMgr() + ", getJob()=" + getJob() + ", getDeptno()="
				+ getDeptno() + ", getSal()=" + getSal() + "]";
	}	
	
}
