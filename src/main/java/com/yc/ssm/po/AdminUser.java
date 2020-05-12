package com.yc.ssm.po;

import java.io.Serializable;

public class AdminUser implements Serializable {
    private Integer adminUserid;

    private String adminAccount;

    private String adminName;

    private String adminPassword;

    private String adminSex;

    private String adminLevel;

    public Integer getAdminUserid() {
        return adminUserid;
    }

    public void setAdminUserid(Integer adminUserid) {
        this.adminUserid = adminUserid;
    }

    public String getAdminAccount() {
        return adminAccount;
    }

    public void setAdminAccount(String adminAccount) {
        this.adminAccount = adminAccount == null ? null : adminAccount.trim();
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName == null ? null : adminName.trim();
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword == null ? null : adminPassword.trim();
    }

    public String getAdminSex() {
        return adminSex;
    }

    public void setAdminSex(String adminSex) {
        this.adminSex = adminSex == null ? null : adminSex.trim();
    }

    public String getAdminLevel() {
        return adminLevel;
    }

    public void setAdminLevel(String adminLevel) {
        this.adminLevel = adminLevel == null ? null : adminLevel.trim();
    }
}