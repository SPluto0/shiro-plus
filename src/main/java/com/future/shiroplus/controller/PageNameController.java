package com.future.shiroplus.controller;

import com.future.shiroplus.domain.entity.Work;
import com.future.shiroplus.domain.entity.WorkPageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;


@Controller
public class PageNameController {

    @GetMapping("/{pageName}.html")
    public String pageName(@PathVariable("pageName") String pageName) {
        return pageName;
    }

    static Work work = new Work();

    static {
        work.setWorkId(1);
        work.setWorkName("作业");
        work.setCourseId(1);
        work.setCreateTime(new Date());
        work.setDeptId(1);
        work.setFlag(1);
        work.setRemark("测试");
        work.setUpdateTime(new Date());
        work.setAccessoryUrl("http://127.0.0.1:8080/work/list.html");
        work.setActualCount(1);
        work.setActualTakingTime(new Date());
        work.setContent("内容");
        work.setTakingTime(new Date());
        work.setStatus(5);
        work.setTeacherName("王老师");
        work.setCourseName("JAV");
    }

    @GetMapping("/{pageName}/{pageNameTow}.html")
    public ModelAndView pageNameTwo(@PathVariable("pageName") String pageName, @PathVariable("pageNameTow") String pageNameTow) {
        ModelAndView map = new ModelAndView(pageName + "/" + pageNameTow);
        if ("work".equals(pageName) && "list".equals(pageNameTow)) {
            WorkPageInfo workPageInfo = new WorkPageInfo();
            ArrayList<Work> list = new ArrayList<>();
            list.add(work);
            workPageInfo.setList(list);
            map.addObject("workPageInfo", workPageInfo);
        }
        return map;
    }
}
