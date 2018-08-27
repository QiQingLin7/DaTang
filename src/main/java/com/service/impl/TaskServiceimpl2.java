package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.ITaskDao2;
import com.entity.TTask;
import com.entity.TTaskExample;
import com.entity.TTaskExample.Criteria;
import com.service.ITaskService2;

@Service("taskService2")
public class TaskServiceimpl2 implements ITaskService2 {
    private ITaskDao2 taskDao2;

    @Autowired
    public TaskServiceimpl2(ITaskDao2 taskDao2) {
        this.taskDao2 = taskDao2;
    }

    public ITaskDao2 getTaskDao2() {
        return taskDao2;
    }

    public void setTaskDao2(ITaskDao2 taskDao2) {
        this.taskDao2 = taskDao2;
    }

    Map<String, Object> map = new HashMap<String, Object>();
    TTaskExample example = new TTaskExample();
    Criteria criteria;

    @Override
    public List<TTask> selectbypage(int pageNo, int pageSize) {
        // TODO Auto-generated method stub
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;
        map.put("start", start);
        map.put("end", end);
        List<TTask> tasks = taskDao2.selectByPage(map);
        return tasks;
    }

    @Override
    public int getTotalCounts(TTaskExample example) {
        // TODO Auto-generated method stub
        return taskDao2.countByExample(example);
    }

    @Override
    public TTask querybyid(int task_id) {

        return taskDao2.selectByPrimaryKey(task_id);
    }

    @Override
    public List<TTask> queryTasks() {
        return null;
    }

    @Override
    public int delTask(int taskid) {
        // TODO Auto-generated method stub
        return taskDao2.deleteByPrimaryKey(taskid);
    }

    @Override
    public List<TTask> queryTasksBystatus(int begin, int end, String status) {
        // TODO Auto-generated method stub
        map.put("start", begin);
        map.put("end", end);
        map.put("status", status);
        return taskDao2.selectByPageExample(map);
    }

    @Override
    public int modifyTask(TTask tk) {
        // TODO Auto-generated method stub
        return 0;
    }

}
