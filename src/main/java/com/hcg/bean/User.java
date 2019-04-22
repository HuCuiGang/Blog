package com.hcg.bean;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Table(name = "user")
public class User implements Serializable {

    private static final Integer USER_STATUS_NORMAL=0;
    private static final Integer USER_STATUS_LOCKING=1;
    private static final Integer USER_STATUS_DELETE=2;

    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    private Integer userId;

    private String username;

    private String nickname;

    private String password;

    private Integer age;

    private String gender;

    private String phone;

    private String email;

    private String salt;

    private Date created;

    private Date updated;

    @Column(name = "last_login_time")
    private Date lastLoginTime;

    private String description;

    @Column(name = "user_status")
    private String userStatus;

    public static Integer getUserStatusNormal() {
        return USER_STATUS_NORMAL;
    }

    public static Integer getUserStatusLocking() {
        return USER_STATUS_LOCKING;
    }

    public static Integer getUserStatusDelete() {
        return USER_STATUS_DELETE;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }
}
