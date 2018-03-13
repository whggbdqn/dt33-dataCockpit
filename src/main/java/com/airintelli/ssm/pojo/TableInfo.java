package com.airintelli.ssm.pojo;

import java.util.Date;

public class TableInfo {
    private Integer id;

    private String name;

    private Date updatetime;

    private String physicaltablename;
    private Integer state;
	private Integer cid;
    private String showtype;

    public String getShowtype() {
		return showtype;
	}

	public void setShowtype(String showtype) {
		this.showtype = showtype;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getPhysicaltablename() {
        return physicaltablename;
    }

    public void setPhysicaltablename(String physicaltablename) {
        this.physicaltablename = physicaltablename == null ? null : physicaltablename.trim();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
    public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
}