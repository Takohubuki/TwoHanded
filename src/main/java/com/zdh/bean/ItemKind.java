package com.zdh.bean;

import java.io.Serializable;

/**
 * item_kind
 * @author 
 */
public class ItemKind implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String kindName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKindName() {
        return kindName;
    }

    public void setKindName(String kindName) {
        this.kindName = kindName;
    }
}