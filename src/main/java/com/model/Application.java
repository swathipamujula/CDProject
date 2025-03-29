package com.model;

import java.util.Date;

public class Application {
    private int applicationId;
    private int userId;
    private int jobId;
    private Date applicationDate;
    private String status;

    // Constructor
    public Application(int applicationId, int userId, int jobId, Date applicationDate, String status) {
        this.applicationId = applicationId;
        this.userId = userId;
        this.jobId = jobId;
        this.applicationDate = applicationDate;
        this.status = status;
    }

    // Getters and Setters
    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public Date getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(Date applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
