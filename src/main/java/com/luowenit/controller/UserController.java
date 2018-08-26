package com.luowenit.controller;

import com.alibaba.fastjson.JSON;
import com.luowenit.domain.User;
import com.luowenit.domain.UserFiction;
import com.luowenit.domain.assist.Pager;
import com.luowenit.domain.assist.UserValidator;
import com.luowenit.service.UserFicitonService;
import com.luowenit.service.UserService;
import com.luowenit.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private UserFicitonService userFicitonService;

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

        String lastUrl;
        if (!isMobile(request)) {
             lastUrl = request.getHeader("Referer");
        }else{
             lastUrl = (String) session.getAttribute("lastUrl");
        }
        if("".equals(lastUrl) || Objects.isNull(lastUrl)){
            return "redirect:/index.html";
        }

        return "redirect:"+lastUrl;
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
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping(value = "/to_login.do")
    public String to_login(HttpServletRequest request,HttpSession session) {
        String str = request.getHeader("Referer");
        session.setAttribute("lastUrl",str);
        return "mobile/login";
    }

    @RequestMapping(value = "/prop.do")
    public void addUserProperties(int fontSize, int pageWidth, int theme, String fontType, String pageBar, HttpSession session){
        session.setAttribute("fontSize",fontSize);
        session.setAttribute("pageWidth",pageWidth);
        session.setAttribute("theme",theme);
        session.setAttribute("fontType",fontType);
        session.setAttribute("pageBar",pageBar);
    }

    @RequestMapping(value = "/shelf.do",produces = "application/json;charset=utf-8")
    public @ResponseBody String shelf(int fiction_id, int chapter_id, int chapter_num , HttpSession session){
        User user = (User) session.getAttribute("user");
        if(!Objects.isNull(user)){
            UserFiction userFiction = userService.getShelf(user.getId(),fiction_id,chapter_id,chapter_num);
            if(Objects.isNull(userFiction)){
                userService.addShelf(user.getId(),fiction_id,chapter_id,chapter_num);
            }else{
                userService.updateShelf(user.getId(),fiction_id,chapter_id,chapter_num);
            }
            return "{\"error\":0,\"msg\":\"加入成功\"}";
        }
        return "{\"error\":1,\"msg\":\"请先登录\"}";
    }

    @RequestMapping(value = "/{page}/to_shelf.do")
    public String to_shelf(@PathVariable int page, Model model,HttpSession session,HttpServletRequest request){
        User user = (User) session.getAttribute("user");
        if(Objects.isNull(user)){
            model.addAttribute("error","1");
        }else{
            Pager pager = (Pager) session.getAttribute("pager");
            if (Objects.isNull(pager)) {
                pager = new Pager(1, 10, "/#page#/to_shelf.html");
                session.setAttribute("pager",pager);
            }
            pager.setBaseUrl("/#page#/to_shelf.html");
            pager.setPageIndex(page);

            List<UserFiction> allByUser = userFicitonService.getAllByUser(user.getId(),pager);
            model.addAttribute("list", allByUser);

            UserFiction top = (UserFiction) session.getAttribute("top");
            if(Objects.isNull(top)){
                top = userFicitonService.getTop(user.getId());
                if(!Objects.isNull(top)){
                    session.setAttribute("top",top);
                    pager.setTotal(pager.getTotal()+1);
                }
            }else{
                pager.setTotal(pager.getTotal()+1);
            }
            model.addAttribute("pager", pager);
            model.addAttribute("total", pager.getTotal());
            model.addAttribute("top",top);

        }

        return "pc/shelf";
    }

    @RequestMapping(value = "/setTop.do")
    public String setTop(@RequestParam int id,HttpSession session){
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/#page#/to_shelf.html");
            session.setAttribute("pager",pager);
        }
        User user = (User) session.getAttribute("user");

        userFicitonService.setTop(user.getId(),id);
        return "redirect:/"+pager.getPageIndex()+"/to_shelf.html";
    }

    @RequestMapping(value = "/cancelTop.do")
    public String cancelTop(HttpSession session){
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/#page#/to_shelf.html");
            session.setAttribute("pager",pager);
        }
        User user = (User) session.getAttribute("user");
        userFicitonService.cancelTop(user.getId());
        session.removeAttribute("top");
        return "redirect:/"+pager.getPageIndex()+"/to_shelf.html";
    }

    @RequestMapping(value = "/delShelf.do")
    public String deleteShelf(HttpSession session,@RequestParam int id){
        Pager pager = (Pager) session.getAttribute("pager");
        if (Objects.isNull(pager)) {
            pager = new Pager(1, 10, "/#page#/to_shelf.html");
            session.setAttribute("pager",pager);
        }
        User user = (User) session.getAttribute("user");
        userFicitonService.deleteOne(user.getId(),id);
        return "redirect:/"+pager.getPageIndex()+"/to_shelf.html";
    }


}
