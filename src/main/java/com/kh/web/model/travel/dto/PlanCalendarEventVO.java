package com.kh.web.model.travel.dto;

public class PlanCalendarEventVO {
	private String title;
	private String id;
	private String start;
	private String end;
	private String className;
	private String allDay;

	public PlanCalendarEventVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlanCalendarEventVO(String title, String id, String start, String end, String className, String allDay) {
		super();
		this.title = title;
		this.id = id;
		this.start = start;
		this.end = end;
		this.className = className;
		this.allDay = allDay;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	@Override
	public String toString() {
		return "PlanCalendarEventVO [title=" + title + ", id=" + id + ", start=" + start + ", end=" + end
				+ ", className=" + className + ", allDay=" + allDay + "]";
	}

}
