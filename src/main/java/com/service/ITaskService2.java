package com.service;

import com.entity.TTask;
import com.entity.TTaskExample;

import java.util.List;


public interface ITaskService2 {
    //分页查询
    public abstract List<TTask> selectbypage(int pageNo, int pageSize);

    //获得总数
    public abstract int getTotalCounts(TTaskExample example);

    //根据id查询任务信息
    public abstract TTask querybyid(int task_id);

    public abstract List<TTask> queryTasks();

    public abstract int delTask(int taskid);

    public abstract List<TTask> queryTasksBystatus(int begin, int end, String status);

    public abstract int modifyTask(TTask tk);
}
