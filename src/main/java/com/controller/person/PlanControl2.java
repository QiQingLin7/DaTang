package com.controller.person;

import com.entity.TPlan;
import com.entity.TTask;
import com.mapper.ITaskDao2;
import com.service.IPlanService2;
import com.util.PageBean;
import com.util.PlanDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

public class PlanControl2 {
    @Resource
    ITaskDao2 taskDao2;
    @Autowired
    IPlanService2 planService2;

    public PlanControl2() {
        System.out.println("实例化控制器！！！");
    }

    @RequestMapping("/plan_list.do")
    public String selectAll(Model model, String pageNo1, String pageSize1) {
        int pageNo = 1;
        int pageSize = 4;
        if (!(pageNo1 == null || "".equals(pageNo1.trim()))) {

            pageNo = Integer.parseInt(pageNo1);
        }
        if (!(pageSize1 == null || "".equals(pageSize1.trim()))) {
            pageSize = Integer.parseInt(pageSize1);
        }
        List<TPlan> allPlan = this.planService2.query(pageNo, pageSize);
        for (TPlan tPlan : allPlan) {
            TTask task = taskDao2.selectByPrimaryKey(tPlan.getTaskId());
            tPlan.setTask(task);
        }
        PageBean<TPlan> pb = new PageBean<TPlan>();
        pb.setData(allPlan);
        pb.setPageNo(pageNo);
        pb.setPageSize(pageSize);
        pb.setTotalRecords(this.planService2.selectCount());
        model.addAttribute("all", pb);
        PlanDTO dto = new PlanDTO();
        List<TTask> allTask = this.taskDao2.selectByExample(null);
        model.addAttribute("flag", "all");

        model.addAttribute("dto", dto);
        model.addAttribute("allTask", allTask);
        return "person/checkpro";
    }

    @RequestMapping("/plan_query.do")
    public String advanceQuery(@ModelAttribute("dto") PlanDTO dto,
                               Model model, String pageNo1, String pageSize1) {
        int pageNo = 1;
        int pageSize = 4;
        if (!(pageNo1 == null || "".equals(pageNo1.trim()))) {

            pageNo = Integer.parseInt(pageNo1);
        }
        if (!(pageSize1 == null || "".equals(pageSize1.trim()))) {
            pageSize = Integer.parseInt(pageSize1);
        }

        List<TPlan> plans = this.planService2.advanceQuery(dto, pageNo, pageSize);
        for (TPlan tPlan : plans) {
            TTask task = taskDao2.selectByPrimaryKey(tPlan.getTaskId());
            tPlan.setTask(task);
        }
        PageBean<TPlan> pb = new PageBean<TPlan>();
        pb.setData(plans);
        pb.setPageNo(pageNo);
        pb.setPageSize(pageSize);
        pb.setTotalRecords(this.planService2.advanceQueryCount(dto));
        model.addAttribute("all", pb);

        model.addAttribute("flag", "adv");
        List<TTask> allTask = this.taskDao2.selectByExample(null);
        model.addAttribute("allTask", allTask);
        return "person/checkpro";
    }

    @RequestMapping("/feedback_input")
    public String feedback_input(@ModelAttribute("planId") int planId,
                                 Model model) {

        TPlan plan = this.planService2.queryById(planId);

        model.addAttribute("single", plan);
        model.addAttribute("feedback", plan);
        return "person/feedback";
    }

    @RequestMapping("/feedback.do")
    public String feedback(@ModelAttribute("feedback") TPlan plan,
                           @ModelAttribute("planId") int planId) {
        this.planService2.updatePlan(plan, planId);
        return "redirect:/plan_list.do";
    }
}
