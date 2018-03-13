package com.airintelli.ssm.pojo;

import java.util.Date;

public class AnalysisTasks
{
    private Integer id; // 编号
    
    private Date startTime; // 开始时间
    
    private Date endTime; // 结束时间
    
    private Integer did; // 关系关联编号
    
    private Integer cid; // 企业编号
    
    private Integer taskStatus; // 任务状态 已添加:0,进行中:1，完成:2,失败:-1
    
    private String rule; // 规则
    
    private Integer feedBack; // 反馈
    
    private Integer arithmeticid; // 算法编号
    
    public Integer getCid()
    {
        return cid;
    }
    
    public void setCid(Integer cid)
    {
        this.cid = cid;
    }
    
    public Integer getId()
    {
        return id;
    }
    
    public void setId(Integer id)
    {
        this.id = id;
    }
    
    public Date getStartTime()
    {
        return startTime;
    }
    
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }
    
    public Date getEndTime()
    {
        return endTime;
    }
    
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }
    
    public Integer getDid()
    {
        return did;
    }
    
    public void setDid(Integer did)
    {
        this.did = did;
    }
    
    public Integer getTaskStatus()
    {
        return taskStatus;
    }
    
    public void setTaskStatus(Integer taskStatus)
    {
        this.taskStatus = taskStatus;
    }
    
    public String getRule()
    {
        return rule;
    }
    
    public void setRule(String rule)
    {
        this.rule = rule;
    }
    
    public Integer getFeedBack()
    {
        return feedBack;
    }
    
    public void setFeedBack(Integer feedBack)
    {
        this.feedBack = feedBack;
    }
    
    public Integer getArithmeticid()
    {
        return arithmeticid;
    }
    
    public void setArithmeticid(Integer arithmeticid)
    {
        this.arithmeticid = arithmeticid;
    }
}
