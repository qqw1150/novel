package com.luowenit.domain.assist;

import com.luowenit.dao.UserDao;
import com.luowenit.domain.User;
import com.luowenit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import javax.servlet.http.HttpSession;
import java.util.Objects;

public class UserValidator implements Validator {
    private UserService userService;
    private HttpSession session;

    public UserValidator(UserService userService, HttpSession session) {
        this.userService = userService;
        this.session = session;
    }

    public UserValidator() {
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(@Nullable Object o, Errors errors) {
        User user = (User) o;
        ValidationUtils.rejectIfEmpty(errors, "username", null, "用户名为空");
        ValidationUtils.rejectIfEmpty(errors, "password", null, "密码为空");
        ValidationUtils.rejectIfEmpty(errors, "valicode", null, "验证码为空");

        User u = userService.getOneByUsername(user.getUsername());
        if(!Objects.isNull(u)){
            errors.rejectValue("username",null,"用户名已存在");
        }

        String code = (String) session.getAttribute("verificationCode");
        if (!code.toUpperCase().equals(user.getValicode().trim().toUpperCase())) {
            errors.rejectValue("valicode",null,"验证码不正确");
        }
    }
}
