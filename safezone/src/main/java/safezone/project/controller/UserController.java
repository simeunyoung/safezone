package safezone.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import safezone.project.service.SafetyZoneService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private SafetyZoneService service;
    
    @RequestMapping("login")
    public String login() {
    	return "user/login";
    }
    
    @RequestMapping("loginPro")
    public String loginPro() {
    	
    	return "redirect:/main";
    }
}
