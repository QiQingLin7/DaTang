package com.util;


import com.entity.TEmployee;
import com.entity.TRole;

public class EmployeeForm2 {
    private TEmployee emp;// 表单员工
    private TRole role;// 表单角色

    private String password1;

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public EmployeeForm2() {
        super();
        // TODO Auto-generated constructor stub
    }

    public TEmployee getEmp() {
        return emp;
    }

    public void setEmp(TEmployee emp) {
        this.emp = emp;
    }

    public TRole getRole() {
        return role;
    }

    public void setRole(TRole role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "EmployeeForm2 [emp=" + emp + ", role=" + role + ", password1="
                + password1 + "]";
    }


}
