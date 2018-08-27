package com.service;

import java.util.List;
import java.util.Map;

import com.entity.TEmployee;
import com.entity.TEmployeeExample;


public interface IEmployeeService2 {
    public abstract TEmployee checkLogin1(String employeeName, String password);

    //分页
    public abstract List<TEmployee> selectbypage(int pageNo,int pageSize);

    //分页高级查询
    public abstract List<TEmployee> selectbypageExample(int pageNo,int pageSize,int No);
    public abstract List<TEmployee> selectbypageExample1(int pageNo,int pageSize,int No);
    public abstract List<TEmployee> selectbypageExample2(Map<String, Object> map);

    //查询个数
    public int getTotalCounts(TEmployeeExample example);

    //添加
    public abstract int addEmp(TEmployee emp);

    //查下级员工
    public abstract List<TEmployee> querybymanager(int empId);

    //根据编号删除员工
    public abstract int removeEmp(int empId);

    //修改员工
    public abstract void modifyEmployee(TEmployee employee);

    //根据编号查询某员工的详细信息
    public abstract TEmployee querybyid(int empId);

    //查询所有主管
    public abstract List<TEmployee> queryAllManager();
}
