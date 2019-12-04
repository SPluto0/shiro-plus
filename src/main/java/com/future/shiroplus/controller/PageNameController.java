package com.future.shiroplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @Date 2019/11/29 15:11
 */
@Controller
public class PageNameController {
    @GetMapping("/{pageName}.html")
    public String pageName(@PathVariable("pageName")String pageName){
        return pageName;
    }

    @GetMapping("/{pageName}/{pageNameTow}.html")
    public String pageNameTwo(@PathVariable("pageName") String pageName,@PathVariable("pageNameTow") String pageNameTow){
        return pageName+"/"+ pageNameTow;
    }
}
