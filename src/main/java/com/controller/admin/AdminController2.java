package com.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.util.EmployeeForm2;
import com.util.PageBean;

import com.mapper.IRoleDao2;
import com.entity.TEmployee;
import com.entity.TEmployeeExample;
import com.entity.TEmployeeExample.Criteria;
import com.entity.TRole;

import com.service.IEmployeeService2;

//系统管理员的control
@Controller
@SessionAttributes(value = {"emps", "addForm", "empadmin", "all", "allmanager"})
public class AdminController2 {
    @Resource
    IEmployeeService2 employeeService2;

    @Resource
    IRoleDao2 roleDao2;
    TEmployeeExample example;
    Criteria criteria;

    //分页
    @RequestMapping(value = "/queryall.do", method = RequestMethod.GET)
    public String query(Model model, String pageNo1, String pageSize1) {
        int pageNo = 1;
        int pageSize = 4;
        System.out.println("页号：" + pageNo1);
        if (!(pageNo1 == null || "".equals(pageNo1.trim()))) {

            pageNo = Integer.parseInt(pageNo1);
        }
        if (!(pageSize1 == null || "".equals(pageSize1.trim()))) {
            pageSize = Integer.parseInt(pageSize1);
        }
        System.out.println("页号：" + pageNo + "," + pageSize);
        List<TEmployee> pbemps = employeeService2.selectbypage(pageNo, pageSize);
        for (TEmployee tEmployee : pbemps) {
            TRole role = roleDao2.selectByPrimaryKey(tEmployee.getRoleId());
            tEmployee.setRole(role);
        }
        //存放查询结果对象
        PageBean<TEmployee> pb = new PageBean<TEmployee>();
        pb.setData(pbemps);
        pb.setPageNo(pageNo);
        pb.setPageSize(pageSize);
        pb.setTotalRecords(employeeService2.getTotalCounts(null));
        model.addAttribute("emps", pb);
        return "redirect:/admin_query.do";
    }

    //添加
    @RequestMapping(value = "/input_add.do", method = RequestMethod.POST)
    public String add_loader(Model model) {
        TEmployee emp = new TEmployee();
        TRole role = new TRole();


        EmployeeForm2 employeeForm = new EmployeeForm2();
        employeeForm.setEmp(emp);
        employeeForm.setRole(role);
        employeeForm.setPassword1("");//设置空确认密码

        List<TRole> allRoles = this.roleDao2.selectByExample(null);
        ;

        model.addAttribute("allrole", allRoles);
        model.addAttribute("addForm", employeeForm);

        return "forward:/admin_add.do";

    }

    @RequestMapping(value = "/addEmp.do", method = RequestMethod.POST)
    public String addEmp(@ModelAttribute("addForm") EmployeeForm2 employeeForm, Model model, HttpSession session) {

        String password = employeeForm.getEmp().getPassword();
        if (employeeForm.getPassword1().equals(password)) {
            employeeForm.getEmp().setRole(employeeForm.getRole());
            employeeForm.getEmp().setRoleId(employeeForm.getRole().getRoleId());
            employeeService2.addEmp(employeeForm.getEmp());
            return this.query(model, null, null);
        } else {
            session.setAttribute("message", "新增失败，两次密码不一致");
            return "redirect:/error.do";
        }

    }

    //查询非管理员的员工信息
    @RequestMapping(value = "/input_remove.do")
    public String loader_remove(Model model, String pageNo1, String pageSize1) {
        int pageNo = 1;
        int pageSize = 4;
        System.out.println("页号：" + pageNo1);
        //判断是否传入了页号
        if (!(pageNo1 == null || "".equals(pageNo1.trim()))) {

            pageNo = Integer.parseInt(pageNo1);
        }
        if (!(pageSize1 == null || "".equals(pageSize1.trim()))) {
            pageSize = Integer.parseInt(pageSize1);
        }
        System.out.println("页号：" + pageNo + "," + pageSize);

        example = new TEmployeeExample();
        criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(3);
        Criteria c2 = example.createCriteria();
        c2.andRoleIdEqualTo(4);
        List<Criteria> myOrCriteria = example.getOredCriteria();
        myOrCriteria.add(criteria);
        myOrCriteria.add(c2);
        List<TEmployee> pbemps = employeeService2.selectbypageExample(pageNo, pageSize, 2);
        for (TEmployee tEmployee : pbemps) {
            TRole role = roleDao2.selectByPrimaryKey(tEmployee.getRoleId());
            tEmployee.setRole(role);
        }

        //存放查询结果对象
        PageBean<TEmployee> pb = new PageBean<>();
        pb.setData(pbemps);
        pb.setPageNo(pageNo);
        pb.setPageSize(pageSize);
        pb.setTotalRecords(employeeService2.getTotalCounts(example));
        //存放到会话对象
        model.addAttribute("empadmin", pb);
        return "redirect:/admin_remove.do";


    }

    //删除
    @RequestMapping(value = "/remove.do", method = RequestMethod.POST)
    public String remove(Integer empId, Model model) {
//		System.out.println("编号："+empId);
        List<TEmployee> employees = employeeService2.querybymanager(empId);
        if (employees.size() != 0) {
            for (TEmployee tEmployee : employees) {
                //删除外键关键
                tEmployee.setParentId(null);
                employeeService2.modifyEmployee(tEmployee);
            }
        }
        employeeService2.removeEmp(empId);
        return this.loader_remove(model, null, null);
    }

    //查询所有角色为员工的信息
    @RequestMapping(value = "/input_update.do")
    public String loader_update(Model model, String pageNo1, String pageSize1) {
        int pageNo = 1;
        int pageSize = 4;
        System.out.println("页号：" + pageNo1);
        //判断是否传入了页号
        if (!(pageNo1 == null || "".equals(pageNo1.trim()))) {

            pageNo = Integer.parseInt(pageNo1);
        }
        if (!(pageSize1 == null || "".equals(pageSize1.trim()))) {
            pageSize = Integer.parseInt(pageSize1);
        }
        System.out.println("页号：" + pageNo + "," + pageSize);
        List<TEmployee> pbemps = employeeService2.selectbypageExample1(pageNo, pageSize, 4);
        for (TEmployee tEmployee : pbemps) {
            TRole role = roleDao2.selectByPrimaryKey(tEmployee.getRoleId());
            tEmployee.setRole(role);
        }
        example = new TEmployeeExample();
        criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(4);

        //存放查询结果对象
        PageBean<TEmployee> pb = new PageBean<TEmployee>();
        pb.setData(pbemps);
        pb.setPageNo(pageNo);
        pb.setPageSize(pageSize);
        pb.setTotalRecords(employeeService2.getTotalCounts(example));
        //存放到会话对象
        model.addAttribute("all", pb);
        return "redirect:/admin_update.do";


    }

    //查看详情
    @RequestMapping(value = "/desc.do", method = RequestMethod.POST)
    public String desc(Model model, Integer empId, HttpSession session) {

        TEmployee allperson = employeeService2.querybyid(empId);
        TRole role = roleDao2.selectByPrimaryKey(allperson.getRoleId());
        allperson.setRole(role);
        List<TEmployee> allmanager = employeeService2.queryAllManager();
        for (TEmployee tEmployee : allmanager) {
            System.out.println("所有主管：" + tEmployee.getRealName());
        }
        model.addAttribute("allm", allmanager);

        model.addAttribute("persondesc", allperson);
        session.setAttribute("person", allperson);
        return "forward:/admin_desc.do";
    }

    //修改
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    public String update(Model model, int managerid, HttpSession session) {
        TEmployee e = (TEmployee) session.getAttribute("person");
//		TEmployee parentemployee = new TEmployee();
//		parentemployee.setEmployeeId(managerid);
//		e.setParent(parentemployee);
        e.setParentId(managerid);
        employeeService2.modifyEmployee(e);
        return this.loader_update(model, null, null);
    }
}