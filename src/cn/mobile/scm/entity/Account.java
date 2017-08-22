package cn.mobile.scm.entity;

import java.io.Serializable;

public class Account implements Serializable{
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 204545351280626785L;

	private Integer accId;

    private String accLogin;

    private String accName;

    private String accPass;

    public Integer getAccId() {
        return accId;
    }

    public void setAccId(Integer accId) {
        this.accId = accId;
    }

    public String getAccLogin() {
        return accLogin;
    }

    public void setAccLogin(String accLogin) {
        this.accLogin = accLogin == null ? null : accLogin.trim();
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName == null ? null : accName.trim();
    }

    public String getAccPass() {
        return accPass;
    }

    public void setAccPass(String accPass) {
        this.accPass = accPass == null ? null : accPass.trim();
    }
    
    @Override
	public String toString() {
		return "Account [accId=" + accId + ", accLogin=" + accLogin
				+ ", accName=" + accName + ", accPass=" + accPass + "]";
	}

}