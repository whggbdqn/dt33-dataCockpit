package com.airintelli.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author junwen.bao@airintelli.com
 * @Time：2017年8月1日 下午12:03:27
 * @version 1.0
 */
@Controller
public class IndexController
{
    @RequestMapping("index")
    public String index()
    {
        return "forward:/login/loginHandler.action";
    }
}
