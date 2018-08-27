package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.entity.TEmployeeExample;
import org.springframework.stereotype.Service;

import com.mapper.IPlanDao2;
import com.entity.TPlan;
import com.entity.TPlanExample;
import com.entity.TTask;
import com.entity.TPlanExample;
import com.entity.TPlanExample.Criteria;
import com.service.IPlanService2;
import com.util.PlanDTO;
import org.springframework.beans.factory.annotation.Autowired;


@Service("planService2")
public class PlanServiceimpl2 implements IPlanService2 {
    @Autowired
    private IPlanDao2 planDao2;

    public IPlanDao2 getPlanDao2() {
        return planDao2;
    }

    public void setPlanDao2(IPlanDao2 planDao2) {
        this.planDao2 = planDao2;
    }

    Map<String, Object> map = new HashMap<String, Object>();
    TPlanExample example = new TPlanExample();
    Criteria criteria;

    @Override
    public int getplanCounts(Integer task_id) {
        System.out.println("编号：" + task_id);
        if (example != null) {
            example.clear();
        }
        ;

        criteria = example.createCriteria();
        criteria.andTaskIdEqualTo(task_id);
        int count = planDao2.countByExample(example);
        System.out.println("数量：" + count);
        return count;
    }

    @Override
    public List<TPlan> queryallplan(int pageNo, int pageSize, int taskid) {
        // TODO Auto-generated method stub
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;
        map.put("start", start);
        map.put("end", end);
        map.put("No", taskid);
        return planDao2.selectByPageExample1(map);
    }

    @Override
    public int getTotalCounts(TPlanExample example) {
        // TODO Auto-generated method stub
        return planDao2.countByExample(example);
    }

    @Override
    public int insertPlan(TPlan plan) {
        // TODO Auto-generated method stub
        return planDao2.insertSelective(plan);
    }

    @Override
    public int removePlan(int planId) {
        // TODO Auto-generated method stub
        return planDao2.deleteByPrimaryKey(planId);
    }

    @Override
    public List<TPlan> advanceQuery(PlanDTO dto, int pageNo, int pageSize) {
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;
        map.put("start", start);
        map.put("end", end);
        map.put("dto", dto);
        return planDao2.selectByPageExample(map);
    }

    @Override
    public List<TPlan> query(int pageNo, int pageSize) {
        int start = (pageNo - 1) * pageSize + 1;
        int end = pageNo * pageSize;
        map.put("start", start);
        map.put("end", end);
        return planDao2.selectByPage(map);
    }

    @Override
    public TPlan queryById(int planId) {
        // TODO Auto-generated method stub
        return planDao2.selectByPrimaryKey(planId);
    }

    @Override
    public int updatePlan(TPlan plan, int planId) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int selectCount() {
        return planDao2.countByExample(example);
    }

    @Override
    public int advanceQueryCount(PlanDTO dto) {
        criteria = example.createCriteria();
        if (dto != null) {
            if (dto.getPlanName() != null && !"".equals(dto.getPlanName())) {
                criteria.andPlanNameEqualTo(dto.getPlanName());

            }
            if (dto.getTask() != null) {
                criteria.andTaskIdEqualTo(dto.getTask().getTaskId());

            }
            if (dto.getBeginDate1() != null && dto.getBeginDate2() != null) {
                if (dto.getBeginDate1().before(dto.getBeginDate2())) {
                    criteria.andBeginDateBetween(dto.getBeginDate1(), dto.getBeginDate2());
                }
            }
            if (dto.getEndDate1() != null && dto.getEndDate2() != null) {
                if (dto.getEndDate1().before(dto.getEndDate2())) {
                    criteria.andEndDateBetween(dto.getEndDate1(), dto.getEndDate2());
                }
            }
            if (dto.getIsFeedback() != null && !"".equals(dto.getIsFeedback())) {
                criteria.andIsFeedbackEqualTo(dto.getIsFeedback());
            }
        }
        return planDao2.countByExample(example);
    }

    @Override
    public List<TPlan> advanceQuery(PlanDTO dto) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<TPlan> query() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<TTask> queryTask() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public TTask queryTaskById(int taskId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<TPlan> queryPlanById(int begin, int end, int taskId) {
        // TODO Auto-generated method stub
        map.put("start", begin);
        map.put("end", end);
        map.put("No", taskId);
        return planDao2.selectByPageExample1(map);
    }

}
