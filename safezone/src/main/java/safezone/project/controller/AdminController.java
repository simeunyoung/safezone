package safezone.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import safezone.project.service.UserService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private UserService service;
    
    @RequestMapping("/admin")
    public String admin() {
    	return "admin/admin";
    }
    
    @RequestMapping("/adminList")
    public String adminList() {
    	return "admin/adminList";
    }
    
    @RequestMapping("/adminJoin")
    public String adminJoin(Model model) {
    	model.addAttribute("statu", 2);
    	return "user/sign";
    }
    
    @RequestMapping("/inquiry")
    public String notice() {
    	return "admin/noticeWrite";
    }
}
