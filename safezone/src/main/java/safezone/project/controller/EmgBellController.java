package safezone.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import safezone.project.service.BellService;

@Controller
@RequestMapping("/map")
public class EmgBellController {
	
	@Autowired
	private BellService service;
	
	@RequestMapping("/main")
	public String mainMap() {
		service.bellApi();
		return "/emgMap/emgMap";
	}
	
}
