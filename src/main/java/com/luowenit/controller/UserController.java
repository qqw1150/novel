package com.luowenit.controller;

import com.luowenit.domain.User;
import com.luowenit.service.UserService;
import com.luowenit.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Objects;

import static com.luowenit.utils.HttpUtil.isMobile;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(@ModelAttribute User user, Model model, HttpSession session, HttpServletRequest request) {
        session.removeAttribute("errmsg");
        if ("".equals(user.getUsername())) {
            session.setAttribute("errmsg", "用户名不能为空");
            return "redirect:" + request.getHeader("Referer");
        }

        if ("".equals(user.getPassword())) {
            session.setAttribute("errmsg", "密码不能为空");
            return "redirect:" + request.getHeader("Referer");
        }

        User loginUser = userService.login(user);
        if (loginUser == null) {
            session.setAttribute("errmsg", "用户名或密码错误");
            return "redirect:" + request.getHeader("Referer");
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
    public String register(@ModelAttribute User user, @RequestParam String verificationCode, HttpSession session,RedirectAttributes attributes) {
        session.removeAttribute("registerErrmsg");
        if("".equals(user.getUsername()) || Objects.isNull(user.getUsername())){
            session.setAttribute("registerErrmsg", "用户名不能为空");
            return "redirect:/go_register.html";
        }

        if("".equals(user.getPassword()) || Objects.isNull(user.getPassword())){
            session.setAttribute("registerErrmsg", "密码不能为空");
            return "redirect:/go_register.html";
        }

        String code = (String) session.getAttribute("verificationCode");
        if (!code.toUpperCase().equals(verificationCode.trim().toUpperCase())) {
            session.setAttribute("registerErrmsg", "验证码不正确");
            return "redirect:/go_register.html";
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


}
