package com.school.p1;

public class Records{
	private int rollNumber;
	private String name;
	private String standard;
	private String section;
	
	public int getRollNumber(){
		return rollNumber;
	}
	public String getName(){
		return name;
	}
	public String getStandard(){
		return standard;
	}
	public String getSection(){
		return section;
	}
	
	public void setRollNumber(int rollNumber){
		this.rollNumber = rollNumber;
	}
	public void setName(String name){
		this.name = name;
	}
	public void setStandard(String standard){
		this.standard = standard;
	}
	public void setSection(String section){
		this.section = section;
	}
}
