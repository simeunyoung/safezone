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
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService service;
    
    @RequestMapping("/login")
    public String login() {
    	return "user/login";
    }
    
    @RequestMapping("/loginPro")
    public @ResponseBody String loginPro(UserDTO dto, HttpSession session) {
    	String result = "0";
    	String dpw = service.checkUser(dto);
    	if(dpw==null) {
    		result = "1";
    	}else if(dpw.equals(dto.getPw())){
    		result = "2";
    		session.setAttribute("memId", dto.getEmail());
    	}
    	return result;
    }
    
    @RequestMapping("/logout")
  	public String logout(HttpSession session) {
  	    session.removeAttribute("memId");
  		return "redirect:/main";
  	}
    
    @RequestMapping("/sign")
    public String sign() {
    	return "user/sign";
    }
    
    @RequestMapping("/signPro")
    public @ResponseBody String signPro(UserDTO dto, HttpSession session) {
    	String result = "0";
    	String pw = service.checkUser(dto);
    	boolean check = false;
    	if(pw==null) {
    		check = true;
    	}
    	if (check){
    		service.insertUser(dto);
  	        result = "1";
  	        session.setAttribute("memId", dto.getEmail());
  	    }else{
  	    	result = "0";
  	    }
    	return result;
    }
    
    @RequestMapping("/findEmail")
    public String findEmail() {
    	return "user/findEmail";
    }
    
    @RequestMapping("/findEmailPro")
    public @ResponseBody String findEmailPro(UserDTO dto) {
    	String result = service.findEmail(dto);
    	return result;
    }
    
    @RequestMapping("/findPw")
    public String findPw() {
    	return "user/findPw";
    }
    
    @RequestMapping("/findPwPro")
    public @ResponseBody String findPwPro(UserDTO dto) {
    	String result = service.checkUser(dto);
    	System.out.println(result);
    	return result;
    }
}
