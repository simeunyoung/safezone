package safezone.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SafezoneController {

	
	@RequestMapping("main")
	public String main(HttpSession session, Model model) {
		String memId = (String)session.getAttribute("memId");
		model.addAttribute("memId", memId);
		return "/main";
	}
	
}
