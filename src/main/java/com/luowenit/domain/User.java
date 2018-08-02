package com.luowenit.domain;


import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 用户类
 */
public class User implements Serializable {
    private int id;
    @NotEmpty(message = "用户名不能为空")
    private String username;
    @NotNull(message = "密码不能为空")
    @Min(value = 6,message = "密码长度最少6位")
    private String password;
    private String icon;
    @NotNull(message = "验证码不能为空")
    private String valicode;

    public void setId(int id) {
        this.id = id;
    }

    public String getValicode() {
        return valicode;
    }

    public void setValicode(String valicode) {
        this.valicode = valicode;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", icon='" + icon + '\'' +
                '}';
    }
}
