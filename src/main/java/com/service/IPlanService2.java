package com.service;

import com.entity.TPlan;
import com.entity.TPlanExample;
import com.entity.TTask;
import com.util.PlanDTO;

import java.util.List;


public interface IPlanService2 {
    //根据task_id获得该相应计划的数量
    public abstract int getplanCounts(Integer task_id);

    //查询所有计划
    public abstract List<TPlan> queryallplan(int pageNo, int pageSize, int taskid);

    //查询个数
    public int getTotalCounts(TPlanExample example);


    //添加计划
    public abstract int insertPlan(TPlan plan);

    //删除计划
    public abstract int removePlan(int planId);

    public abstract List<TPlan> advanceQuery(PlanDTO dto, int pageNo, int pageSize);

    public abstract List<TPlan> query(int pageNo, int pageSize);

    public abstract TPlan queryById(int planId);

    public abstract int updatePlan(TPlan plan, int planId);

    public abstract int selectCount();

    public abstract int advanceQueryCount(PlanDTO dto);

    //任务
    public abstract List<TPlan> advanceQuery(PlanDTO dto);

    public abstract List<TPlan> query();


    public abstract List<TTask> queryTask();

    public abstract TTask queryTaskById(int taskId);

    public abstract List<TPlan> queryPlanById(int begin, int end, int taskId);
}
