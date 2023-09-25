package safezone.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import safezone.project.component.UserDTO;
import safezone.project.service.UserService;

@Controller
@RequestMapping("/cs/*")
public class AdminController {

	@Autowired
	private UserService service;
    
    @RequestMapping("/admin")
    public String admin() {
    	return "admin/admin";
    }
    
    @RequestMapping("/notice")
    public String notice() {
    	return "admin/notice";
    }
}
