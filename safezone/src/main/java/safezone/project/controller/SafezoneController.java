package safezone.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SafezoneController {

	
	@RequestMapping("main")
	public String main() {
		return "/main";
	}
	
}
