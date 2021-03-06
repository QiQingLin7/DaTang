package com.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TEmployee {

    private TEmployee parent;

    public TEmployee getParent() {
        return parent;
    }

    public void setParent(TEmployee parent) {
        this.parent = parent;
    }

    private TRole role;

    public TRole getRole() {
        return role;
    }

    public void setRole(TRole role) {
        this.role = role;
    }

    private Integer employeeId;

    private String employeeName;

    private String password;

    private String realName;

    private String sex;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private String duty;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date enrolldate;

    private String education;

    private String major;

    private String experience;

    private Integer roleId;

    private Integer parentId;

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName == null ? null : employeeName.trim();
    }

    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.PASSWORD
     *
     * @param password the value for T_EMPLOYEE.PASSWORD
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.REAL_NAME
     *
     * @return the value of T_EMPLOYEE.REAL_NAME
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public String getRealName() {
        return realName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.REAL_NAME
     *
     * @param realName the value for T_EMPLOYEE.REAL_NAME
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.SEX
     *
     * @return the value of T_EMPLOYEE.SEX
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public String getSex() {
        return sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.SEX
     *
     * @param sex the value for T_EMPLOYEE.SEX
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.BIRTHDAY
     *
     * @return the value of T_EMPLOYEE.BIRTHDAY
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.BIRTHDAY
     *
     * @param birthday the value for T_EMPLOYEE.BIRTHDAY
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.DUTY
     *
     * @return the value of T_EMPLOYEE.DUTY
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public String getDuty() {
        return duty;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.DUTY
     *
     * @param duty the value for T_EMPLOYEE.DUTY
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setDuty(String duty) {
        this.duty = duty == null ? null : duty.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.ENROLLDATE
     *
     * @return the value of T_EMPLOYEE.ENROLLDATE
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public Date getEnrolldate() {
        return enrolldate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.ENROLLDATE
     *
     * @param enrolldate the value for T_EMPLOYEE.ENROLLDATE
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setEnrolldate(Date enrolldate) {
        this.enrolldate = enrolldate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.EDUCATION
     *
     * @return the value of T_EMPLOYEE.EDUCATION
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public String getEducation() {
        return education;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.EDUCATION
     *
     * @param education the value for T_EMPLOYEE.EDUCATION
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.MAJOR
     *
     * @return the value of T_EMPLOYEE.MAJOR
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public String getMajor() {
        return major;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.MAJOR
     *
     * @param major the value for T_EMPLOYEE.MAJOR
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.EXPERIENCE
     *
     * @return the value of T_EMPLOYEE.EXPERIENCE
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public String getExperience() {
        return experience;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.EXPERIENCE
     *
     * @param experience the value for T_EMPLOYEE.EXPERIENCE
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setExperience(String experience) {
        this.experience = experience == null ? null : experience.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.ROLE_ID
     *
     * @return the value of T_EMPLOYEE.ROLE_ID
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column T_EMPLOYEE.ROLE_ID
     *
     * @param roleId the value for T_EMPLOYEE.ROLE_ID
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column T_EMPLOYEE.PARENT_ID
     *
     * @return the value of T_EMPLOYEE.PARENT_ID
     * @mbggenerated Mon Sep 04 23:11:35 CST 2017
     */
    public Integer getParentId() {
        return parentId;
    }


    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "TEmployee{" +
                "parent=" + parent +
                ", role=" + role +
                ", employeeId=" + employeeId +
                ", employeeName='" + employeeName + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", duty='" + duty + '\'' +
                ", enrolldate=" + enrolldate +
                ", education='" + education + '\'' +
                ", major='" + major + '\'' +
                ", experience='" + experience + '\'' +
                ", roleId=" + roleId +
                ", parentId=" + parentId +
                '}';
    }
}