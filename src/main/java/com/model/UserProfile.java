package com.model;

public class UserProfile {
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String education;
    private String experience;
    private String skills;
    private String linkedin;
    private String dob;
    private double cgpa;
    private int backlogs;
    private int enrollmentYear;
    private int passoutYear;
    private String sex;

    // Constructor
    public UserProfile(String fullName, String email, String phone, String address, String education, String experience, String skills, String linkedin, String dob, double cgpa, int backlogs, int enrollmentYear, int passoutYear, String sex) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.education = education;
        this.experience = experience;
        this.skills = skills;
        this.linkedin = linkedin;
        this.dob = dob;
        this.cgpa = cgpa;
        this.backlogs = backlogs;
        this.enrollmentYear = enrollmentYear;
        this.passoutYear = passoutYear;
        this.sex = sex;
    }

    // Default Constructor
    public UserProfile() {
    }

    // Getters and Setters for all fields
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getEducation() { return education; }
    public void setEducation(String education) { this.education = education; }

    public String getExperience() { return experience; }
    public void setExperience(String experience) { this.experience = experience; }

    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }

    public String getLinkedIn() { return linkedin; }
    public void setLinkedIn(String linkedin) { this.linkedin = linkedin; }

    public String getDateOfBirth() { return dob; }
    public void setDateOfBirth(String dob) { this.dob = dob; }

    public double getCgpa() { return cgpa; }
    public void setCgpa(double cgpa) { this.cgpa = cgpa; }

    public int getBacklogs() { return backlogs; }
    public void setBacklogs(int backlogs) { this.backlogs = backlogs; }

    public int getEnrollmentYear() { return enrollmentYear; }
    public void setEnrollmentYear(int enrollmentYear) { this.enrollmentYear = enrollmentYear; }

    public int getPassoutYear() { return passoutYear; }
    public void setPassoutYear(int passoutYear) { this.passoutYear = passoutYear; }

    public String getSex() { return sex; }
    public void setSex(String sex) { this.sex = sex; }
}
