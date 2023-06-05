package com.example.trakker.model.trip.dto;


import java.util.Date;

public class TripDTO {
    private int t_num;
    private String t_subject;
    private String content;
    private int readcount;
    private Date t_date;

    public int getT_num() {
        return t_num;
    }

    public void setT_num(int t_num) {
        this.t_num = t_num;
    }

    public String getT_subject() {
        return t_subject;
    }

    public void setT_subject(String t_subject) {
        this.t_subject = t_subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getReadcount() {
        return readcount;
    }

    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }

    public Date getT_date() {
        return t_date;
    }

    public void setT_date(Date t_date) {
        this.t_date = t_date;
    }

    @Override
    public String toString() {
        return "TripDTO{" +
                "t_num=" + t_num +
                ", t_subject='" + t_subject + '\'' +
                ", content='" + content + '\'' +
                ", readcount=" + readcount +
                ", t_date=" + t_date +
                '}';
    }

    public TripDTO(int t_num, String t_subject, String content, int readcount, Date t_date) {
        this.t_num = t_num;
        this.t_subject = t_subject;
        this.content = content;
        this.readcount = readcount;
        this.t_date = t_date;
    }
    public TripDTO() {

    }

}
