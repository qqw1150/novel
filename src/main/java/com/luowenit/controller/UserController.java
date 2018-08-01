package com.luowenit.controller;

import com.luowenit.domain.User;
import com.luowenit.domain.assist.UserValidator;
import com.luowenit.service.UserService;
import com.luowenit.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static com.luowenit.utils.HttpUtil.isMobile;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(@ModelAttribute User user, Model model, BindingResult result, HttpServletRequest request, HttpSession session) {
        session.removeAttribute("errors");
        UserValidator userValidator = new UserValidator();
        userValidator.validate(user,result);

        User loginUser = userService.login(user);
        if (Objects.isNull(loginUser)) {
           result.addError(new ObjectError("password","用户名或密码不正确"));
        }

        if(result.hasErrors()){
            List<ObjectError> allErrors = result.getAllErrors();
            model.addAttribute("errors", allErrors);
            if (!isMobile(request)) {
                session.setAttribute("errors",allErrors);
                return "redirect:/index.html";
            } else {
                return "mobile/login";
            }
        }

        session.setAttribute("user", loginUser);
        return "redirect:/index.html";
    }

    @RequestMapping(value = "/go_register.do", method = RequestMethod.GET)
    public String go_register(HttpServletRequest request) {
        if (!isMobile(request)) {
            return "pc/register";
        } else {
            return "mobile/register";
        }
    }

    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public String register(@ModelAttribute User user, BindingResult result, Model model,HttpSession session,HttpServletRequest request) {

        UserValidator userValidator = new UserValidator(userService,session);
        userValidator.validate(user,result);

        if(result.hasErrors()){
            List<ObjectError> allErrors = result.getAllErrors();
            model.addAttribute("errors", allErrors);
            if (!isMobile(request)) {
                return "pc/register";
            } else {
                return "mobile/register";
            }
        }

        userService.addOne(user);
        User loginUser = userService.login(user);
        session.setAttribute("user", loginUser);
        return "redirect:/index.html";
    }

    @RequestMapping(value = "/verify_code.do")
    public void verifyCode(HttpServletResponse response, HttpSession session) throws IOException {
        VerifyCode verifyCode = new VerifyCode();
        BufferedImage image = verifyCode.createImage();
        session.setAttribute("verificationCode", verifyCode.getText());
        ImageIO.write(image, "jpg", response.getOutputStream());
    }

    @RequestMapping(value = "/logout.do")
    public String logout(HttpSession session, HttpServletRequest request) {
        session.invalidate();
        return "redirect:" + request.getHeader("referer");
    }

    @RequestMapping(value = "/to_login.do")
    public String to_login() {
        return "mobile/login";
    }

}
