package com.asiainfo.model;
/**
 * @author wenhong
 */
public class Competence {
	private int id; // 编号
	private int pId; // 父节点
	private String name; // 节点名称
	private int isParent; // 是否父节点：1是父节点
	private int open; // 是否打开：1要打开

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIsParent() {
		return isParent;
	}

	public void setIsParent(int isParent) {
		this.isParent = isParent;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

}
