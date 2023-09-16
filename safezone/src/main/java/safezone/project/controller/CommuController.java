package safezone.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import safezone.project.component.CommuDTO;
import safezone.project.service.CommuService;

@Controller
@RequestMapping("/community")
public class CommuController {
	
	@Autowired
	private CommuService service;
	
	@RequestMapping("/home")
	public String commuHome() {
		return "/community/commuList";
	}
	
	@RequestMapping("/form")
	public String commuForm() {
		return "/community/commuWrite";
	}
	
	@RequestMapping("/submitForm")
	public void submitForm(CommuDTO dto) {
		System.out.println(dto.toString());
		//service.insertCommu(dto);
	}
}
