package com.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.util.EmployeeForm2;

import com.mapper.IRoleDao2;
import com.entity.TEmployee;

import com.entity.TRole;


import com.service.IEmployeeService2;

@Controller
@SessionAttributes("form")
public class LoginController2 {

    @Autowired
    IEmployeeService2 employeeService2;
    @Resource
    IRoleDao2 roleDAO2;


    public LoginController2() {
        // TODO Auto-generated constructor stub
        System.out.println("LoginController2实例化");
    }

    // 装填员工登录表单请求
    @RequestMapping(value = "/input_login.do")
    public String inputEmps(Model model) {
        TEmployee emp = new TEmployee();
        TRole role = new TRole();
        EmployeeForm2 loginForm = new EmployeeForm2();
        loginForm.setEmp(emp);
        loginForm.setRole(role);

        List<TRole> allRoles = this.roleDAO2.selectByExample(null);
        for (TRole tRole : allRoles) {
            System.out.println("角色名称" + tRole.getRoleName());
        }
        model.addAttribute("form", loginForm);// 空白表单对象

        model.addAttribute("allroles", allRoles);// 给角色下拉列表装填数据

        return "login";// login.jsp->转发到登录页面

    }

    @RequestMapping(value = "/emplogin", method = RequestMethod.POST)
    public String login(@ModelAttribute("form") EmployeeForm2 form,
                        ModelMap map, HttpSession session) {

        String nextAction = "";// 跳转路径

        // 使用业务层验证登录：
        TEmployee employee = employeeService2.checkLogin1(form.getEmp()
                .getEmployeeName(), form.getEmp().getPassword());

        System.out.println("LoginController登录结果：" + employee);

        if (employee != null) {
            // 验证用户成功（数据库存在员工记录）
            if (employee.getRoleId()
                    .equals(form.getRole().getRoleId())) {

                // 用户名和密码及其角色相一致的登录成功员工保存在会话范围内！！！
                session.setAttribute("employee", employee);
                TRole role = roleDAO2.selectByPrimaryKey(employee.getRoleId());
                String roleName = role.getRoleName();
                if ("系统管理员".equals(roleName)) {
                    nextAction = "redirect:/admin_login_success.do";
                } else if ("主管".equals(roleName)) {
                    nextAction = "redirect:/manager_login_success.do";
                } else if ("员工".equals(roleName)) {
                    System.out.println("普通员工");
                    nextAction = "redirect:/employee_login_success.do";
                }
            } else {
                session.setAttribute("message", "该用户无此角色");
                nextAction = "redirect:/login_error.do";
            }

        } else {
            session.setAttribute("message", "登录失败，用户名和密码不一致");
            nextAction = "redirect:/login_error.do";
        }
        return nextAction;
    }

    @RequestMapping(value = "/exit.do")
    public String exit(Model model, HttpSession session) {

        session.removeAttribute("employee");
        return this.inputEmps(model);
    }
}
