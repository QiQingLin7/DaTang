package com.service.impl;

import com.entity.TEmployee;
import com.entity.TEmployeeExample;
import com.mapper.IEmployeeDao2;
import com.service.IEmployeeService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("employeeService2")
public class EmployeeServiceimpl2 implements IEmployeeService2 {
    @Autowired
    private IEmployeeDao2 employeeDao2;


    public IEmployeeDao2 getEmployeeDao2() {
        return employeeDao2;
    }


    public void setEmployeeDao2(IEmployeeDao2 employeeDao2) {
        this.employeeDao2 = employeeDao2;
    }


    Map<String, Object> map;
    TEmployeeExample example = new TEmployeeExample();
    TEmployeeExample.Criteria criteria;

    @Override
    public TEmployee checkLogin1(String employeeName, String password) {
        TEmployee employee = null;
        List<TEmployee> employees;

        TEmployeeExample example = new TEmployeeExample();
        TEmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmployeeNameEqualTo(employeeName);
        criteria.andPasswordEqualTo(password);
        employees = this.employeeDao2.selectByExample(example);
        System.out.println("数据：" + employees.toString());
        if (employees != null && employees.size() > 0) {
            employee = employees.get(0);
        }
        return employee;
    }


    //分页全部查询
    @Override
    public List<TEmployee> selectbypage(int pageNo, int pageSize) {
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;


        map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);

        List<TEmployee> pbEmp = this.employeeDao2.selectByPage(map);

        return pbEmp;
    }


    @Override
    public int getTotalCounts(TEmployeeExample example) {
        return employeeDao2.countByExample(example);

    }


    @Override
    public int addEmp(TEmployee emp) {
        return employeeDao2.insert(emp);
    }


    @Override
    public List<TEmployee> selectbypageExample(int pageNo, int pageSize,
                                               int No) {
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;

        map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("No", No);
        List<TEmployee> pbEmp = this.employeeDao2.selectByPageExample(map);
        return pbEmp;
    }


    @Override
    public List<TEmployee> querybymanager(int empId) {
        // TODO Auto-generated method stub
        criteria = example.createCriteria();
        criteria.andParentIdEqualTo(empId);
        List<TEmployee> employees = employeeDao2.selectByExample(example);
        return employees;
    }


    @Override
    public int removeEmp(int empId) {
        // TODO Auto-generated method stub
        return employeeDao2.deleteByPrimaryKey(empId);
    }


    @Override
    public void modifyEmployee(TEmployee employee) {
        // TODO Auto-generated method stub
        employeeDao2.updateByPrimaryKey(employee);

    }


    @Override
    public List<TEmployee> selectbypageExample1(int pageNo, int pageSize,
                                                int No) {
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;

        map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("No", No);
        List<TEmployee> pbEmp = this.employeeDao2.selectByPageExample1(map);
        return pbEmp;
    }


    @Override
    public TEmployee querybyid(int empId) {

        return employeeDao2.selectByPrimaryKey(empId);
    }


    @Override
    public List<TEmployee> queryAllManager() {
        // TODO Auto-generated method stub
        criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(3);
        return employeeDao2.selectByExample(example);
    }


    @Override
    public List<TEmployee> selectbypageExample2(Map<String, Object> map) {
        List<TEmployee> employees = employeeDao2.selectByPageExample2(map);
        return employees;
    }
}
