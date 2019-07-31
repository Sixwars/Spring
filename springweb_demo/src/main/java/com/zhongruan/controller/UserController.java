package com.zhongruan.controller;
import com.zhongruan.dao.IUserDao;
import com.zhongruan.entity.User;
import com.zhongruan.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IUserDao userDao;


    @RequestMapping("/home")
    public String home(){
        return "home";

    }
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(User user, Model model, HttpServletRequest request){
        User db_user =userService.getById(user);
        if (db_user ==null){
            model.addAttribute("msg","不存在用户");
            return "login";
        }
        if(!db_user.getPassword().equals(user.getPassword())){
            model.addAttribute("msg","账号或密码错误");
            return "login";
        }

        HttpSession session =request.getSession();
        session.setAttribute("user",user);
        return ("index");
    }
    @RequestMapping("/toUpdate")
    public String toUpdate(Model model) {
        return "update";
    }
    @RequestMapping("update")
    public String update(Model model, User user) {
        int flag = userService.updateById(user);
        if (flag == 1) {
            model.addAttribute("user", user);
            model.addAttribute("msg", "成功了");
        }
        if (flag == 0) {
            model.addAttribute("msg", "失败了");
        }
        return "update";
    }
    @RequestMapping("list")
    public String list (Model model) {
        List<User> userList =userService.getList();
        model.addAttribute("userList",userList);
        return "user-list";
    }
    @RequestMapping("toAdd")
    public String toAdd () {
    	return "addUser";
    }
    @RequestMapping("add")
    public String add (User user) {

        userService.add(user);

        return "redirect:/list";

    }
    @RequestMapping("/delete")
    @ResponseBody
    public Map delete (@RequestParam("id") Integer userid) {

       int flag= userService.deleteUserById(userService.queryById(userid));
       if (flag==0){
           Map<String,Object> map =new HashMap<>();
            map.put("msg","FAIL");
            map.put("code",1);
            return map;
       }
        Map<String,Object> map =new HashMap<>();
        map.put("msg","success");
        map.put("code",0);
        return map;

    }
    @RequestMapping("/jsonTest")
    @ResponseBody
    public Map jsonTest (@RequestParam ("id") Integer submitid) {
        System.out.println(submitid);
        Map map =new HashMap<>();
    	map.put("msg","success");
    	map.put("data","more info");
    	return map;
    }
    @RequestMapping("toAjaxTest")
    public String toAjaxTest () {

    	return "ajaxTest";
    }

    @RequestMapping("delUsersByIds")
    @ResponseBody
    public Map delUsersByIds (@RequestParam ("ids[]") Long[] a_ids) {

       int flag=userService.delByIds(a_ids);
        if (flag==0){
            Map map =new HashMap<>();
            map.put("msg","FAIL");
            map.put("code",1);
            return map;
        }
        Map  map =new HashMap<>();
        map.put("msg","success");
        map.put("code",0);
        return map;
    }


}
